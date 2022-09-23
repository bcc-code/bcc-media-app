import 'dart:async';

import 'package:bccm_player/chromecast_pigeon.g.dart';

import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/providers/video_state.dart';

final playbackListenerProvider =
    Provider<PlaybackListener>((_) => throw UnimplementedError());

class PlaybackListener implements PlaybackListenerPigeon {
  Reader? providerReader;

  PlaybackListener({required this.providerReader});

  @override
  void onPositionUpdate(PositionUpdateEvent event) {
    var player = providerReader?.call(primaryPlayerProvider);
    if (player != null && player.currentMediaItem != null) {
      //providerRef?.read(primaryPlayerProvider.notifier).
    }
  }

  @override
  void onIsPlayingChanged(IsPlayingChangedEvent event) {
    var playerProvider = event.playerId == 'chromecast'
        ? castPlayerProvider
        : primaryPlayerProvider;
    providerReader?.call(playerProvider.notifier).setPlaybackState(
        event.isPlaying ? PlaybackState.playing : PlaybackState.paused);
  }

  @override
  void onMediaItemTransition(MediaItemTransitionEvent event) {
    var playerProvider = event.playerId == 'chromecast'
        ? castPlayerProvider
        : primaryPlayerProvider;
    providerReader?.call(playerProvider.notifier).setMediaItem(event.mediaItem);
  }

  @override
  void onPictureInPictureModeChanged(PictureInPictureModeChangedEvent event) {
    var playerProvider = event.playerId == 'chromecast'
        ? castPlayerProvider
        : primaryPlayerProvider;
    providerReader
        ?.call(playerProvider.notifier)
        .setIsInPipMode(event.isInPipMode);
  }
}
