import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/controls.dart';
import 'package:brunstadtv_app/components/player/audio_only_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AudioOnlyPlayer extends HookConsumerWidget {
  const AudioOnlyPlayer({
    required this.viewController,
    super.key,
  });

  final BccmPlayerViewController viewController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final playerState = viewController.playerController.value;
    final currentPlaybackPosition = playerState.playbackPositionMs;
    final duration = playerState.currentMediaItem?.metadata?.durationMs;

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: design.colors.background1,
            backgroundBlendMode: BlendMode.multiply,
          ),
          child: Row(
            children: [
              PlayPauseButton(
                player: viewController.playerController,
                iconSize: 40,
              ),
              if (currentPlaybackPosition != null && duration != null)
                Text(
                  '${getFormattedDuration((currentPlaybackPosition / 1000).toInt())} / ${getFormattedDuration((duration / 1000).toInt())}',
                  style: design.textStyles.caption2.copyWith(
                    color: design.colors.label2,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
              const Spacer(),
              AudioOnlyButton(),
            ],
          ),
        ),
        Positioned(
          bottom: -8,
          left: 0,
          right: 0,
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 4,
              trackShape: RectangularSliderTrackShape(),
              thumbColor: Colors.transparent,
            ),
            child: Slider(
              padding: EdgeInsets.all(0),
              max: duration ?? 0,
              value: currentPlaybackPosition?.toDouble() ?? 0,
              onChanged: (value) {
                viewController.playerController.seekTo(Duration(milliseconds: value.toInt()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
