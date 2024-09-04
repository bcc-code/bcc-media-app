import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/router/custom_transitions.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/appbar_close_button.dart';
import 'package:kids/components/buttons/tab_switcher.dart';
import 'package:kids/components/dialog/dialog.dart';
import 'package:kids/components/grid/episode_grid.dart';
import 'package:kids/components/player/controls.dart';
import 'package:kids/components/player/player_error.dart';
import 'package:kids/components/settings/option_list.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:kids/helpers/transitions.dart';
import 'package:kids/router/router.gr.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PlayerView extends HookConsumerWidget {
  const PlayerView({
    super.key,
    required this.episode,
    required this.playlistId,
    required this.onReloadRequested,
  });

  final Query$KidsFetchEpisode$episode? episode;
  final Future<void> Function() onReloadRequested;
  final String? playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewController = BccmPlayerViewController.of(context);
    final animationController = useAnimationController(
      duration: 500.ms,
      reverseDuration: 700.ms,
      initialValue: 0.0,
    );
    useListenable(animationController);
    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutExpo,
      reverseCurve: Curves.easeInExpo,
    );

    useWakelockWhilePlaying(viewController.playerController);

    void navigateToEpisode(Fragment$KidsEpisodeThumbnail episode) {
      context.replaceRoute(EpisodeScreenRoute(
        id: episode.id,
        shuffle: false,
        playlistId: playlistId,
        cursor: episode.cursor,
      ));
    }

    final morphTransition = InheritedData.watch<MorphTransitionInfo>(context);
    final currentMediaItem = useState(viewController.playerController.value.currentMediaItem);

    final controlsVisible = useState(false);
    final reloadCompleter = useState<Completer<void>?>(null);

    reload({bool fromStart = false}) async {
      final currentMs = viewController.playerController.value.playbackPositionMs;
      reloadCompleter.value = wrapInCompleter(onReloadRequested());
      if (!fromStart && currentMs != null) {
        final safeEarly = max(0, currentMs - 5000);
        await reloadCompleter.value?.future;
        viewController.playerController.seekTo(Duration(milliseconds: safeEarly));
      }
    }

    setControlsVisible(bool value) {
      if (controlsVisible.value == value) {
        return;
      }
      controlsVisible.value = value;
      if (value) {
        animationController.forward(from: 0.0);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        animationController.reverse(from: 1.0);
        if (viewController.playerController.value.playbackState != PlaybackState.playing && currentMediaItem.value != null) {
          viewController.playerController.play();
        } else if (currentMediaItem.value == null && episode != null) {
          reload(fromStart: true);
        }
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      }
    }

    void toggleOpen() {
      setControlsVisible(!controlsVisible.value);
    }

    final hasStartedProperly = useState(false);
    final buffering = useState(false);
    final last10SecondsHandled = useState(false);

    useEffect(() {
      void listener() {
        final changedItem =
            viewController.playerController.value.currentMediaItem?.metadata?.extras?['id'] != currentMediaItem.value?.metadata?.extras?['id'];
        if (changedItem) {
          hasStartedProperly.value = false;
        }
        buffering.value = viewController.playerController.value.isBuffering;
        if (viewController.playerController.value.playbackState == PlaybackState.playing && !buffering.value) {
          hasStartedProperly.value = true;
        }
        currentMediaItem.value = viewController.playerController.value.currentMediaItem;
        final duration = viewController.playerController.value.currentMediaItem?.metadata?.durationMs;
        final position = viewController.playerController.value.playbackPositionMs;
        if (duration != null && position != null) {
          if (duration > 0 && duration - position < 10000) {
            if (!last10SecondsHandled.value) {
              setControlsVisible(true);
              last10SecondsHandled.value = true;
            }
          } else {
            last10SecondsHandled.value = false;
          }
        }
      }

      viewController.playerController.addListener(listener);
      return () {
        viewController.playerController.removeListener(listener);
      };
    });

    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final basePadding = bp.smallerThan(TABLET) ? 20.0 : 40.0;
    final playerError = useListenableSelector(viewController.playerController, () => viewController.playerController.value.error);

    final hasAutoplayNext = ref.watch(featureFlagsProvider.select((value) => value.kidsAutoplayNext));
    final ff = ref.watch(featureFlagsProvider.select((value) => value.variants));

    useEffect(() {
      debugPrint('hasAutoplayNext: $hasAutoplayNext');
    }, [hasAutoplayNext]);
    useEffect(() {
      debugPrint('ff: $ff');
    }, [ff]);

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        // Calculate the height of the middle box based on the aspect ratio
        const sideOpenTargetWidth = 152.0;
        final bottomOpenMinimumHeight = bp.smallerThan(TABLET) ? 170.0 : 300.0;
        final topOpenTargetHeight = bp.smallerThan(TABLET) ? 12.0 : 40.0;

        final sideWidthTweened = sideOpenTargetWidth * curvedAnimation.value;

        final middleClosedHeight = min(constraints.maxHeight, (constraints.maxWidth) * (9 / 16));
        final middleOpenTargetHeight =
            min(constraints.maxHeight - bottomOpenMinimumHeight - topOpenTargetHeight, (constraints.maxWidth - sideOpenTargetWidth * 2) * (9 / 16));
        final middleHeightTweened = curvedAnimation.drive(Tween(begin: middleClosedHeight, end: middleOpenTargetHeight)).value;

        final remainingHeightWhenOpen = max(0.0, constraints.maxHeight - middleOpenTargetHeight);
        final remainingHeightWhenClosed = max(0.0, constraints.maxHeight - middleClosedHeight);
        final remainingHeight = max(0.0, constraints.maxHeight - middleHeightTweened);

        final topHeightTweened = curvedAnimation.drive(Tween(begin: remainingHeightWhenClosed / 2, end: topOpenTargetHeight));

        final bottomOpenTargetHeight = remainingHeightWhenOpen - topOpenTargetHeight;
        final bottomOpenHeight = max(remainingHeight / 2, bottomOpenTargetHeight);
        final bottomHeightTweened = curvedAnimation.drive(Tween(begin: remainingHeight / 2, end: bottomOpenHeight));

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: curvedAnimation.drive(ColorTween(begin: Colors.black, end: Colors.white)).value,
            ),
            Column(
              children: [
                Container(
                  height: topHeightTweened.value,
                ),
                Container(
                  height: middleHeightTweened,
                  margin: EdgeInsets.symmetric(horizontal: sideWidthTweened),
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(curvedAnimation.value * 40),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            toggleOpen();
                          },
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  margin: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              IgnorePointer(
                                ignoring: true,
                                child: morphTransition?.active == true || playerError != null || !hasStartedProperly.value
                                    ? const AspectRatio(aspectRatio: 16 / 9)
                                    : BccmPlayerTheme(
                                        playerTheme: BccmPlayerThemeData(
                                          controls: BccmControlsThemeData.defaultTheme(context).copyWith(settingsListBackgroundColor: Colors.black),
                                        ),
                                        child: VideoPlatformView(
                                          playerController: viewController.playerController,
                                          showControls: false,
                                          useSurfaceView: viewController.config.useSurfaceView,
                                          allowSystemGestures: viewController.config.allowSystemGestures,
                                        ),
                                      ),
                              ),
                              Positioned.fill(
                                  child: currentMediaItem.value == null && episode?.image != null
                                      ? simpleFadeInImage(url: episode!.image!)
                                      : Container()),
                              Positioned.fill(
                                child: Center(
                                  child: buffering.value || reloadCompleter.value?.isCompleted == false
                                      ? const LoadingIndicator(
                                          width: 42,
                                          height: 42,
                                        )
                                      : const SizedBox(width: 42, height: 429),
                                ),
                              ),
                              Positioned.fill(
                                child: Opacity(
                                  opacity: curvedAnimation.value,
                                  child: PlayerControls(
                                    show: controlsVisible.value,
                                    onPlayRequestedWithoutVideo: reload,
                                  ),
                                ),
                              ),
                              if (playerError != null && reloadCompleter.value?.isCompleted != false)
                                Positioned.fill(
                                  child: KidsPlayerError.fromPlayerError(
                                    playerError,
                                    onRetry: reload,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: bottomHeightTweened.value,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Transform.translate(
                        offset: Offset(0, (bottomOpenTargetHeight - bottomOpenHeight + (100) * (1 - curvedAnimation.value))),
                        child: OverflowBox(
                          alignment: Alignment.topLeft,
                          maxHeight: bottomOpenTargetHeight,
                          minHeight: bottomOpenTargetHeight,
                          child: Container(
                            height: bottomOpenTargetHeight,
                            padding: EdgeInsets.symmetric(
                              vertical: bp.smallerThan(TABLET) ? 12 : 32,
                            ),
                            child: episode == null
                                ? const Center(
                                    child: RepaintBoundary(
                                      child: LoadingIndicator(height: 24, width: 24),
                                    ),
                                  )
                                : PlayerEpisodes(
                                    padding: EdgeInsets.symmetric(horizontal: basePadding).copyWith(bottom: MediaQuery.paddingOf(context).bottom),
                                    episode: episode,
                                    onEpisodeTap: (ep) {
                                      navigateToEpisode(ep);
                                      setControlsVisible(false);
                                    },
                                    autoPlayCountdown: hasAutoplayNext && last10SecondsHandled.value ? 10 : null,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0 - (1 - curvedAnimation.value) * 200,
              child: SafeArea(
                top: false,
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.all(basePadding),
                  child: design.buttons.responsive(
                    labelText: '',
                    onPressed: () => context.router.pop(),
                    image: SvgPicture.string(SvgIcons.close),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0 - (1 - curvedAnimation.value) * 200,
              child: SafeArea(
                top: false,
                bottom: false,
                child: SizedBox(
                  height: middleOpenTargetHeight + topOpenTargetHeight,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(basePadding),
                        child: design.buttons.responsive(
                          labelText: '',
                          onPressed: () {
                            if (bp.smallerThan(TABLET)) {
                              showGeneralDialog(
                                transitionBuilder: CustomTransitionsBuilders.slideUp(),
                                transitionDuration: 500.ms,
                                context: context,
                                barrierColor: Colors.transparent,
                                routeSettings: const RouteSettings(name: 'player-settings'),
                                pageBuilder: (context, a, b) => PlayerSettingsView(
                                  playerController: viewController.playerController,
                                ),
                              );
                              return;
                            }
                            showDialog(
                              context: context,
                              routeSettings: const RouteSettings(name: 'player-settings'),
                              builder: (context) => PlayfulDialog(
                                  child: PlayerSettingsView(
                                playerController: viewController.playerController,
                              )),
                            );
                          },
                          image: SvgPicture.string(SvgIcons.settings),
                        ),
                      ),
                      const Spacer(),
                      if (episode != null)
                        design.buttons.responsive(
                          labelText: '',
                          onPressed: () {
                            if (episode?.next.isNotEmpty != true) return;
                            navigateToEpisode(episode!.next.first);
                            setControlsVisible(false);
                          },
                          image: SvgPicture.string(SvgIcons.next),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class PlayerSettingsView extends HookConsumerWidget {
  const PlayerSettingsView({
    super.key,
    required this.playerController,
  });

  final BccmPlayerController playerController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final isSmall = bp.smallerThan(TABLET);
    final tabController = useTabController(initialLength: 2);

    // Handle buffering, especially if opening settings in between episodes
    final buffering = useListenableSelector(playerController, () => playerController.value.isBuffering);
    final tracksFuture = useState(useMemoized(playerController.getTracks));
    final initialBufferingDone = useState(false);
    useValueChanged(buffering, (_, bool? previous) {
      tracksFuture.value = playerController.getTracks();
      if (previous == true && buffering == false) {
        initialBufferingDone.value = true;
      }
      return buffering;
    });

    useListenable(tabController);

    final tracksSnapshot = useFuture(tracksFuture.value);
    final preferredLanguages = ref.watch(settingsProvider.select((value) => value.audioLanguages));
    final loading = (buffering && !initialBufferingDone.value);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isSmall ? 80 : 112,
        leadingWidth: isSmall ? 100 : 0,
        leading: isSmall ? const AppBarCloseButton() : null,
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 28,
        centerTitle: true,
        title: SizedBox(
          width: bp.smallerThan(TABLET) ? null : double.infinity,
          child: TabSwitcher.small(
            options: [S.of(context).audio, S.of(context).subtitles],
            selectedIndex: tabController.index,
            onSelectionChanged: (index) {
              tabController.index = index;
            },
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: design.colors.separatorOnLight, width: 1),
            ),
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (loading)
            const Center(child: CircularProgressIndicator())
          else if (tracksSnapshot.hasError)
            ErrorGeneric(
              details: tracksSnapshot.error.toString(),
              onRetry: () {
                tracksFuture.value = playerController.getTracks();
              },
            )
          else if (tracksSnapshot.hasData)
            TabBarView(
              controller: tabController,
              children: [
                _TrackSelectionList(
                  preferredTracks: filterAndOrderTracksBasedOnLanguageList(preferredLanguages, tracksSnapshot.data!.audioTracks),
                  otherTracks: tracksSnapshot.data!.audioTracks.safe
                      .where((t) => t.language == null || !preferredLanguages.contains(normalizeLanguage(t.language!)))
                      .toList(),
                  onSelectionChanged: (track) {
                    if (track == null) return;
                    playerController.setSelectedTrack(TrackType.audio, track.id);
                    tracksFuture.value = playerController.getTracks();
                  },
                ),
                _TrackSelectionList(
                  preferredTracks: filterAndOrderTracksBasedOnLanguageList(preferredLanguages, tracksSnapshot.data!.textTracks),
                  otherTracks: tracksSnapshot.data!.textTracks.safe
                      .where((t) => t.language == null || !preferredLanguages.contains(normalizeLanguage(t.language!)))
                      .toList(),
                  onSelectionChanged: (track) {
                    playerController.setSelectedTrack(TrackType.text, track?.id);
                    tracksFuture.value = playerController.getTracks();
                  },
                  includeNone: true,
                ),
              ],
            ),
          if (!isSmall)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: SizedBox(
                    width: double.infinity,
                    child: design.buttons.responsive(
                      variant: ButtonVariant.secondary,
                      labelText: 'Back to video',
                      onPressed: () => context.router.pop(),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TrackSelectionList extends HookWidget {
  const _TrackSelectionList({
    required this.preferredTracks,
    required this.otherTracks,
    required this.onSelectionChanged,
    this.includeNone = false,
  });

  final List<Track> preferredTracks;
  final List<Track> otherTracks;
  final void Function(Track?) onSelectionChanged;
  final bool includeNone;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KidsOptionList(
                items: [
                  if (includeNone)
                    KidsOptionListItem(
                      title: S.of(context).none,
                      selected: !preferredTracks.any((element) => element.isSelected) && !otherTracks.any((element) => element.isSelected),
                      onPressed: () {
                        onSelectionChanged(null);
                      },
                    ),
                  ...preferredTracks.map(
                    (track) => KidsOptionListItem(
                      title: track.labelWithFallback,
                      selected: track.isSelected,
                      onPressed: () {
                        onSelectionChanged(track);
                      },
                    ),
                  )
                ],
              ),
              if ((preferredTracks.isNotEmpty || includeNone) && otherTracks.isNotEmpty) ...[
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    S.of(context).otherLanguages,
                    style: design.textStyles.body1.copyWith(color: design.colors.label2),
                  ),
                ),
              ],
              if (otherTracks.isNotEmpty == true) ...[
                KidsOptionList(
                  items: otherTracks
                      .map(
                        (track) => KidsOptionListItem(
                          title: track.labelWithFallback,
                          selected: track.isSelected,
                          onPressed: () {
                            onSelectionChanged(track);
                          },
                        ),
                      )
                      .toList(),
                ),
              ],
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerEpisodes extends HookConsumerWidget {
  const PlayerEpisodes({
    super.key,
    required this.episode,
    required this.onEpisodeTap,
    this.padding,
    this.autoPlayCountdown,
  });

  final Query$KidsFetchEpisode$episode? episode;
  final void Function(Fragment$KidsEpisodeThumbnail) onEpisodeTap;
  final EdgeInsets? padding;
  final int? autoPlayCountdown;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final episodes = episode?.next;
    if (episodes == null || episodes.isEmpty) {
      return Padding(
        padding: padding ?? const EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: design.buttons.small(onPressed: () => context.router.back(), labelText: S.of(context).exploreContent),
          ),
        ),
      );
    }

    final hideTitle = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return SingleChildScrollView(
      padding: padding,
      scrollDirection: Axis.horizontal,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: episodes.length,
        itemBuilder: (context, i) {
          final ep = episodes[i];
          return Container(
            margin: const EdgeInsets.only(right: 20),
            child: AspectRatio(
              aspectRatio: hideTitle ? 16 / 9 : 16 / 12.1,
              child: EpisodeGridItemRenderer(
                EpisodeGridItem(
                  id: ep.id,
                  title: ep.title,
                  image: ep.image,
                  duration: ep.duration,
                ),
                key: ValueKey(ep.id),
                hideTitle: ResponsiveBreakpoints.of(context).smallerThan(TABLET),
                onPressed: (_) {
                  onEpisodeTap(ep);

                  ref.read(analyticsProvider).sectionItemClicked(
                        context,
                        sectionAnalyticsOverride: SectionAnalyticsData(
                          id: 'NextEpisodes-${episode?.id}',
                          position: 0,
                          type: 'NextEpisodesGrid',
                        ),
                        itemAnalyticsOverride: SectionItemAnalyticsData(
                          id: ep.id,
                          position: i,
                          type: ep.$__typename,
                          name: ep.title,
                        ),
                      );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

filterAndOrderTracksBasedOnLanguageList(List<String> languages, List<Track?> tracks) {
  return languages.fold<List<Track>>(
    [],
    (previousValue, language) => previousValue
      ..addAll(
        tracks.safe.where((t) => t.language != null && normalizeLanguage(t.language!) == language),
      ),
  );
}
