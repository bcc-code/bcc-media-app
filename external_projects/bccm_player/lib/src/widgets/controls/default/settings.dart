// ignore_for_file: invalid_use_of_protected_member

import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';
import 'package:bccm_player/src/pigeon/pigeon_extensions.dart';
import 'package:bccm_player/src/widgets/controls/default/settings_option_list.dart';
import 'package:bccm_player/theme/bccm_player_theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class SettingsButton extends HookWidget {
  const SettingsButton({
    super.key,
    required this.playerId,
    required this.controlsTheme,
    this.padding,
    this.playbackSpeeds = const [0.75, 1.0, 1.25, 1.5, 2.0],
  });

  final String playerId;
  final ControlsThemeData controlsTheme;
  final EdgeInsets? padding;
  final List<double> playbackSpeeds;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // open bottom sheet with settings
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          builder: (context) => _SettingsBottomSheet(
            playerId: playerId,
            controlsTheme: controlsTheme,
            playbackSpeeds: playbackSpeeds,
          ),
        );
      },
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Icon(Icons.settings, color: controlsTheme.iconColor),
      ),
    );
  }
}

class _SettingsBottomSheet extends HookWidget {
  const _SettingsBottomSheet({
    required this.playerId,
    required this.controlsTheme,
    required this.playbackSpeeds,
  });

  final String playerId;
  final ControlsThemeData controlsTheme;
  final List<double> playbackSpeeds;

  @override
  Widget build(BuildContext context) {
    getTracks() => BccmPlayerInterface.instance.getPlayerTracks(playerId: playerId);
    final tracksFuture = useState(useMemoized(getTracks));
    final tracksSnapshot = useFuture(tracksFuture.value);

    if (tracksSnapshot.data == null && tracksSnapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (tracksSnapshot.hasError) {
      return Center(child: Text(tracksSnapshot.error.toString()));
    }

    final tracksData = tracksSnapshot.data;
    if (tracksData == null) {}

    final selectedAudioTrack = tracksData?.audioTracks.safe.firstWhereOrNull((element) => element.isSelected);
    final selectedTextTrack = tracksData?.textTracks.safe.firstWhereOrNull((element) => element.isSelected);

    final playbackSpeed = useState(BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId)?.state.playbackSpeed);
    useEffect(() {
      void listener(PlayerState state) {
        playbackSpeed.value = state.playbackSpeed;
      }

      return BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId)?.addListener(listener);
    });

    return Container(
      color: controlsTheme.settingsListBackgroundColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          if (tracksData?.audioTracks.isNotEmpty == true)
            ListTile(
              dense: true,
              onTap: () async {
                final selected = await showModalOptionList<Track>(
                  context: context,
                  options: [
                    ...tracksData!.audioTracks.safe.map(
                      (track) => SettingsOption(value: track, label: track.labelWithFallback, isSelected: track.isSelected),
                    )
                  ],
                );
                if (selected != null && context.mounted) {
                  await BccmPlayerInterface.instance.setSelectedTrack(playerId, TrackType.audio, selected.value.language);
                  Future.delayed(const Duration(milliseconds: 100), () {
                    if (!context.mounted) return;
                    tracksFuture.value = getTracks();
                  });
                }
              },
              title: Text(
                'Audio: ${selectedAudioTrack?.labelWithFallback ?? 'N/A'}',
                style: controlsTheme.settingsListTextStyle,
              ),
            ),
          if (tracksData?.textTracks.isNotEmpty == true)
            ListTile(
              dense: true,
              title: Text('Subtitles: ${selectedTextTrack?.labelWithFallback ?? 'None'}', style: controlsTheme.settingsListTextStyle),
              onTap: () async {
                final selected = await showModalOptionList<Track?>(
                  context: context,
                  options: [
                    SettingsOption(value: null, label: "None", isSelected: selectedTextTrack == null),
                    ...tracksData!.textTracks.safe.map(
                      (track) => SettingsOption(value: track, label: track.labelWithFallback, isSelected: track.isSelected),
                    )
                  ],
                );
                if (selected != null && context.mounted) {
                  await BccmPlayerInterface.instance.setSelectedTrack(playerId, TrackType.text, selected.value?.language);
                  Future.delayed(const Duration(milliseconds: 100), () {
                    if (!context.mounted) return;
                    tracksFuture.value = getTracks();
                  });
                }
              },
            ),
          ListTile(
            dense: true,
            title: Text('Playback speed: ${playbackSpeed.value}', style: controlsTheme.settingsListTextStyle),
            onTap: () async {
              final selected = await showModalOptionList<double>(
                context: context,
                options: playbackSpeeds
                    .map(
                      (speed) => SettingsOption(
                        value: speed,
                        label: "${speed}x",
                        isSelected: speed == playbackSpeed.value,
                      ),
                    )
                    .toList(),
              );
              if (selected != null && context.mounted) {
                BccmPlayerInterface.instance.setPlaybackSpeed(playerId, selected.value);
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
    required this.controlsTheme,
  });

  final List<Track?> tracks;
  final ControlsThemeData controlsTheme;

  @override
  Widget build(BuildContext context) {
    // show list of audio tracks with a tick on the selected one
    return Container(
      color: controlsTheme.settingsListBackgroundColor,
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
              title: Text(track.labelWithFallback, style: controlsTheme.settingsListTextStyle),
              trailing: track.isSelected ? const Icon(Icons.check) : null,
            ),
        ],
      ),
    );
  }
}
