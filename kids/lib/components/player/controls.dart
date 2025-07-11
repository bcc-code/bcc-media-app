import 'dart:ui';

import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/controls.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/helpers/svg_icons.dart';

class PlayerControls extends HookWidget {
  const PlayerControls({
    super.key,
    required this.show,
    required this.onPlayRequestedWithoutVideo,
  });

  final bool show;
  final void Function() onPlayRequestedWithoutVideo;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: 1.ms,
    );
    useEffect(() {
      if (show) {
        animationController.forward(from: 0);
      } else {
        animationController.reverse(from: 1);
        debugPrint('running reverse');
      }
      return null;
    }, [show]);
    final viewController = BccmPlayerViewController.of(context);
    final design = DesignSystem.of(context);
    final playbackState = useListenableSelector(viewController.playerController, () => viewController.playerController.value.playbackState);
    return Stack(
      children: [
        Positioned(
          top: 16,
          right: 16,
          child: Semantics(
            identifier: 'player_cast_button',
            child: design.buttons.small(
              variant: ButtonVariant.secondary,
              onPressed: () {
                BccmPlayerInterface.instance.openCastDialog();
              },
              image: SvgPicture.string(
                SvgIcons.cast,
                colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
              ),
              labelText: '',
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  design.colors.label1.withOpacity(0.0),
                  Colors.black.withOpacity(0.6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.only(top: 40),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 24, right: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: playbackState == PlaybackState.playing
                        ? Semantics(
                            identifier: 'player_pause_button',
                            child: design.buttons.small(
                              variant: ButtonVariant.secondary,
                              onPressed: () {
                                viewController.playerController.pause();
                              },
                              image: SvgPicture.string(
                                SvgIcons.pause,
                                colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                              ),
                              labelText: '',
                            ),
                          )
                        : Semantics(
                            identifier: 'player_play_button',
                            child: design.buttons.small(
                              variant: ButtonVariant.secondary,
                              onPressed: () {
                                if (viewController.playerController.value.currentMediaItem != null &&
                                    viewController.playerController.value.error == null) {
                                  viewController.playerController.play();
                                } else {
                                  onPlayRequestedWithoutVideo();
                                }
                              },
                              image: SvgPicture.string(
                                SvgIcons.play,
                                colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                              ),
                              labelText: '',
                            ),
                          ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 16,
                      child: TimeBar(playerController: viewController.playerController),
                    ),
                  )
                ],
              ).animate(controller: animationController).slideY(
                    duration: 400.ms,
                    begin: 2,
                    curve: animationController.status == AnimationStatus.forward ? Curves.easeOutExpo : Curves.easeInExpo,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class TimeBar extends HookWidget {
  const TimeBar({
    super.key,
    required this.playerController,
  });

  final BccmPlayerController playerController;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final timeline = useTimeline(playerController);

    final durationTime = getFormattedDuration((timeline.duration ~/ 1000), padFirstSegment: true);
    final actualTime = getFormattedDuration((timeline.actualTimeMs ~/ 1000), padFirstSegment: true);

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            width: timeline.duration < const Duration(hours: 1).inMilliseconds ? 42 : 65,
            child: Text(
              actualTime,
              style: design.textStyles.title3.copyWith(
                color: Colors.white,
                shadows: <Shadow>[
                  const Shadow(
                    offset: Offset(0.0, 2.0),
                    color: Color(0x19041234),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: Timeline(playerController: playerController)),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
            width: timeline.duration < const Duration(hours: 1).inMilliseconds ? 42 : 65,
            child: Text(durationTime,
                style: design.textStyles.title3.copyWith(
                  color: Colors.white,
                  shadows: <Shadow>[
                    const Shadow(
                      offset: Offset(0.0, 2.0),
                      color: Color(0x19041234),
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}

class Timeline extends HookWidget {
  const Timeline({
    super.key,
    required this.playerController,
  });

  final BccmPlayerController playerController;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final timeline = useTimeline(playerController);

    void updateProgress(Offset localPosition) {
      final RenderBox box = context.findRenderObject().as<RenderBox>();
      final double width = box.size.width;
      final double position = localPosition.dx;

      final double newTimeFraction = (position / width).clamp(0.0, 1.0);

      timeline.scrubTo(newTimeFraction * timeline.duration);
    }

    void onHorizontalDragUpdate(DragUpdateDetails details) {
      updateProgress(details.localPosition);
    }

    void onTapUp(TapUpDetails details) {
      updateProgress(details.localPosition);
    }

    return GestureDetector(
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onTapUp: onTapUp,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0.0, 2.0),
                    blurRadius: 0.0,
                    color: Color(0x19041234),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28.0),
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20, tileMode: TileMode.mirror),
                      child: Container(
                        height: 16.0,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(55.0),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: timeline.timeFraction,
                        child: Stack(
                          children: [
                            Container(
                              height: 16.0,
                              decoration: BoxDecoration(
                                color: design.colors.tint1Dark,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -2),
                              child: Container(
                                height: 16.0,
                                decoration: BoxDecoration(
                                  color: design.colors.tint1,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
