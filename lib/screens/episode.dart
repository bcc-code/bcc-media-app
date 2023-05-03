// ignore_for_file: exhaustive_keys
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/components/episode/episode_info.dart';
import 'package:brunstadtv_app/components/episode/episode_related.dart';
import 'package:brunstadtv_app/components/episode/episode_season.dart';
import 'package:brunstadtv_app/components/episode/player_poster.dart';
import 'package:brunstadtv_app/components/error_generic.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/components/share_episode_sheet.dart';
import 'package:brunstadtv_app/providers/lesson_progress_provider.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/brunstadtv.dart';
import '../components/custom_back_button.dart';
import '../components/episode/episode_tabs.dart';
import '../components/episode/player_error.dart';
import '../components/episode_details.dart';
import '../components/error_no_access.dart';
import '../components/option_list.dart';
import '../components/study_button.dart';
import '../env/env.dart';
import '../graphql/queries/studies.graphql.dart';
import '../helpers/insets.dart';
import '../theme/design_system/design_system.dart';

import '../helpers/utils.dart';
import '../helpers/extensions.dart';
import '../l10n/app_localizations.dart';

class EpisodeScreen extends HookConsumerWidget {
  final String episodeId;
  final bool? autoplay;
  final int? queryParamStartPosition;
  final bool? hideBottomSection;
  const EpisodeScreen({
    super.key,
    @PathParam() required this.episodeId,
    @QueryParam() this.autoplay,
    @QueryParam('t') this.queryParamStartPosition,
    @QueryParam('hide_bottom_section') this.hideBottomSection,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to route animation status
    final scrollController = useScrollController();
    final modalRoute = ModalRoute.of(context);
    final routeAnimationStatus = useState<AnimationStatus?>(null);
    useEffect(() {
      void routeAnimationStatusListener(AnimationStatus status) {
        routeAnimationStatus.value = status;
      }

      modalRoute?.animation?.addStatusListener(routeAnimationStatusListener);
      return () => modalRoute?.animation?.removeStatusListener(routeAnimationStatusListener);
    }, [modalRoute]);

    // Fetch the episode when needed
    final episodeFuture = useState<Future<Query$FetchEpisode$episode?>?>(null);
    fetchCurrentEpisode() {
      episodeFuture.value = ref.read(apiProvider).fetchEpisode(episodeId.toString());
    }

    useEffect(() {
      fetchCurrentEpisode();
      return null;
    }, [episodeId, queryParamStartPosition]);

    final episodeSnapshot = useFuture(episodeFuture.value);

    Widget? child;
    if (episodeSnapshot.hasError && episodeSnapshot.connectionState == ConnectionState.done) {
      var noAccess = episodeSnapshot.error
          .asOrNull<OperationException>()
          ?.graphqlErrors
          .any((err) => err.extensions?['code'] == ApiErrorCodes.noAccess || err.extensions?['code'] == ApiErrorCodes.notPublished);
      if (noAccess == true) {
        child = const ErrorNoAccess();
      }
      child = SliverFillRemaining(child: ErrorGeneric(onRetry: fetchCurrentEpisode));
    } else if (episodeSnapshot.data == null || routeAnimationStatus.value == AnimationStatus.forward) {
      child = const SliverFillRemaining(child: _LoadingWidget());
    } else {
      child = SliverToBoxAdapter(
        child: _EpisodeDisplay(
          screenParams: this,
          episodeFuture: episodeFuture.value,
          scrollController: scrollController,
        ),
      );
    }
    return SelectionArea(
      child: Scaffold(
        appBar: ScreenInsetAppBar(
          appBar: AppBar(
            leadingWidth: 92,
            leading: const CustomBackButton(padding: kIsWeb ? EdgeInsets.zero : null),
            title: Text(episodeSnapshot.data?.season?.$show.title ?? episodeSnapshot.data?.title ?? ''),
            actions: const [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16.0),
                child: SizedBox(width: 24, child: BccmCastButton()),
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          slivers: [
            SliverPadding(
              padding: screenInsets(context),
              sliver: child,
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(aspectRatio: 16 / 9, child: Container(color: DesignSystem.of(context).colors.background2)),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoadingIndicator(),
              const SizedBox(height: 12),
              Text(S.of(context).loading, style: DesignSystem.of(context).textStyles.body2),
            ],
          ),
        ),
      ],
    );
  }
}

class _EpisodeDisplay extends HookConsumerWidget {
  const _EpisodeDisplay({
    required this.screenParams,
    required this.episodeFuture,
    required this.scrollController,
  });

  final EpisodeScreen screenParams;
  final Future<Query$FetchEpisode$episode?>? episodeFuture;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final episodeSnapshot = useFuture(episodeFuture);
    final episode = episodeSnapshot.data;
    var player = ref.watch(primaryPlayerProvider);
    if (player == null || episode == null) return const SizedBox.shrink();

    final playerSetupFuture = useState<Future?>(null);
    Future setupPlayer() {
      return playerSetupFuture.value = setupPlayerForEpisode(episode, ref: ref);
    }

    final playerSetupSnapshot = useFuture(playerSetupFuture.value);
    final episodeIsCurrentItem = player.currentMediaItem?.metadata?.extras?['id'] == episode.id;

    useEffect(() {
      if (screenParams.autoplay == true && !episodeIsCurrentItem) {
        setupPlayer();
      }
      return null;
    }, [episode.id, screenParams.autoplay, screenParams.queryParamStartPosition]);

    // Fetch lesson progress
    final lessonProgressFuture = useState<Future<Query$GetEpisodeLessonProgress?>?>(null);
    final hasStudy = episode.lessons.items.isNotEmpty;
    useEffect(() {
      if (!hasStudy) return null;
      lessonProgressFuture.value = ref.read(lessonProgressCacheProvider.notifier).loadLessonProgressForEpisode(episode.id);
      return null;
    }, [episode.id]);

    // Scroll to top when relevant
    final scrollCompleter = useState<Completer<void>?>(null);
    final isScrolling = scrollCompleter.value?.isCompleted == false;

    void scrollToTop() {
      scrollCompleter.value = wrapInCompleter(
        scrollController.animateTo(0, duration: const Duration(milliseconds: 600), curve: Curves.easeOutExpo),
      );
    }

    useEffect(() {
      if (!scrollController.hasClients || isScrolling) return;
      scrollToTop();
      return null;
    }, [screenParams.hideBottomSection, screenParams.queryParamStartPosition]);

    // Start playing when chromecast disconnects
    final castSessionUnavailableStream = ref.watch(chromecastEventStreamProvider).on<CastSessionUnavailable>();
    useEffect(() {
      final subscription = castSessionUnavailableStream.listen((event) {
        var player = ref.read(primaryPlayerProvider);
        ref.read(playbackServiceProvider).playEpisode(
              playerId: player!.playerId,
              autoplay: false,
              episode: episode,
              playbackPositionMs: event.playbackPositionMs,
            );
      });
      return () => subscription.cancel();
    }, [castSessionUnavailableStream]);

    final showLoadingOverlay = (episodeSnapshot.connectionState == ConnectionState.waiting);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Column(
              children: [
                if (!episodeIsCurrentItem && playerSetupSnapshot.hasError && playerSetupSnapshot.connectionState != ConnectionState.waiting)
                  PlayerError(
                    imageUrl: episode.image,
                    onRetry: setupPlayer,
                  )
                else if (!episodeIsCurrentItem || showLoadingOverlay || kIsWeb)
                  PlayerPoster(
                    imageUrl: episode.image,
                    setupPlayer: setupPlayer,
                    loading: playerSetupSnapshot.connectionState == ConnectionState.waiting,
                  )
                else
                  BccmPlayer(id: player.playerId),
                EpisodeInfo(
                  episode,
                  onShareVideoTapped: () => shareVideo(context, ref, episode),
                  extraChildren: [
                    if (Env.enableStudy && hasStudy && lessonProgressFuture.value != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: StudyMoreButton(
                          lessonProgressFuture: lessonProgressFuture.value!,
                          onNavigateBack: () {
                            if (!isMounted()) return;
                            lessonProgressFuture.value = ref.read(lessonProgressCacheProvider.notifier).loadLessonProgressForEpisode(episode.id);
                          },
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Positioned.fill(
              child: Builder(builder: (context) {
                return IgnorePointer(
                  child: AnimatedContainer(
                    duration: showLoadingOverlay ? Duration.zero : const Duration(milliseconds: 600),
                    curve: Curves.easeOutExpo,
                    color: DesignSystem.of(context).colors.background1.withOpacity(showLoadingOverlay ? 1 : 0),
                    child: Center(
                      child: showLoadingOverlay ? const LoadingIndicator() : null,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
        if (screenParams.hideBottomSection != true && (!_isUnlisted(episode) || _isStandalone(episode)))
          EpisodeTabs(
            tabs: [
              Option(id: 'episodes', title: (S.of(context).episodes.toUpperCase())),
              Option(id: 'details', title: (S.of(context).details.toUpperCase())),
            ],
            children: [
              if (episode.season != null)
                EpisodeSeason(
                  episodeId: screenParams.episodeId,
                  season: episode.season!,
                  onEpisodeTap: (tappedEpisodeId) {
                    if (tappedEpisodeId != episode.id) {
                      context.navigateTo(EpisodeScreenRoute(episodeId: tappedEpisodeId, autoplay: kIsWeb ? null : true));
                    }
                    scrollToTop();
                  },
                )
              else
                EpisodeRelated(episode: episode),
              EpisodeDetails(episode.id)
            ],
          ),
      ],
    );
  }

  Future setupPlayerForEpisode(Query$FetchEpisode$episode episode, {required WidgetRef ref}) async {
    var player = ref.read(primaryPlayerProvider);
    if (player!.currentMediaItem?.metadata?.extras?['id'] == screenParams.episodeId.toString()) {
      return;
    }

    var startPositionSeconds = (episode.progress ?? 0);
    if (screenParams.queryParamStartPosition != null && screenParams.queryParamStartPosition! >= 0) {
      startPositionSeconds = screenParams.queryParamStartPosition!;
    }
    if (startPositionSeconds > episode.duration * 0.9) {
      startPositionSeconds = 0;
    }

    return ref
        .read(playbackServiceProvider)
        .playEpisode(playerId: player.playerId, episode: episode, autoplay: true, playbackPositionMs: startPositionSeconds * 1000)
        .timeout(const Duration(milliseconds: 12000));
  }

  void shareVideo(BuildContext context, WidgetRef ref, Query$FetchEpisode$episode episode) {
    final player = ref.read(primaryPlayerProvider);
    final currentPosSeconds = ((player?.playbackPositionMs ?? 0) / 1000).round();
    if (player != null && player.playerId != 'chromecast') {
      ref.read(playbackServiceProvider).platformApi.pause(player.playerId);
    }
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (ctx) => ShareEpisodeSheet(
        episode: episode,
        currentPosSeconds: currentPosSeconds,
      ),
    );
  }

  bool _isStandalone(Query$FetchEpisode$episode episode) {
    return episode.season == null;
  }

  bool _isUnlisted(Query$FetchEpisode$episode episode) {
    return episode.season?.$show.seasons.items.any((s) => s.id == episode.season?.id) == false;
  }
}
