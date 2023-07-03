import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../../bccm_player.dart';
import '../../../theme/player_theme.dart';
import '../../utils/svg_icons.dart';

class PlayNextButton extends HookWidget {
  const PlayNextButton({
    super.key,
    required this.playerId,
    required this.onTap,
    this.text,
    this.appearAtTimeLeft = const Duration(seconds: 10),
  });

  final String playerId;
  final VoidCallback? onTap;
  final String? text;
  final Duration appearAtTimeLeft;

  @override
  Widget build(BuildContext context) {
    //player state
    final playerNotifier = BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId);
    final duration = useState<double?>(null);
    final timeLeft = useState(0.0);
    final controller = useAnimationController(
      duration: appearAtTimeLeft,
      initialValue: timeLeft.value / appearAtTimeLeft.inMilliseconds,
    );
    final playbackState = useState<PlaybackState>(PlaybackState.paused);
    useEffect(() {
      void listener(PlayerState state) {
        final durationMs = state.currentMediaItem?.metadata?.durationMs;
        duration.value = durationMs;
        if (durationMs == null || durationMs < appearAtTimeLeft.inMilliseconds) {
          return;
        }
        final newTimeLeft = calcTimeLeftMs(currentMs: state.playbackPositionMs, duration: state.currentMediaItem?.metadata?.durationMs);
        if (timeLeft.value > appearAtTimeLeft.inMilliseconds && newTimeLeft > appearAtTimeLeft.inMilliseconds) {
          // no need to update because we arent going to show it anyway
          return;
        }
        timeLeft.value = newTimeLeft;
        controller.duration = Duration(milliseconds: appearAtTimeLeft.inMilliseconds);
        final newFraction = 1 - newTimeLeft / appearAtTimeLeft.inMilliseconds;
        if ((newFraction - controller.value).abs() > 0.1) {
          controller.value = newFraction;
        }
        if (state.playbackState == PlaybackState.playing && !controller.isAnimating) {
          controller.forward();
        } else if (state.playbackState != PlaybackState.playing) {
          controller.stop(canceled: false);
        }
        playbackState.value = state.playbackState;
      }

      return BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId)?.addListener(listener, fireImmediately: true);
    }, [playerNotifier]);

    final shouldShow =
        duration.value != null && (duration.value! > appearAtTimeLeft.inMilliseconds) && (timeLeft.value < appearAtTimeLeft.inMilliseconds);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 50),
      child: !shouldShow
          ? null
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: FocusableActionDetector(
                mouseCursor: MaterialStateMouseCursor.clickable,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(color: PlayerTheme.safeOf(context).controls?.playNextButtonBackgroundColor),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizeTransition(
                            axis: Axis.horizontal,
                            sizeFactor: controller,
                            child: Container(color: PlayerTheme.safeOf(context).controls?.playNextButtonProgressColor),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: timeLeft.value == 0 && playbackState.value == PlaybackState.playing
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Theme.of(context).textTheme.titleMedium?.color,
                                      ),
                                    )
                                  : SvgPicture.string(
                                      SvgIcons.play,
                                      width: 20,
                                      height: 20,
                                      color: Theme.of(context).textTheme.titleMedium?.color,
                                    ),
                            ),
                            Text(
                              text ?? 'Next Video',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
