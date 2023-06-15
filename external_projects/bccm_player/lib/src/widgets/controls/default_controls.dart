import 'package:bccm_player/bccm_player.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';

class DefaultControls extends HookWidget {
  const DefaultControls({
    super.key,
    required this.playerId,
    required this.goFullscreen,
    required this.exitFullscreen,
  });

  final String playerId;
  final Future Function() goFullscreen;
  final Future Function() exitFullscreen;

  @override
  Widget build(BuildContext context) {
    final player = useState(BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId)?.state);
    useEffect(() {
      void listener(PlayerState state) {
        player.value = state;
      }

      return BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId)?.addListener(listener);
    });
    final currentMs = player.value?.playbackPositionMs ?? 0;
    final duration = player.value?.currentMediaItem?.metadata?.durationMs ?? player.value?.playbackPositionMs?.toDouble() ?? 1;
    debugPrint('bccm: player data: ${player.value?.toString() ?? 'no player data'}');
    final isFullscreen = player.value?.isFlutterFullscreen == true;
    void seekTo(double positionMs) {
      BccmPlayerInterface.instance.seekTo(playerId, positionMs);
    }

    final w = Container(
      alignment: Alignment.bottomCenter,
      color: Colors.black.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                player.value?.playbackState != PlaybackState.playing ? Icons.play_arrow : Icons.pause,
              ),
              onPressed: () {
                if (player.value?.playbackState != PlaybackState.playing) {
                  BccmPlayerInterface.instance.play(playerId);
                } else {
                  BccmPlayerInterface.instance.pause(playerId);
                }
              },
            ),
            Expanded(
              child: Slider(
                value: (currentMs.isFinite ? currentMs : 0) / (duration.isFinite && duration > 0 ? duration : 1),
                onChanged: (double value) {
                  final positionMs = value * duration;
                  seekTo(positionMs);
                },
              ),
            ),
            IconButton(
              icon: Icon(
                isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
              ),
              onPressed: () {
                if (!isFullscreen) {
                  debugPrint('bccm: not fullscreen, so go fullscreen');
                  goFullscreen();
                } else {
                  debugPrint('bccm: is fullscreen, so exit fullscreen');
                  exitFullscreen();
                }
              },
            ),
          ],
        ),
      ),
    );

    return isFullscreen ? SafeArea(child: w) : w;
  }
}
