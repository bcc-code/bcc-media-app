// ignore_for_file: invalid_use_of_protected_member

import 'dart:math';

import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/src/helpers/utils/debouncer.dart';
import 'package:bccm_player/src/widgets/controls/controls_wrapper.dart';
import 'package:bccm_player/src/widgets/mini_player/loading_indicator.dart';
import 'package:bccm_player/theme/bccm_player_theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';

import '../../helpers/utils/time.dart';
import 'settings/settings_sheet_wrapper.dart';

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
    final controlsTheme = PlayerTheme.safeOf(context).controls!;
    final player = useState(BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId)?.state);
    final seekDebouncer = useMemoized(() => Debouncer(milliseconds: 1000));
    useEffect(() {
      void listener(PlayerState state) {
        player.value = state;
      }

      return BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId)?.addListener(listener);
    });
    final currentMs = player.value?.playbackPositionMs ?? 0;
    final duration = player.value?.currentMediaItem?.metadata?.durationMs ?? player.value?.playbackPositionMs?.toDouble() ?? 1;
    final isFullscreen = player.value?.isFlutterFullscreen == true;
    final seeking = useState(false);
    final currentScrub = useState(0.0);
    void scrubTo(double value) {
      if ((currentScrub.value - value).abs() < 0.01) {
        currentScrub.value = value;
        return;
      }
      currentScrub.value = value;
      seeking.value = true;
      seekDebouncer.run(() async {
        if (!context.mounted) return;
        await BccmPlayerInterface.instance.seekTo(playerId, currentScrub.value * duration);
        seeking.value = false;
      });
    }

    final title = player.value?.currentMediaItem?.metadata?.title;

    return SizedBox.expand(
      child: ControlsWrapper(
        autoHide: player.value?.playbackState == PlaybackState.playing,
        child: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (isFullscreen) ...[
                        IconButton(
                          icon: const Icon(Icons.close),
                          iconSize: 32,
                          color: controlsTheme.iconColor,
                          padding: const EdgeInsets.all(12),
                          onPressed: () {
                            Navigator.maybePop(context);
                          },
                        ),
                        if (title != null)
                          Text(
                            title,
                            style: controlsTheme.fullscreenTitleStyle,
                          ),
                      ],
                      const Spacer(),
                      SettingsSheet(
                        playerId: playerId,
                        padding: const EdgeInsets.only(top: 12, bottom: 24, left: 24, right: 8),
                        controlsTheme: controlsTheme,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (player.value?.playbackState != PlaybackState.playing)
                      IconButton(
                        icon: const Icon(Icons.play_arrow),
                        iconSize: 54,
                        color: controlsTheme.iconColor,
                        onPressed: () {
                          BccmPlayerInterface.instance.play(playerId);
                        },
                      )
                    else
                      IconButton(
                        icon: player.value?.isBuffering == true
                            ? LoadingIndicator(
                                width: 48,
                                height: 48,
                                color: controlsTheme.iconColor,
                              )
                            : const Icon(Icons.pause),
                        iconSize: 54,
                        color: controlsTheme.iconColor,
                        onPressed: () {
                          BccmPlayerInterface.instance.pause(playerId);
                        },
                      ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 42,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (player.value?.currentMediaItem?.isLive != true)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8, left: 12),
                              child: Text(
                                '${formatMinutesAndSeconds(currentMs)} / ${formatMinutesAndSeconds(duration)}',
                                style: controlsTheme.durationTextStyle,
                              ),
                            ),
                          const Spacer(),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if (!isFullscreen) {
                                goFullscreen();
                              } else {
                                exitFullscreen();
                              }
                            },
                            child: Container(
                              height: double.infinity,
                              alignment: Alignment.bottomRight,
                              padding: const EdgeInsets.only(right: 8, top: 8, bottom: 5, left: 20),
                              child: Icon(
                                isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                                color: controlsTheme.iconColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (player.value?.currentMediaItem?.isLive == true)
                      const Padding(padding: EdgeInsets.only(top: 12))
                    else
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: SliderTheme(
                                data: controlsTheme.progressBarTheme!,
                                child: SizedBox(
                                  height: 10,
                                  child: Slider(
                                    value: seeking.value
                                        ? currentScrub.value
                                        : min(1, (currentMs.isFinite ? currentMs : 0) / (duration.isFinite && duration > 0 ? duration : 1)),
                                    onChanged: (double value) {
                                      scrubTo(value);
                                    },
                                    onChangeEnd: (double value) {
                                      seekDebouncer.forceEarly();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
