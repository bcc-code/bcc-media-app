import 'dart:math';

import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';
import 'package:bccm_player/src/pigeon/pigeon_extensions.dart';
import 'package:bccm_player/src/utils/debouncer.dart';
import 'package:bccm_player/src/widgets/controls/controls_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../utils/time.dart';

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
        debugPrint(currentScrub.value.toString() + ' ,,,, ' + value.toString());
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

    debugPrint('bccm: duration: ${player.value?.currentMediaItem?.metadata?.durationMs}');
    debugPrint('bccm: player data: ${player.value?.toString() ?? 'no player data'}');
    debugPrint('bccm: seeking: $seeking');
    debugPrint('bccm: seeking: $currentScrub');

    final title = player.value?.currentMediaItem?.metadata?.title;

    final w = SizedBox.expand(
      child: ControlsWrapper(
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
                        icon: const Icon(Icons.close, size: 32),
                        onPressed: () {
                          Navigator.maybePop(context);
                        },
                      ),
                      if (title != null)
                        Container(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                    ]
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      player.value?.playbackState != PlaybackState.playing ? Icons.play_arrow : Icons.pause,
                      size: 54,
                    ),
                    onPressed: () {
                      if (player.value?.playbackState != PlaybackState.playing) {
                        BccmPlayerInterface.instance.play(playerId);
                      } else {
                        BccmPlayerInterface.instance.pause(playerId);
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 2,
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                              overlayShape: SliderComponentShape.noOverlay,
                            ),
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
                        Padding(
                          padding: EdgeInsets.only(right: 3),
                          child: Text(
                            '${formatMinutesAndSeconds(currentMs)} / ${formatMinutesAndSeconds(duration)}',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 12),
                          child: _SettingsWidget(playerId: playerId),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!isFullscreen) {
                              debugPrint('bccm: not fullscreen, so go fullscreen');
                              goFullscreen();
                            } else {
                              debugPrint('bccm: is fullscreen, so exit fullscreen');
                              exitFullscreen();
                            }
                          },
                          child: Icon(
                            isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
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
    );

    return isFullscreen ? SafeArea(child: w) : w;
  }
}

class _SettingsWidget extends HookWidget {
  const _SettingsWidget({required this.playerId});

  final String playerId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // open bottom sheet with settings
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          builder: (context) => _Settings(playerId: playerId),
        );
      },
      child: const Icon(Icons.settings),
    );
  }
}

class _Settings extends HookWidget {
  const _Settings({required this.playerId});
  final String playerId;
  @override
  Widget build(BuildContext context) {
    final tracksFuture = useMemoized(() {
      return BccmPlayerInterface.instance.getPlayerTracks(playerId: playerId);
    }, [playerId]);
    final tracksSnapshot = useFuture(tracksFuture);

    if (tracksSnapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (tracksSnapshot.hasError) {
      return Center(child: Text(tracksSnapshot.error.toString()));
    }

    final tracksData = tracksSnapshot.data;
    if (tracksData == null) {}

    final selectedAudioTrack = tracksData?.audioTracks.safe.firstWhereOrNull((element) => element.isSelected);
    final selectedTextTrack = tracksData?.textTracks.safe.firstWhereOrNull((element) => element.isSelected);

    return Container(
      color: Theme.of(context).dialogBackgroundColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          if (tracksData?.audioTracks.isNotEmpty == true)
            ListTile(
              dense: true,
              onTap: () async {
                final selected = await showModalBottomSheet<String>(
                  context: context,
                  isDismissible: true,
                  builder: (context) => SettingsTrackList(tracks: tracksData!.audioTracks),
                );
                if (selected != null && context.mounted) {
                  BccmPlayerInterface.instance.setSelectedTrack(playerId, TrackType.audio, selected);
                  Navigator.pop(context);
                }
              },
              title: Text(
                'Audio: ${selectedAudioTrack?.labelWithFallback ?? 'N/A'}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          if (tracksData?.textTracks.isNotEmpty == true)
            ListTile(
              dense: true,
              title: Text('Subtitles: ${selectedTextTrack?.labelWithFallback ?? 'N/A'}', style: Theme.of(context).textTheme.labelMedium),
              onTap: () async {
                final selected = await showModalBottomSheet<String>(
                  context: context,
                  isDismissible: true,
                  builder: (context) => SettingsTrackList(tracks: tracksData!.textTracks),
                );
                if (selected != null && context.mounted) {
                  BccmPlayerInterface.instance.setSelectedTrack(playerId, TrackType.text, selected);
                  Navigator.pop(context);
                }
              },
            ),
        ],
      ),
    );
  }
}

class SettingsTrackList extends StatelessWidget {
  const SettingsTrackList({
    super.key,
    required this.tracks,
  });

  final List<Track?> tracks;

  @override
  Widget build(BuildContext context) {
    // show list of audio tracks with a tick on the selected one
    return Container(
      color: Theme.of(context).dialogBackgroundColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          for (final track in tracks.safe)
            ListTile(
              dense: true,
              onTap: () {
                // select this track
                Navigator.pop(context, track.id);
              },
              title: Text(track.labelWithFallback, style: Theme.of(context).textTheme.labelMedium),
              trailing: track.isSelected ? const Icon(Icons.check) : null,
            ),
        ],
      ),
    );
  }
}
