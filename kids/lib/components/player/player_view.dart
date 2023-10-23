import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/graphql/queries/kids/episodes.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/schema.graphql.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/appbar_close_button.dart';
import 'package:kids/components/grid/episode_grid.dart';
import 'package:kids/components/player/controls.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:skeletonizer/skeletonizer.dart' as skeletonizer;

class PlayerView extends HookWidget {
  const PlayerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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

    final timeOpened = useMemoized(() => DateTime.now());
    final controlsVisible = useState(false);

    final setControlsVisible = useCallback((bool value) {
      debugPrint(value.toString());
      if (controlsVisible.value == value) {
        return;
      }
      controlsVisible.value = value;
      if (value) {
        animationController.forward(from: 0.0);
      } else {
        animationController.reverse(from: 1.0);
        if (viewController.playerController.value.playbackState != PlaybackState.playing) {
          viewController.playerController.play();
        }
      }
    }, []);

    void toggleOpen() {
      setControlsVisible(!controlsVisible.value);
    }

    final lastEpisodeId = useState(viewController.playerController.value.currentMediaItem?.metadata?.extras?['id']);

    useEffect(() {
      void listener() {
        final episodeId = viewController.playerController.value.currentMediaItem?.metadata?.extras?['id'];
        if (episodeId != null) {
          lastEpisodeId.value = episodeId;
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
            const bottomOpenMinimumHeight = 200.0;
            final topOpenTargetHeight = bp.smallerThan(TABLET) ? 12.0 : 40.0;

            final sideWidthTweened = sideOpenTargetWidth * curvedAnimation.value;

            final middleClosedHeight = min(constraints.maxHeight, (constraints.maxWidth) * (9 / 16));
            final middleOpenTargetHeight =
                min(constraints.maxHeight - bottomOpenMinimumHeight, (constraints.maxWidth - sideOpenTargetWidth * 2) * (9 / 16));
            final middleHeightTweened = curvedAnimation.drive(Tween(begin: middleClosedHeight, end: middleOpenTargetHeight)).value;

            final remainingHeightWhenOpen = max(0.0, constraints.maxHeight - middleOpenTargetHeight);
            final remainingHeightWhenClosed = max(0.0, constraints.maxHeight - middleClosedHeight);
            final remainingHeight = max(0.0, constraints.maxHeight - middleHeightTweened);

            final topHeightTweened = curvedAnimation.drive(Tween(begin: remainingHeightWhenClosed / 2, end: topOpenTargetHeight));

            final bottomOpenTargetHeight = max(bottomOpenMinimumHeight, remainingHeightWhenOpen - topOpenTargetHeight);
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
                                child: VideoPlatformView(
                                  playerController: viewController.playerController,
                                  showControls: false,
                                  useSurfaceView: viewController.config.useSurfaceView,
                                  allowSystemGestures: viewController.config.allowSystemGestures,
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
                        offset:
                            Offset(0, (bottomOpenTargetHeight - bottomOpenHeight + (remainingHeightWhenClosed / 2) * (1 - curvedAnimation.value))),
                        child: lastEpisodeId.value == null
                            ? null
                            : OverflowBox(
                                alignment: Alignment.topLeft,
                                maxHeight: bottomOpenTargetHeight,
                                minHeight: bottomOpenTargetHeight,
                                child: Container(
                                  height: bottomOpenTargetHeight,
                                  padding: EdgeInsets.only(top: bp.smallerThan(TABLET) ? 12 : 32),
                                  child: SingleChildScrollView(
                                    padding: EdgeInsets.symmetric(horizontal: basePadding),
                                    scrollDirection: Axis.horizontal,
                                    child: PlayerEpisodes(
                                      height: bottomOpenTargetHeight,
                                      episodeId: lastEpisodeId.value!,
                                      cursor: null,
                                      onChange: () {},
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
                  onPressed: () => (),
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

class PlayerEpisodes extends HookConsumerWidget {
  const PlayerEpisodes({
    super.key,
    required this.height,
    required this.episodeId,
    required this.onChange,
    this.cursor,
  });

  final double height;
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

    final design = DesignSystem.of(context);

    if (query.result.isLoading) {
      return skeletonizer.Skeletonizer(
        containersColor: design.colors.background2,
        effect: const skeletonizer.ShimmerEffect(),
        textBoneBorderRadius: skeletonizer.TextBoneBorderRadius(BorderRadius.circular(55)),
        child: Row(
          children: List.generate(
            15,
            (i) => Container(
              height: height,
              margin: const EdgeInsets.only(right: 20),
              child: AspectRatio(
                aspectRatio: 16 / 12,
                child: EpisodeGridItemRenderer(
                  EpisodeGridItem(
                    id: 'id',
                    title: 'A very long title',
                    image: null,
                    duration: null,
                  ),
                  enableMorph: false,
                  hideTitle: ResponsiveBreakpoints.of(context).smallerThan(TABLET),
                  onTap: () => (),
                ),
              ),
            ),
          ),
        ),
      );
    }
    if (query.result.parsedData == null) {
      return Container();
    }
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: query.result.parsedData!.episode.next.length,
      itemBuilder: (context, i) {
        final ep = query.result.parsedData!.episode.next[i];
        return Container(
          height: height,
          margin: const EdgeInsets.only(right: 20),
          child: AspectRatio(
            aspectRatio: 16 / 12,
            child: EpisodeGridItemRenderer(
              EpisodeGridItem(
                id: ep.id,
                title: ep.title,
                image: ep.image,
                duration: ep.duration,
              ),
              enableMorph: false,
              hideTitle: ResponsiveBreakpoints.of(context).smallerThan(TABLET),
              onTap: () {
                ref.read(playbackServiceProvider).playEpisode(
                      playerId: BccmPlayerViewController.of(context).playerController.value.playerId,
                      episode: ep,
                    );
              },
            ),
          ),
        );
      },
    );
  }
}
