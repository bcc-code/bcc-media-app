import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';
import 'package:bccm_player/src/state/plugin_state_notifier.dart';
import 'package:flutter/material.dart';
import '../utils/extensions.dart';

class StatePlaybackListener implements PlaybackListenerPigeon {
  StatePlaybackListener(this.pluginStateNotifier);

  PlayerPluginStateNotifier pluginStateNotifier;

  @override
  void onPlaybackStateChanged(event) {
    debugPrint('bccm received onPlaybackStateChanged ${event.encode()}');
    pluginStateNotifier.getOrAddPlayerNotifier(event.playerId)
      ..setIsBuffering(event.isBuffering)
      ..setPlaybackState(event.playbackState);
  }

  @override
  void onPlaybackEnded(event) {}

  @override
  void onMediaItemTransition(event) {
    pluginStateNotifier
        .getOrAddPlayerNotifier(event.playerId)
        .setMediaItem(event.mediaItem);
  }

  @override
  void onPictureInPictureModeChanged(event) {
    pluginStateNotifier
        .getOrAddPlayerNotifier(event.playerId)
        .setIsInPipMode(event.isInPipMode);
  }

  @override
  void onPositionDiscontinuity(event) {
    final positionMs = event.playbackPositionMs?.finiteOrNull()?.round();
    pluginStateNotifier
        .getOrAddPlayerNotifier(event.playerId)
        .setPlaybackPositionAndSync(positionMs);
  }

  @override
  void onPlayerStateUpdate(event) {
    pluginStateNotifier
        .getOrAddPlayerNotifier(event.playerId)
        .setStateFromSnapshot(event.snapshot);
  }

  @override
  void onPrimaryPlayerChanged(event) {
    pluginStateNotifier.setPrimaryPlayer(event.playerId);
  }
}
