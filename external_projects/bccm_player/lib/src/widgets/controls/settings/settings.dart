import 'package:bccm_player/src/pigeon/pigeon_extensions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../bccm_player.dart';
import '../../../../configuration/bccm_player_configuration.dart';
import '../../../pigeon/playback_platform_pigeon.g.dart';
import 'settings_option_list.dart';

final _speedsList = <PlaybackSpeed>[
  PlaybackSpeeds.speed25,
  PlaybackSpeeds.speed50,
  PlaybackSpeeds.speed75,
  PlaybackSpeeds.speed100,
  PlaybackSpeeds.speed125,
  PlaybackSpeeds.speed150,
  PlaybackSpeeds.speed175,
  PlaybackSpeeds.speed200,
];

class Settings extends HookWidget {
  const Settings({
    super.key,
    required this.playerId,
  });

  final String playerId;

  @override
  Widget build(BuildContext context) {
    final playerConfiguration = PlayerConfiguration.safeOf(context);
    final controlsTheme = playerConfiguration.theme?.controls;
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

    final currentSpeedNum = speedSnapshot.data ?? PlaybackSpeeds.speed100.speed;
    final selectedSpeedLabel = _speedsList.firstWhereOrNull((element) => element.speed == currentSpeedNum)!.label;

    return Container(
      color: controlsTheme?.settingsListBackgroundColor,
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
                  ),
                );
                if (selected != null && context.mounted) {
                  BccmPlayerInterface.instance.setSelectedTrack(playerId, TrackType.audio, selected.id);
                  Navigator.pop(context);
                }
              },
              title: Text(
                'Audio: ${selectedAudioTrack?.labelWithFallback ?? 'N/A'}',
                style: controlsTheme?.settingsListTextStyle,
              ),
            ),
          if (tracksData?.textTracks.isNotEmpty == true)
            ListTile(
              dense: true,
              title: Text('Subtitles: ${selectedTextTrack?.labelWithFallback ?? 'N/A'}', style: controlsTheme?.settingsListTextStyle),
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
            title: Text('Playback speed: $selectedSpeedLabel', style: controlsTheme?.settingsListTextStyle),
            onTap: () async {
              final selected = await showModalBottomSheet<SettingsOption>(
                context: context,
                isDismissible: true,
                builder: (context) => SettingsOptionList(
                  options: _speedsList
                      .map(
                        (speed) => SettingsOption(
                          id: speed.speed,
                          label: speed.label,
                          isSelected: speed.speed == currentSpeedNum,
                        ),
                      )
                      .toList(),
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
