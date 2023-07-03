import 'package:bccm_player/src/pigeon/pigeon_extensions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../bccm_player.dart';
import '../../../../theme/controls_theme_data.dart';
import '../../../pigeon/playback_platform_pigeon.g.dart';
import 'settings_option_list.dart';

final _speeds = <double, String>{
  0.25: '0.25x',
  0.5: '0.5x',
  0.75: '0.75x',
  1.0: 'Normal',
  1.25: '1.25x',
  1.5: '1.5x',
  1.75: '1.75x',
  2.0: '2x',
};

class Settings extends HookWidget {
  const Settings({
    super.key,
    required this.playerId,
    required this.controlsTheme,
  });

  final String playerId;
  final ControlsThemeData controlsTheme;

  @override
  Widget build(BuildContext context) {
    final tracksFuture = useMemoized(() {
      return BccmPlayerInterface.instance.getPlayerTracks(playerId: playerId);
    }, [playerId]);
    final tracksSnapshot = useFuture(tracksFuture);

    final speedSnapshot = useFuture(
      useMemoized(
        () => BccmPlayerInterface.instance.getPlaybackSpeed(playerId),
        [playerId],
      ),
    );

    if (tracksSnapshot.connectionState == ConnectionState.waiting || speedSnapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (tracksSnapshot.hasError) {
      return Center(child: Text(tracksSnapshot.error.toString()));
    } else if (speedSnapshot.hasError) {
      return Center(child: Text(speedSnapshot.error.toString()));
    }

    final tracksData = tracksSnapshot.data;

    final selectedAudioTrack = tracksData?.audioTracks.safe.firstWhereOrNull((element) => element.isSelected);
    final selectedTextTrack = tracksData?.textTracks.safe.firstWhereOrNull((element) => element.isSelected);

    final currentSpeedNum = speedSnapshot.data ?? 1.0;
    final selectedSpeedLabel = _speeds[currentSpeedNum]!;

    return Container(
      color: controlsTheme.settingsListBackgroundColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          if (tracksData?.audioTracks.isNotEmpty == true)
            ListTile(
              dense: true,
              onTap: () async {
                final selected = await showModalBottomSheet<SettingsOption>(
                  context: context,
                  isDismissible: true,
                  builder: (context) => SettingsOptionList(
                    options: tracksData!.audioTracks.safe
                        .map(
                          (track) => SettingsOption<String>(
                            id: track.id,
                            label: track.labelWithFallback,
                            isSelected: track.isSelected,
                          ),
                        )
                        .toList(),
                    controlsTheme: controlsTheme,
                  ),
                );
                if (selected != null && context.mounted) {
                  BccmPlayerInterface.instance.setSelectedTrack(playerId, TrackType.audio, selected.id);
                  Navigator.pop(context);
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
              title: Text('Subtitles: ${selectedTextTrack?.labelWithFallback ?? 'N/A'}', style: controlsTheme.settingsListTextStyle),
              onTap: () async {
                final selected = await showModalBottomSheet<SettingsOption>(
                  context: context,
                  isDismissible: true,
                  builder: (context) => SettingsOptionList(
                    options: tracksData!.textTracks.safe
                        .map(
                          (track) => SettingsOption<String>(
                            id: track.id,
                            label: track.labelWithFallback,
                            isSelected: track.isSelected,
                          ),
                        )
                        .toList(),
                    controlsTheme: controlsTheme,
                  ),
                );
                if (selected != null && context.mounted) {
                  BccmPlayerInterface.instance.setSelectedTrack(playerId, TrackType.text, selected.id);
                  Navigator.pop(context);
                }
              },
            ),
          ListTile(
            dense: true,
            title: Text('Playback speed: $selectedSpeedLabel', style: controlsTheme.settingsListTextStyle),
            onTap: () async {
              final selected = await showModalBottomSheet<SettingsOption>(
                context: context,
                isDismissible: true,
                builder: (context) => SettingsOptionList(
                  options: _speeds.entries
                      .map(
                        (e) => SettingsOption(
                          id: e.key,
                          label: e.value,
                          isSelected: e.key == currentSpeedNum,
                        ),
                      )
                      .toList(),
                  controlsTheme: controlsTheme,
                ),
              );
              if (selected != null && context.mounted) {
                BccmPlayerInterface.instance.setPlaybackSpeed(playerId, selected.id);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
