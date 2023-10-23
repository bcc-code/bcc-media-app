import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/helpers/svg_icons.dart';

class PlayerControls extends HookWidget {
  const PlayerControls({
    super.key,
    required this.show,
  });

  final bool show;

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
    return ValueListenableBuilder<PlayerState>(
      valueListenable: viewController.playerController,
      builder: (context, state, widget) => Align(
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
                state.playbackState == PlaybackState.playing
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
                          viewController.playerController.play();
                        },
                        image: SvgPicture.string(
                          SvgIcons.play,
                          colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                        ),
                        labelText: '',
                      ),
                const Expanded(
                  child: SizedBox(
                    height: 16,
                    child: Timeline(),
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
    );
  }
}

class Timeline extends HookWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    final time = useState(0.5);
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
        value: time.value,
        onChanged: (double value) {
          time.value = value;
        },
      ),
    );
  }
}
