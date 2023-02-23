//import 'dart:html';

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/components/episode/episode_info.dart';
import 'package:brunstadtv_app/components/episode/episode_related.dart';
import 'package:brunstadtv_app/components/episode/episode_season.dart';
import 'package:brunstadtv_app/components/episode/player_poster.dart';
import 'package:brunstadtv_app/components/error_generic.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/components/share_episode_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:brunstadtv_app/services/playback_service.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:bccm_player/cast_button.dart';
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
import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';
import '../helpers/utils.dart';
import '../l10n/app_localizations.dart';

class EpisodePageArguments {
  int episodeId;
  EpisodePageArguments(this.episodeId);
}

class EpisodeScreen extends StatefulHookConsumerWidget {
  final String episodeId;
  final bool autoplay;
  final int? queryParamStartPosition;
  final bool hideBottomSection;
  const EpisodeScreen({
    super.key,
    @PathParam() required this.episodeId,
    @QueryParam() this.autoplay = false,
    @QueryParam('t') this.queryParamStartPosition,
    @QueryParam('hide_bottom_section') this.hideBottomSection = false,
  });

  @override
  ConsumerState<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends ConsumerState<EpisodeScreen> with AutoRouteAwareStateMixin<EpisodeScreen> {
  @override
  Widget build(BuildContext context) {
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
      episodeFuture.value = ref.read(apiProvider).fetchEpisode(widget.episodeId.toString());
    }

    useEffect(() {
      fetchCurrentEpisode();
      return null;
    }, [widget.episodeId, widget.queryParamStartPosition]);

    return FutureBuilder<Query$FetchEpisode$episode?>(
      future: episodeFuture.value,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 92,
            leading: const CustomBackButton(),
            title: Text(snapshot.data?.season?.$show.title ?? snapshot.data?.title ?? ''),
            actions: const [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16.0),
                child: SizedBox(width: 24, child: CastButton()),
              ),
            ],
          ),
          body: ConditionalParentWidget(
            condition: kIsWeb,
            conditionalBuilder: (child) => Padding(padding: const EdgeInsets.symmetric(horizontal: 300), child: child),
            child: Builder(
              builder: (context) {
                if (snapshot.hasError && snapshot.connectionState == ConnectionState.done) {
                  var noAccess = snapshot.error
                      .asOrNull<OperationException>()
                      ?.graphqlErrors
                      .any((err) => err.extensions?['code'] == ApiErrorCodes.noAccess || err.extensions?['code'] == ApiErrorCodes.notPublished);
                  if (noAccess == true) {
                    return const ErrorNoAccess();
                  }
                  return ErrorGeneric(onRetry: fetchCurrentEpisode);
                }
                if (routeAnimationStatus.value == AnimationStatus.forward ||
                    snapshot.data == null && snapshot.connectionState != ConnectionState.done) {
                  return _LoadingWidget(context: context);
                }
                return _EpisodeDisplay(
                  parentState: this,
                  episode: snapshot.data!,
                  episodeLoading: snapshot.connectionState != ConnectionState.done,
                  hideBottomSection: widget.hideBottomSection,
                  scrollController: scrollController,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(aspectRatio: 16 / 9, child: Container(color: BccmColors.background2)),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoadingIndicator(),
              const SizedBox(height: 12),
              Text(S.of(context).loading, style: BccmTextStyles.body2),
            ],
          ),
        ),
      ],
    );
  }
}

class _EpisodeDisplay extends HookConsumerWidget {
  const _EpisodeDisplay({
    required this.parentState,
    required this.episode,
    required this.episodeLoading,
    required this.hideBottomSection,
    required this.scrollController,
  });

  final _EpisodeScreenState parentState;
  final Query$FetchEpisode$episode episode;
  final bool episodeLoading;
  final bool hideBottomSection;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final casting = ref.watch(isCasting);
    var playerProvider = casting ? castPlayerProvider : primaryPlayerProvider;
    var player = ref.watch(playerProvider);
    if (player == null) return const SizedBox.shrink();

    final playerSetupFuture = useState<Future?>(null);
    Future setupPlayer() {
      return playerSetupFuture.value = setupPlayerForEpisode(episode, ref: ref);
    }

    // Fetch lesson progress
    final lessonProgressFuture = useState<Future<Query$GetEpisodeLessonProgress?>?>(null);
    final hasStudy = episode.lessons.items.isNotEmpty;
    useEffect(() {
      if (!hasStudy) return null;
      lessonProgressFuture.value = ref.read(apiProvider).loadLessonProgressForEpisode(episode.id);
      return null;
      // ignore: exhaustive_keys
    }, [episode.id]);

    // Scroll to top when relevant
    final scrollCompleter = useState<Completer<void>?>(null);
    useEffect(() {
      if (!scrollController.hasClients) return;
      scrollCompleter.value = wrapInCompleter(
        scrollController.animateTo(0, duration: const Duration(milliseconds: 600), curve: Curves.easeOutExpo),
      );
      return null;
      // ignore: exhaustive_keys
    }, [parentState.widget.episodeId, hideBottomSection, parentState.widget.queryParamStartPosition]);

    // Start playing when chromecast disconnects
    ref.watch(chromecastListenerProvider).useListenerHook<CastSessionUnavailable>((event) {
      var player = ref.read(primaryPlayerProvider);
      ref.read(playbackServiceProvider).playEpisode(
            playerId: player!.playerId,
            autoplay: false,
            episode: episode,
            playbackPositionMs: event.playbackPositionMs,
          );
    });

    return FutureBuilder(
      future: playerSetupFuture.value,
      builder: (context, playerSetupSnapshot) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      if (!episodeIsCurrentItem(player.currentMediaItem) &&
                          playerSetupSnapshot.hasError &&
                          playerSetupSnapshot.connectionState != ConnectionState.waiting)
                        PlayerError(
                          imageUrl: episode.image,
                          onRetry: setupPlayer,
                        )
                      else if (!episodeIsCurrentItem(player.currentMediaItem))
                        PlayerPoster(
                          imageUrl: episode.image,
                          setupPlayer: setupPlayer,
                          loading: playerSetupSnapshot.connectionState == ConnectionState.waiting,
                          imageOpacity: scrollCompleter.value?.isCompleted == false ? 0 : 0.5,
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
                                    lessonProgressFuture.value = ref.read(apiProvider).loadLessonProgressForEpisode(episode.id);
                                  }),
                            ),
                        ],
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: IgnorePointer(
                      child: AnimatedContainer(
                        duration: episodeLoading ? Duration.zero : const Duration(milliseconds: 600),
                        curve: Curves.easeOutExpo,
                        color: BccmColors.background1.withOpacity(episodeLoading ? 1 : 0),
                        child: Center(
                          child: !episodeLoading ? null : const LoadingIndicator(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (hideBottomSection != true && (!_isUnlisted(episode) || _isStandalone(episode)))
                EpisodeTabs(
                  tabs: [
                    Option(id: 'episodes', title: (S.of(context).episodes.toUpperCase())),
                    Option(id: 'details', title: (S.of(context).details.toUpperCase())),
                  ],
                  children: [
                    if (episode.season != null)
                      EpisodeSeason(
                        episodeId: parentState.widget.episodeId,
                        season: episode.season!,
                      )
                    else
                      EpisodeRelated(episode: episode),
                    EpisodeDetails(episode.id)
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  bool episodeIsCurrentItem(MediaItem? mediaItem) {
    return mediaItem?.metadata?.extras?['id'] == episode.id;
  }

  Future setupPlayerForEpisode(Query$FetchEpisode$episode episode, {required WidgetRef ref}) async {
    var castingNow = ref.read(isCasting);
    var playerProvider = castingNow ? castPlayerProvider : primaryPlayerProvider;

    var player = ref.read(playerProvider);
    if (player!.currentMediaItem?.metadata?.extras?['id'] == parentState.widget.episodeId.toString()) {
      return;
    }

    var startPositionSeconds = (episode.progress ?? 0);
    if (parentState.widget.queryParamStartPosition != null && parentState.widget.queryParamStartPosition! >= 0) {
      startPositionSeconds = parentState.widget.queryParamStartPosition!;
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
    final casting = ref.read(isCasting);
    final playerProvider = casting ? castPlayerProvider : primaryPlayerProvider;
    final player = ref.read(playerProvider);
    final currentPosSeconds = ((player?.playbackPositionMs ?? 0) / 1000).round();
    if (player != null) {
      ref.read(playbackApiProvider).pause(player.playerId);
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
