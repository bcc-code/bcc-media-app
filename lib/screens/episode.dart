// ignore_for_file: exhaustive_keys
import 'dart:async';
import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/controls.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/components/episode/episode_chapters.dart';
import 'package:brunstadtv_app/components/episode/episode_collection.dart';
import 'package:brunstadtv_app/components/episode/episode_info.dart';
import 'package:brunstadtv_app/components/episode/episode_related.dart';
import 'package:brunstadtv_app/components/episode/episode_season.dart';
import 'package:brunstadtv_app/components/player/audio_only_player.dart';
import 'package:brunstadtv_app/components/player/player_poster.dart';
import 'package:brunstadtv_app/components/misc/parental_gate.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/components/episode/episode_share_sheet.dart';
import 'package:brunstadtv_app/components/video/center_extra_slot.dart';
import 'package:brunstadtv_app/providers/audio_only_provider.dart';
import 'package:brunstadtv_app/providers/lesson_progress_provider.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/brunstadtv.dart';
import '../components/nav/custom_back_button.dart';
import '../components/tabs/custom_tab_bar.dart';
import '../components/player/player_error_view.dart';
import '../components/episode/episode_details.dart';
import '../components/status/error_no_access.dart';
import '../components/study/study_button.dart';
import '../env/env.dart';
import '../helpers/insets.dart';
import 'package:bccm_core/design_system.dart';

import '../l10n/app_localizations.dart';

@RoutePage()
class EpisodeScreen extends _EpisodeScreenImplementation {
  const EpisodeScreen({
    super.key,
    @PathParam() required super.episodeId,
    @QueryParam() super.autoplay = true,
    @QueryParam('t') super.queryParamStartPositionSeconds,
    @QueryParam('hide_bottom_section') super.hideBottomSection,
    @QueryParam('collectionId') super.collectionId,
  });
}

@RoutePage()
class CollectionEpisodeScreen extends _EpisodeScreenImplementation {
  const CollectionEpisodeScreen({
    super.key,
    @PathParam() required super.episodeId,
    @QueryParam() super.autoplay = true,
    @QueryParam('t') super.queryParamStartPositionSeconds,
    @QueryParam('hide_bottom_section') super.hideBottomSection,
    @PathParam('collectionId') super.collectionId,
  });
}

class _EpisodeScreenImplementation extends HookConsumerWidget {
  final String episodeId;
  final bool? autoplay;
  final int? queryParamStartPositionSeconds;
  final bool? hideBottomSection;
  final String? collectionId;

  const _EpisodeScreenImplementation({
    super.key,
    required this.episodeId,
    this.autoplay,
    this.queryParamStartPositionSeconds,
    this.hideBottomSection,
    this.collectionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to route animation status
    final scrollController = useScrollController();
    final modalRoute = ModalRoute.of(context);
    final hasInitialRouteAnimation = useState<bool>(false);
    final initialRouteAnimationDone = useState<bool>(false);
    useEffect(() {
      void routeAnimationStatusListener(AnimationStatus status) {
        // This is used for showing a loading spinner to prevent lag when navigating to this screen.
        // We need hasInitialRouteAnimation to prevent a loading spinner when navigating to this screen without a route animation (e.g. deep linking)
        // We only care about the initial because we don't want to show a loading spinner when navigating back (e.g. by slowly swiping the edge of the screen.)
        if (status == AnimationStatus.forward) {
          hasInitialRouteAnimation.value = true;
        }
        if (status != AnimationStatus.forward) {
          initialRouteAnimationDone.value = true;
        }
      }

      modalRoute?.animation?.addStatusListener(routeAnimationStatusListener);
      return () => modalRoute?.animation?.removeStatusListener(routeAnimationStatusListener);
    }, [modalRoute]);

    final episodeFuture = useState<Future<Query$FetchEpisode$episode?>?>(null);
    fetchCurrentEpisode() {
      return episodeFuture.value = ref.read(apiProvider).fetchEpisode(
            episodeId.toString(),
            context: Input$EpisodeContext(collectionId: collectionId),
          );
    }

    // Fetch the episode when needed
    useEffect(() {
      fetchCurrentEpisode();
    }, [episodeId, collectionId, queryParamStartPositionSeconds]);

    final episodeSnapshot = useFuture(episodeFuture.value);

    Widget? getMainWidget() {
      if (episodeSnapshot.hasError && episodeSnapshot.connectionState == ConnectionState.done) {
        var noAccess = episodeSnapshot.error
            .asOrNull<OperationException>()
            ?.graphqlErrors
            .any((err) => err.extensions?['code'] == ApiErrorCodes.noAccess || err.extensions?['code'] == ApiErrorCodes.notPublished);
        if (noAccess == true) {
          return const SliverFillRemaining(
            child: ErrorNoAccess(),
          );
        }
        return SliverFillRemaining(
          child: ErrorGeneric(
            onRetry: fetchCurrentEpisode,
            details: episodeSnapshot.error.toString(),
          ),
        );
      } else if (episodeSnapshot.data == null || (hasInitialRouteAnimation.value && !initialRouteAnimationDone.value)) {
        return const SliverFillRemaining(child: _LoadingWidget());
      } else {
        return SliverToBoxAdapter(
          child: _EpisodeDisplay(
            screenParams: this,
            episode: episodeSnapshot.data!,
            loading: episodeSnapshot.connectionState == ConnectionState.waiting,
            scrollController: scrollController,
            triggerReload: fetchCurrentEpisode,
          ),
        );
      }
    }

    return Scaffold(
      appBar: ScreenInsetAppBar(
        appBar: AppBar(
          scrolledUnderElevation: 0,
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
            sliver: getMainWidget(),
          ),
        ],
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
    required this.episode,
    required this.loading,
    required this.scrollController,
    required this.triggerReload,
  });

  final _EpisodeScreenImplementation screenParams;
  final Query$FetchEpisode$episode episode;
  final bool loading;
  final ScrollController scrollController;
  final Future<void> Function() triggerReload;

  Future setupPlayerForEpisode(Query$FetchEpisode$episode episode, {required WidgetRef ref}) async {
    var player = ref.read(primaryPlayerProvider);
    if (player == null) return;

    var startPositionSeconds = (episode.progress ?? 0);
    if (screenParams.queryParamStartPositionSeconds != null && screenParams.queryParamStartPositionSeconds! >= 0) {
      startPositionSeconds = screenParams.queryParamStartPositionSeconds!;
    }
    if (startPositionSeconds > episode.duration || startPositionSeconds < 0) {
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
    if (!await checkParentalGate(context)) {
      return;
    }
    if (!context.mounted) return;
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (ctx) => EpisodeShareSheet(
        episode: episode,
        currentPosSeconds: currentPosSeconds,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var player = ref.watch(primaryPlayerProvider);
    if (player == null) {
      return const SizedBox.shrink();
    }

    final playerSetupFuture = useState<Future?>(null);
    Future setupPlayer() {
      return playerSetupFuture.value = setupPlayerForEpisode(episode, ref: ref);
    }

    final playerSetupSnapshot = useFuture(playerSetupFuture.value);
    final playbackService = ref.watch(playbackServiceProvider);
    final chromecastEvents = ref.watch(chromecastEventStreamProvider);
    final playerEvents = ref.watch(playerEventStreamProvider(player.playerId));
    final episodeIsCurrentItem = player.currentMediaItem?.metadata?.extras?['id'] == episode.id;

    useEffect(() {
      if (screenParams.autoplay == true && !episodeIsCurrentItem) {
        setupPlayer();
      }
      return null;
    }, [episode.id, screenParams.autoplay, screenParams.queryParamStartPositionSeconds]);

    final viewController = useMemoized(
      () => BccmPlayerViewController(playerController: BccmPlayerController.primary),
    );
    useEffect(() {
      final defaultViewConfig = playbackService.getDefaultViewConfig();
      final languages = LinkedHashSet<String?>.from(episode.streams.map((e) => e.videoLanguage));
      viewController.setConfig(
        defaultViewConfig.copyWith(
          controlsConfig: defaultViewConfig.controlsConfig.copyWith(
            extraSettingsBuilder: (context) {
              return [
                if (languages.nonNulls.isNotEmpty)
                  VideoLanguageSettings(
                    episode: episode,
                    languages: languages.toList(),
                  ),
              ];
            },
            topRightNextToSettingsSlot: languages.length < 2 ? null : (context) => const MultiVideoLangNotice(),
            centerExtraSlot: (context) => CenterExtraSlot(episode: episode),
          ),
        ),
      );

      return null;
    }, [player.playerId, playbackService, episode]);

    useEffect(() => () => viewController.dispose(), []);

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
    }, [screenParams.hideBottomSection, screenParams.queryParamStartPositionSeconds]);

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

    // Handle playback ended events
    useEffect(() {
      final subscription = playerEvents.where((event) => event is PlaybackEndedEvent).cast<PlaybackEndedEvent>().listen((event) async {
        playbackService.platformApi.exitFullscreen(player.playerId);
      });
      return () => subscription.cancel();
    }, [ref, playerEvents, playbackService, player.playerId]);

    final showLoadingOverlay = loading;
    final showChapters = episode.chapters.isNotEmpty;

    final chaptersWidget = EpisodeChapters(
      episode: episode,
      onChapterSelected: (id) {
        final chapter = episode.chapters.firstWhereOrNull((element) => element.id == id);
        if (chapter == null) return;
        if (episodeIsCurrentItem) {
          BccmPlayerController.primary.seekTo(Duration(seconds: chapter.start)).then((value) => BccmPlayerController.primary.play());
          scrollToTop();
        } else {
          setupPlayer().then((value) => BccmPlayerController.primary.seekTo(Duration(seconds: chapter.start)));
        }
        ref.read(analyticsProvider).chapterClicked(ChapterClickedEvent(
              elementType: 'episode',
              elementId: episode.id,
              chapterStart: chapter.start,
              chapterId: chapter.id,
            ));
      },
    );

    final playerError = useListenableSelector(viewController.playerController, () => viewController.playerController.value.error);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Column(
              children: [
                if (!episodeIsCurrentItem && playerSetupSnapshot.hasError && playerSetupSnapshot.connectionState != ConnectionState.waiting ||
                    playerError != null)
                  PlayerErrorView(
                    imageUrl: episode.image,
                    onRetry: () async {
                      final currentPos = player.playbackPositionMs ?? 0;
                      await triggerReload();
                      if (!context.mounted) return;
                      await setupPlayer();
                      BccmPlayerController.primary.seekTo(Duration(milliseconds: currentPos));
                    },
                  )
                else if (!episodeIsCurrentItem || showLoadingOverlay || kIsWeb || viewController.isFullscreen)
                  Container(
                    color: DesignSystem.of(context).colors.background2,
                    child: PlayerPoster(
                      episode: episode,
                      setupPlayer: setupPlayer,
                      loading: playerSetupSnapshot.connectionState == ConnectionState.waiting || viewController.isFullscreen,
                    ),
                  )
                else
                  MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    child: AnimatedSize(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeOutExpo,
                        child: ref.watch(audioOnlyProvider)
                            ? AudioOnlyPlayer(viewController: viewController)
                            : BccmPlayerView.withViewController(viewController)),
                  ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 800),
                  alignment: Alignment.topCenter,
                  curve: Curves.easeOutExpo,
                  child: EpisodeInfo(
                    key: ValueKey(episode.id),
                    episode,
                    onShareVideoTapped: () => shareVideo(context, ref, episode),
                    extraChildren: [
                      if (Env.enableStudy && hasStudy && lessonProgressFuture.value != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: StudyButton(
                            lessonProgressFuture: lessonProgressFuture.value!,
                            onNavigateBack: () {
                              if (!context.mounted) return;
                              lessonProgressFuture.value = ref.read(lessonProgressCacheProvider.notifier).loadLessonProgressForEpisode(episode.id);
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Builder(builder: (context) {
                return IgnorePointer(
                  child: AnimatedContainer(
                    duration: showLoadingOverlay ? Duration.zero : const Duration(milliseconds: 600),
                    curve: Curves.easeOutExpo,
                    color: DesignSystem.of(context).colors.background2.withOpacity(showLoadingOverlay ? 1 : 0),
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
          Animate(
            effects: [
              FadeEffect(
                begin: 0,
                duration: 3000.ms,
                curve: Curves.easeOutExpo,
              ),
              SlideEffect(
                begin: const Offset(0, -0.01),
                duration: 2000.ms,
                curve: Curves.easeOutExpo,
              ),
            ],
            child: CustomTabBar(
              tabs: [
                if (showChapters) S.of(context).chapters,
                episode.context is Fragment$EpisodeContext$$Season ? S.of(context).episodes.toUpperCase() : S.of(context).videos.toUpperCase(),
                S.of(context).details.toUpperCase()
              ],
              children: [
                if (showChapters) chaptersWidget,
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
                    onEpisodeTap: (index, tappedEpisodeId) {
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
          ),
      ],
    );
  }
}

class MultiVideoLangNotice extends StatelessWidget {
  const MultiVideoLangNotice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewController = BccmPlayerViewController.of(context);
    if (!viewController.isFullscreen) return const SizedBox.shrink();
    final design = DesignSystem.of(context);
    return Container(
      padding: const EdgeInsets.symmetric().copyWith(bottom: 12),
      child: Row(
        children: [
          Text(
            S.of(context).openSettingsToChangeVideoLang,
            style: design.textStyles.caption2.copyWith(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

class VideoLanguageSettings extends HookConsumerWidget {
  const VideoLanguageSettings({
    super.key,
    required this.episode,
    required this.languages,
  });

  final Query$FetchEpisode$episode episode;
  final List<String?> languages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCode = useListenableSelector(
      BccmPlayerController.primary,
      () => BccmPlayerController.primary.value.currentMediaItem?.metadata?.extras?['videoLanguage'],
    );
    final selectedName = selectedCode == null ? S.of(context).original : getLanguageName(selectedCode) ?? selectedCode;
    return ListTile(
      dense: true,
      title: Text(
        '${S.of(context).videoTextLanguage}: $selectedName',
        style: BccmPlayerTheme.safeOf(context).controls?.settingsListTextStyle,
      ),
      onTap: () async {
        final current = BccmPlayerController.primary.value.currentMediaItem?.metadata?.extras?['videoLanguage'];
        final selected = await showModalOptionList<String?>(
          context: context,
          options: [
            ...languages.map(
              (l) => SettingsOption(
                value: l,
                label: l == null ? S.of(context).original : getLanguageName(l) ?? l,
                isSelected: current == l,
              ),
            ),
          ],
        );

        if (selected != null && context.mounted) {
          ref.read(playbackServiceProvider).playEpisode(
                playerId: BccmPlayerController.primary.value.playerId,
                episode: episode,
                videoLanguageCode: selected.value,
                autoplay: true,
                playbackPositionMs: BccmPlayerController.primary.value.playbackPositionMs,
              );
        }
      },
    );
  }
}
