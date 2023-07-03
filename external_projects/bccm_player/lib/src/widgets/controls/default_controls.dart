// ignore_for_file: invalid_use_of_protected_member

import 'dart:math';

import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/src/utils/debouncer.dart';
import 'package:bccm_player/src/widgets/controls/controls_wrapper.dart';
import 'package:bccm_player/src/widgets/controls/settings/settings_sheet.dart';
import 'package:bccm_player/src/widgets/mini_player/loading_indicator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../configuration/bccm_player_configuration.dart';
import '../../utils/svg_icons.dart';
import '../../utils/time.dart';
import 'control_fade_out.dart';

class DefaultControls extends HookWidget {
  const DefaultControls({
    super.key,
    required this.playerId,
    required this.goFullscreen,
    required this.exitFullscreen,
    this.playNextButton,
  });

  final String playerId;
  final Future Function() goFullscreen;
  final Future Function() exitFullscreen;
  final WidgetBuilder? playNextButton;

  @override
  Widget build(BuildContext context) {
    final controlsTheme = PlayerConfiguration.safeOf(context).theme?.controls;
    final player = useState(BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId)?.state);
    final seekDebouncer = useMemoized(() => Debouncer(milliseconds: 1000));
    final forwardRewindDebouncer = useMemoized(() => Debouncer(milliseconds: 200, debounceInitial: false));
    useEffect(() {
      void listener(PlayerState state) {
        player.value = state;
      }

      return BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId)?.addListener(listener);
    });
    final currentMs = player.value?.playbackPositionMs ?? 0;
    final duration = player.value?.currentMediaItem?.metadata?.durationMs ?? player.value?.playbackPositionMs?.toDouble() ?? 1;
    final forwardRewindDurationSec = Duration(milliseconds: duration.toInt()).inMinutes > 60 ? 30 : 15;
    final isFullscreen = player.value?.isFlutterFullscreen == true;
    final seeking = useState(false);
    final currentScrub = useState(0.0);
    final totalSeekToDurationMs = useRef(0.0);

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

    void seekToRelative(int differenceSec) {
      totalSeekToDurationMs.value += differenceSec * 1000;
      double newPositionMs = currentMs + totalSeekToDurationMs.value;
      newPositionMs = min(duration, max(newPositionMs, 0));
      seeking.value = true;
      currentScrub.value = newPositionMs / duration;
      forwardRewindDebouncer.run(() async {
        if (!context.mounted) return;
        await BccmPlayerInterface.instance.seekTo(playerId, newPositionMs);
        totalSeekToDurationMs.value = 0;
        seeking.value = false;
      });
    }

    final title = player.value?.currentMediaItem?.metadata?.title;

    return SizedBox.expand(
      child: ControlsWrapper(
        autoHide: player.value?.playbackState == PlaybackState.playing,
        builder: (context) => SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: ControlFadeOut(
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
                            color: controlsTheme?.iconColor,
                            padding: const EdgeInsets.all(12),
                            onPressed: () {
                              Navigator.maybePop(context);
                            },
                          ),
                          if (title != null)
                            Text(
                              title,
                              style: controlsTheme?.fullscreenTitleStyle,
                            ),
                        ],
                        const Spacer(),
                        SettingsSheet(
                          playerId: playerId,
                          padding: const EdgeInsets.only(top: 12, bottom: 24, left: 24, right: 8),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ControlFadeOut(
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: IconButton(
                          icon: const Icon(Icons.replay),
                          iconSize: 42,
                          color: controlsTheme?.iconColor,
                          onPressed: () => seekToRelative(-forwardRewindDurationSec),
                        ),
                      ),
                      if (player.value?.playbackState != PlaybackState.playing)
                        IconButton(
                          constraints: const BoxConstraints.tightFor(width: 68, height: 68),
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: SvgPicture.string(
                              SvgIcons.play,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          color: controlsTheme?.iconColor,
                          onPressed: () {
                            BccmPlayerInterface.instance.play(playerId);
                          },
                        )
                      else
                        IconButton(
                          constraints: const BoxConstraints.tightFor(width: 68, height: 68),
                          icon: player.value?.isBuffering == true
                              ? LoadingIndicator(
                                  width: 42,
                                  height: 42,
                                  color: controlsTheme?.iconColor,
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: SvgPicture.string(
                                    SvgIcons.pause,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                          iconSize: 42,
                          color: controlsTheme?.iconColor,
                          onPressed: () {
                            BccmPlayerInterface.instance.pause(playerId);
                          },
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: IconButton(
                          icon: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(pi),
                            child: const Icon(Icons.replay),
                          ),
                          iconSize: 42,
                          color: controlsTheme?.iconColor,
                          onPressed: () => seekToRelative(forwardRewindDurationSec),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (playNextButton != null && isFullscreen)
                            Padding(padding: const EdgeInsets.only(bottom: 8, right: 12), child: playNextButton!(context)),
                        ],
                      ),
                    ),
                    ControlFadeOut(
                      child: SizedBox(
                        height: 42,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (player.value?.currentMediaItem?.isLive != true)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8, left: 12),
                                child: Text(
                                  '${getFormattedDuration(currentMs)} / ${getFormattedDuration(duration)}',
                                  style: controlsTheme?.durationTextStyle,
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
                                  color: controlsTheme?.iconColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (player.value?.currentMediaItem?.isLive == true)
                      const Padding(padding: EdgeInsets.only(top: 12))
                    else
                      ControlFadeOut(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: SliderTheme(
                                  data: controlsTheme!.progressBarTheme!,
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
