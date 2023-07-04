import 'package:bccm_player/src/pigeon/pigeon_extensions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../bccm_player.dart';
import '../../../../configuration/bccm_player_configuration.dart';
import '../../../pigeon/playback_platform_pigeon.g.dart';
import 'settings_option_list.dart';

class Settings extends HookWidget {
  const Settings({
    super.key,
    required this.playerId,
  });

  final String playerId;

  String getPlaybackSpeedLabel(double speed) {
    // Remove unnecessary decimal part. i.e 2x instead of 2.0x
    final integerPart = speed.truncate();
    final fractionalPart = speed - integerPart;
    final cleanSpeed = fractionalPart == 0.0 ? integerPart : speed;

    if (cleanSpeed == 1) {
      return 'Normal';
    } else {
      return '${cleanSpeed}x';
    }
  }

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

    final currentSpeedNum = speedSnapshot.data ?? playerConfiguration.defaultPlaybackSpeed;
    final selectedSpeedLabel = getPlaybackSpeedLabel(currentSpeedNum);

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
                  options: playerConfiguration.playbackSpeeds
                      .map(
                        (speed) => SettingsOption(
                          id: speed,
                          label: getPlaybackSpeedLabel(speed),
                          isSelected: speed == currentSpeedNum,
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
