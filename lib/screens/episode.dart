// ignore_for_file: exhaustive_keys
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/components/episode/episode_collection.dart';
import 'package:brunstadtv_app/components/episode/episode_info.dart';
import 'package:brunstadtv_app/components/episode/episode_related.dart';
import 'package:brunstadtv_app/components/episode/episode_season.dart';
import 'package:brunstadtv_app/components/episode/player_poster.dart';
import 'package:brunstadtv_app/components/parents/parental_gate.dart';
import 'package:brunstadtv_app/components/status_indicators/error_generic.dart';
import 'package:brunstadtv_app/components/status_indicators/loading_indicator.dart';
import 'package:brunstadtv_app/components/episode/share_episode_sheet.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/lesson_progress_provider.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

import '../api/brunstadtv.dart';
import '../components/custom_back_button.dart';
import '../components/custom_tab_bar/custom_tab_bar.dart';
import '../components/episode/player_error.dart';
import '../components/episode/episode_details.dart';
import '../components/player/custom_cast_player.dart';
import '../components/status_indicators/error_no_access.dart';
import '../components/study/study_button.dart';
import '../env/env.dart';
import '../graphql/queries/studies.graphql.dart';
import '../graphql/schema/episodes.graphql.dart';
import '../graphql/schema/schema.graphql.dart';
import '../helpers/insets.dart';
import '../theme/design_system/design_system.dart';

import '../helpers/utils.dart';
import '../helpers/extensions.dart';
import '../l10n/app_localizations.dart';

class EpisodeScreen extends _EpisodeScreenImplementation {
  const EpisodeScreen({
    super.key,
    @PathParam() required super.episodeId,
    @QueryParam() super.autoplay,
    @QueryParam('t') super.queryParamStartPosition,
    @QueryParam('hide_bottom_section') super.hideBottomSection,
    @QueryParam('collectionId') super.collectionId,
  });
}

class CollectionEpisodeScreen extends _EpisodeScreenImplementation {
  const CollectionEpisodeScreen({
    super.key,
    @PathParam() required super.episodeId,
    @QueryParam() super.autoplay,
    @QueryParam('t') super.queryParamStartPosition,
    @QueryParam('hide_bottom_section') super.hideBottomSection,
    @PathParam('collectionId') super.collectionId,
  });
}

class _EpisodeScreenImplementation extends HookConsumerWidget {
  final String episodeId;
  final bool? autoplay;
  final int? queryParamStartPosition;
  final bool? hideBottomSection;
  final String? collectionId;
  const _EpisodeScreenImplementation({
    super.key,
    required this.episodeId,
    this.autoplay,
    this.queryParamStartPosition,
    this.hideBottomSection,
    this.collectionId,
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
      episodeFuture.value = ref.read(apiProvider).fetchEpisode(
            episodeId.toString(),
            context: Input$EpisodeContext(collectionId: collectionId),
          );
    }

    useEffect(() {
      fetchCurrentEpisode();
      return null;
    }, [episodeId, collectionId, queryParamStartPosition]);

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
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16.0),
                child: SizedBox(
                  width: 24,
                  child: CastButton(color: DesignSystem.of(context).colors.tint1),
                ),
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

  final _EpisodeScreenImplementation screenParams;
  final Future<Query$FetchEpisode$episode?>? episodeFuture;
  final ScrollController scrollController;

  Future<bool> autoplayNext(PlaybackService playbackService, String playerId, StackRouter router) async {
    final nextEpisode = await playbackService.getNextEpisodeForPlayer(playerId: playerId);
    if (nextEpisode == null) {
      playbackService.platformApi.exitFullscreen(playerId);
      return false;
    }
    // When we are fullscreen on iOS, flutter's lifecyclestate becomes 'paused', and the widget tree won't build e.g. on navigation.
    // Therefore we can't rely on the routing to autoplay the next episode.
    // But we still call navigate(), so that it's performed when the user exits fullscreen.
    // TODO: Navigate upon fullscreen exit instead. Basically: if leaving fullscreen and we're on the wrong page, navigate.
    playbackService.playEpisode(
      playerId: playerId,
      episode: nextEpisode,
      playbackPositionMs: 0,
      autoplay: true,
    );
    router.navigate(
      EpisodeScreenRoute(
        episodeId: nextEpisode.id,
        collectionId: nextEpisode.context?.asOrNull<Fragment$EpisodeContext$$ContextCollection>()?.id,
        autoplay: true,
        queryParamStartPosition: 0,
      ),
    );
    return true;
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

  void shareVideo(BuildContext context, WidgetRef ref, Query$FetchEpisode$episode episode) async {
    final player = ref.read(primaryPlayerProvider);
    final currentPosSeconds = ((player?.playbackPositionMs ?? 0) / 1000).round();
    if (player != null && player.playerId != 'chromecast') {
      ref.read(playbackServiceProvider).platformApi.pause(player.playerId);
    }
    if (!await checkParentalGate(context) || !context.mounted) {
      return;
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
    final playbackService = ref.watch(playbackServiceProvider);
    final chromecastEvents = ref.watch(chromecastEventStreamProvider);
    final playerEvents = ref.watch(playerEventStreamProvider(player.playerId));
    final enableAutoplayNext = ref.watch(featureFlagsProvider.select((value) => value.autoplayNext));
    final enablePlayNextButton = enableAutoplayNext && ref.watch(featureFlagsProvider.select((value) => value.playNextButton));
    final episodeIsCurrentItem = player.currentMediaItem?.metadata?.extras?['id'] == episode.id;

    useEffect(() {
      if (screenParams.autoplay == true && !episodeIsCurrentItem) {
        setupPlayer();
      }
      return null;
    }, [episode.id, screenParams.autoplay, screenParams.queryParamStartPosition]);

    final viewController = useMemoized(
      () => BccmPlayerViewController(playerController: BccmPlayerController.primary),
    );
    useEffect(() {
      viewController.setConfig(
        BccmPlayerViewConfig(
          resetSystemOverlays: () {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          },
          castPlayerBuilder: (context) => const CustomCastPlayerView(),
          controlsConfig: BccmPlayerControlsConfig(
            additionalActionsBuilder: (context) => [
              if (Platform.isIOS)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Transform.scale(
                    scale: 0.8,
                    child: const AirPlayRoutePickerView(
                      width: 20,
                      height: 32,
                      prioritizesVideoDevices: true,
                      tintColor: Colors.white,
                      activeTintColor: Colors.white,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                )
            ],
            hideQualitySelector: true,
            playNextButton: !enablePlayNextButton
                ? null
                : (context) => PlayNextButton(
                      playerController: BccmPlayerController.primary,
                      onTap: () => autoplayNext(playbackService, player.playerId, context.router),
                      text: S.of(context).nextEpisode,
                    ),
          ),
        ),
      );
      return null;
    }, [enablePlayNextButton, player.playerId, playbackService]);

    useEffect(() => () => viewController.dispose(), []);

    ref.listen<bool>(primaryPlayerProvider.select((p) => p?.playbackState == PlaybackState.playing), (prev, next) {
      if (!isMounted()) return;
      if (!ref.read(featureFlagsProvider).autoFullscreenOnPlay) return;
      if (next == true && episodeIsCurrentItem && viewController.isFullscreen == false) {
        viewController.enterFullscreen(
          context: context,
        );
      }
    });

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
    useEffect(() {
      final subscription = chromecastEvents.on<CastSessionUnavailable>().listen((event) {
        playbackService.playEpisode(
          playerId: player.playerId,
          autoplay: false,
          episode: episode,
          playbackPositionMs: event.playbackPositionMs,
        );
      });
      return () => subscription.cancel();
    }, [player.playerId, episode, chromecastEvents, playbackService]);

    // Handle playback ended events, including autoplaying next
    useEffect(() {
      final subscription = playerEvents.where((event) => event is PlaybackEndedEvent).cast<PlaybackEndedEvent>().listen((event) async {
        if (enableAutoplayNext) {
          autoplayNext(playbackService, player.playerId, context.router);
          return;
        }
        playbackService.platformApi.exitFullscreen(player.playerId);
      });
      return () => subscription.cancel();
    }, [ref, playerEvents, playbackService, enableAutoplayNext, player.playerId]);

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
                else if (!episodeIsCurrentItem || showLoadingOverlay || kIsWeb || viewController.isFullscreen)
                  PlayerPoster(
                    imageUrl: episode.image,
                    setupPlayer: setupPlayer,
                    loading: playerSetupSnapshot.connectionState == ConnectionState.waiting || viewController.isFullscreen,
                  )
                else
                  BccmPlayerView.withViewController(viewController),
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
        if (screenParams.hideBottomSection != true && (episode.status != Enum$Status.unlisted || episode.type == Enum$EpisodeType.standalone))
          CustomTabBar(
            tabs: [
              episode.context is Fragment$EpisodeContext$$Season ? S.of(context).episodes.toUpperCase() : S.of(context).videos.toUpperCase(),
              S.of(context).details.toUpperCase()
            ],
            children: [
              if (episode.context is Fragment$EpisodeContext$$Season)
                EpisodeSeason(
                  episodeId: screenParams.episodeId,
                  season: episode.context as Fragment$EpisodeContext$$Season,
                  onEpisodeTap: (tappedEpisodeId) {
                    if (tappedEpisodeId != episode.id) {
                      context.navigateTo(EpisodeScreenRoute(episodeId: tappedEpisodeId, autoplay: kIsWeb ? null : true));
                    }
                    scrollToTop();
                  },
                )
              else if (episode.context is Fragment$EpisodeContext$$ContextCollection)
                EpisodeCollection(
                  episodeId: screenParams.episodeId,
                  collection: episode.context as Fragment$EpisodeContext$$ContextCollection,
                  onEpisodeTap: (tappedEpisodeId) {
                    if (tappedEpisodeId != episode.id) {
                      context.navigateTo(EpisodeScreenRoute(
                        episodeId: tappedEpisodeId,
                        collectionId: screenParams.collectionId,
                        autoplay: kIsWeb ? null : true,
                      ));
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
}
