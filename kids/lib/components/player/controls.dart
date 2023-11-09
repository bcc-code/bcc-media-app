import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/controls.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

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
    }, [show]);
    final viewController = BccmPlayerViewController.of(context);
    final design = DesignSystem.of(context);
    final playbackState = useListenableSelector(viewController.playerController, () => viewController.playerController.value.playbackState);
    return Stack(
      children: [
        Positioned(
          top: 16,
          right: 16,
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
                  playbackState == PlaybackState.playing
                      ? design.buttons.small(
                          variant: ButtonVariant.secondary,
                          onPressed: () {
                            viewController.playerController.pause();
                          },
                          image: SvgPicture.string(
                            SvgIcons.pause,
                            colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                          ),
                          labelText: '',
                        )
                      : design.buttons.small(
                          variant: ButtonVariant.secondary,
                          onPressed: () {
                            if (viewController.playerController.value.currentMediaItem != null) {
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
                  Expanded(
                    child: SizedBox(
                      height: 16,
                      child: Timeline(playerController: viewController.playerController),
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

class Timeline extends HookWidget {
  const Timeline({
    super.key,
    required this.playerController,
  });

  final BccmPlayerController playerController;

  @override
  Widget build(BuildContext context) {
    final timeline = useTimeline(playerController);
    return SliderTheme(
      data: SliderThemeData(
        thumbShape: SliderComponentShape.noThumb,
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 16,
        inactiveTrackColor: Colors.white.withOpacity(0.5),
      ),
      child: Slider(
        min: 0,
        max: 1,
        value: timeline.timeFraction,
        onChanged: (double value) {
          timeline.scrubTo(value * timeline.duration);
        },
      ),
    );
  }
}
