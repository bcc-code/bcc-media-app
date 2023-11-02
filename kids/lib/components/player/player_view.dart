import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/kids/episodes.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/schema.graphql.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/helpers/router/custom_transitions.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/inherited_data.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/appbar_close_button.dart';
import 'package:kids/components/buttons/tab_switcher.dart';
import 'package:kids/components/dialog/dialog.dart';
import 'package:kids/components/grid/episode_grid.dart';
import 'package:kids/components/player/controls.dart';
import 'package:kids/components/settings/applanguage_list.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:kids/helpers/transitions.dart';
import 'package:kids/router/router.gr.dart';
import 'package:mockito/mockito.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:skeletonizer/skeletonizer.dart' as skeletonizer;

class PlayerView extends HookConsumerWidget {
  const PlayerView({
    super.key,
    this.episode,
  });

  final Query$FetchEpisode$episode? episode;

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

    final morphTransition = InheritedData.listen<MorphTransitionInfo>(context);
    final currentMediaItem = useState(viewController.playerController.value.currentMediaItem);

    final controlsVisible = useState(false);

    setControlsVisible(bool value) {
      if (controlsVisible.value == value) {
        return;
      }
      controlsVisible.value = value;
      if (value) {
        animationController.forward(from: 0.0);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      } else {
        animationController.reverse(from: 1.0);
        if (viewController.playerController.value.playbackState != PlaybackState.playing && currentMediaItem.value != null) {
          viewController.playerController.play();
        } else if (currentMediaItem.value == null && episode != null) {
          ref.read(playbackServiceProvider).playEpisode(
                playerId: viewController.playerController.value.playerId,
                episode: episode!,
              );
        }
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      }
    }

    void toggleOpen() {
      setControlsVisible(!controlsVisible.value);
    }

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 500)).then((_) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      });
      return () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      };
    }, []);

    final lastEpisodeId = useState(currentMediaItem.value?.metadata?.extras?['id']);
    final buffering = useState(false);
    final last5SecondsHandled = useState(false);

    useEffect(() {
      void listener() {
        currentMediaItem.value = viewController.playerController.value.currentMediaItem;
        final episodeId = viewController.playerController.value.currentMediaItem?.metadata?.extras?['id'];
        if (episodeId != null) {
          lastEpisodeId.value = episodeId;
        }
        buffering.value = viewController.playerController.value.isBuffering;
        final duration = viewController.playerController.value.currentMediaItem?.metadata?.durationMs;
        final position = viewController.playerController.value.playbackPositionMs;
        if (duration != null && position != null) {
          if (duration > 0 && duration - position < 10000) {
            if (!last5SecondsHandled.value) {
              setControlsVisible(true);
              last5SecondsHandled.value = true;
            }
          } else {
            last5SecondsHandled.value = false;
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

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: curvedAnimation.drive(ColorTween(begin: Colors.black, end: Colors.white)).value,
          ),
          LayoutBuilder(builder: (context, constraints) {
            // Calculate the height of the middle box based on the aspect ratio
            final sideOpenTargetWidth = 152.0;
            final bottomOpenMinimumHeight = bp.smallerThan(TABLET) ? 170.0 : 300.0;
            final topOpenTargetHeight = bp.smallerThan(TABLET) ? 12.0 : 40.0;

            final sideWidthTweened = sideOpenTargetWidth * curvedAnimation.value;

            final middleClosedHeight = min(constraints.maxHeight, (constraints.maxWidth) * (9 / 16));
            final middleOpenTargetHeight = min(
                constraints.maxHeight - bottomOpenMinimumHeight - topOpenTargetHeight, (constraints.maxWidth - sideOpenTargetWidth * 2) * (9 / 16));
            final middleHeightTweened = curvedAnimation.drive(Tween(begin: middleClosedHeight, end: middleOpenTargetHeight)).value;

            final remainingHeightWhenOpen = max(0.0, constraints.maxHeight - middleOpenTargetHeight);
            final remainingHeightWhenClosed = max(0.0, constraints.maxHeight - middleClosedHeight);
            final remainingHeight = max(0.0, constraints.maxHeight - middleHeightTweened);

            final topHeightTweened = curvedAnimation.drive(Tween(begin: remainingHeightWhenClosed / 2, end: topOpenTargetHeight));

            final bottomOpenTargetHeight = remainingHeightWhenOpen - topOpenTargetHeight;
            final bottomOpenHeight = max(remainingHeight / 2, bottomOpenTargetHeight);
            final bottomHeightTweened = curvedAnimation.drive(Tween(begin: remainingHeight / 2, end: bottomOpenHeight));
            return Column(
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
                                child: morphTransition?.active == true
                                    ? const AspectRatio(aspectRatio: 16 / 9)
                                    : VideoPlatformView(
                                        playerController: viewController.playerController,
                                        showControls: false,
                                        useSurfaceView: viewController.config.useSurfaceView,
                                        allowSystemGestures: viewController.config.allowSystemGestures,
                                      ),
                              ),
                              Positioned.fill(
                                  child: currentMediaItem.value == null && episode?.image != null && lastEpisodeId.value != null
                                      ? simpleFadeInImage(url: episode!.image!)
                                      : Container()),
                              Positioned.fill(
                                child: Center(
                                  child: !buffering.value
                                      ? const SizedBox(width: 42, height: 429)
                                      : const LoadingIndicator(
                                          width: 42,
                                          height: 42,
                                        ),
                                ),
                              ),
                              Positioned.fill(
                                child: Opacity(
                                  opacity: curvedAnimation.value,
                                  child: PlayerControls(show: controlsVisible.value),
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
                            child: lastEpisodeId.value == null
                                ? const Center(
                                    child: RepaintBoundary(
                                      child: LoadingIndicator(height: 24, width: 24),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    padding: EdgeInsets.symmetric(horizontal: basePadding).copyWith(bottom: MediaQuery.paddingOf(context).bottom),
                                    scrollDirection: Axis.horizontal,
                                    child: PlayerEpisodes(
                                      episodeId: lastEpisodeId.value!,
                                      cursor: null,
                                      onChange: () {
                                        setControlsVisible(false);
                                      },
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
          Positioned(
            top: 0,
            left: 0 - (1 - curvedAnimation.value) * 200,
            child: SafeArea(
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
              child: Padding(
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
            ),
          )
        ],
      ),
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
    useListenable(tabController);

    final tracksFuture = useState(useMemoized(playerController.getTracks));
    final tracksSnapshot = useFuture(tracksFuture.value);

    if (tracksSnapshot.data == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (tracksSnapshot.hasError) {
      return Center(child: Text(tracksSnapshot.error.toString()));
    }

    final preferredLanguages = ref.watch(settingsProvider.select((value) => value.audioLanguages));

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
          TabBarView(
            controller: tabController,
            children: [
              _TrackSelectionList(
                preferredTracks: tracksSnapshot.data!.audioTracks.safe.where((t) => preferredLanguages.contains(t.language)).toList(),
                otherTracks: tracksSnapshot.data!.audioTracks.safe.where((t) => !preferredLanguages.contains(t.language)).toList(),
                onSelectionChanged: (track) {
                  playerController.setSelectedTrack(TrackType.audio, track.id);
                  tracksFuture.value = playerController.getTracks();
                },
              ),
              _TrackSelectionList(
                preferredTracks: tracksSnapshot.data!.textTracks.safe.where((t) => preferredLanguages.contains(t.language)).toList(),
                otherTracks: tracksSnapshot.data!.textTracks.safe.where((t) => !preferredLanguages.contains(t.language)).toList(),
                onSelectionChanged: (track) {
                  playerController.setSelectedTrack(TrackType.text, track.id);
                  tracksFuture.value = playerController.getTracks();
                },
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
  });

  final List<Track> preferredTracks;
  final List<Track> otherTracks;
  final void Function(Track) onSelectionChanged;

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
              AppLanguageList(
                items: preferredTracks
                    .map(
                      (track) => AppLanguageListItem(
                        title: track.labelWithFallback,
                        selected: track.isSelected,
                        onPressed: () {
                          onSelectionChanged(track);
                        },
                      ),
                    )
                    .toList(),
              ),
              if (otherTracks.isNotEmpty && preferredTracks.isNotEmpty) ...[
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Other languages',
                    style: design.textStyles.body1.copyWith(color: design.colors.label2),
                  ),
                ),
              ],
              if (otherTracks.isNotEmpty == true) ...[
                AppLanguageList(
                  items: otherTracks
                      .map(
                        (track) => AppLanguageListItem(
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
    required this.episodeId,
    required this.onChange,
    this.cursor,
  });

  final String episodeId;
  final String? cursor;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewController = BccmPlayerViewController.of(context);
    final query = useQuery$KidsGetNextEpisodes(
      Options$Query$KidsGetNextEpisodes(
        variables: Variables$Query$KidsGetNextEpisodes(
          episodeId: episodeId,
          context: Input$EpisodeContext(
            shuffle: false,
            cursor: viewController.playerController.value.currentMediaItem?.metadata?.extras?['cursor'],
          ),
        ),
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (query.result.isLoading) {
      return const Center(
        child: LoadingIndicator(height: 24, width: 24),
      );
    }
    if (query.result.parsedData == null) {
      return const Center(
        child: LoadingIndicator(height: 24, width: 24),
      );
    }

    final hideTitle = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: query.result.parsedData!.episode.next.length,
      itemBuilder: (context, i) {
        final ep = query.result.parsedData!.episode.next[i];
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
              hideTitle: ResponsiveBreakpoints.of(context).smallerThan(TABLET),
              onPressed: (_) {
                ref.read(playbackServiceProvider).playEpisode(
                      playerId: BccmPlayerViewController.of(context).playerController.value.playerId,
                      episode: ep,
                    );
                onChange();

                ref.read(analyticsProvider).sectionItemClicked(context,
                    sectionAnalyticsOverride: SectionAnalytics(
                      id: 'NextEpisodes-$episodeId',
                      position: 0,
                      type: 'NextEpisodesGrid',
                    ),
                    itemAnalyticsOverride: SectionItemAnalytics(
                      id: ep.id,
                      position: i,
                      type: ep.$__typename,
                      name: ep.title,
                    ));
              },
            ),
          ),
        );
      },
    );
  }
}
