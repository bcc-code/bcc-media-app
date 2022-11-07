import 'dart:async';

import 'package:bccm_player/chromecast_pigeon.g.dart';

import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/progress.graphql.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/video_state.dart';

import '../graphql/queries/devices.graphql.dart';

final playbackListenerProvider =
    Provider<PlaybackListener>((_) => throw UnimplementedError());

class PlaybackListener implements PlaybackListenerPigeon {
  ProviderContainer providerContainer;

  PlaybackListener({required this.providerContainer});

  @override
  void onIsPlayingChanged(IsPlayingChangedEvent event) {
    var playerProvider = event.playerId == 'chromecast'
        ? castPlayerProvider
        : primaryPlayerProvider;
    providerContainer.read(playerProvider.notifier).setPlaybackState(
        event.isPlaying ? PlaybackState.playing : PlaybackState.paused);
  }

  @override
  void onMediaItemTransition(MediaItemTransitionEvent event) {
    var playerProvider = event.playerId == 'chromecast'
        ? castPlayerProvider
        : primaryPlayerProvider;
    providerContainer
        .read(playerProvider.notifier)
        .setMediaItem(event.mediaItem);
  }

  @override
  void onPictureInPictureModeChanged(PictureInPictureModeChangedEvent event) {
    var playerProvider = event.playerId == 'chromecast'
        ? castPlayerProvider
        : primaryPlayerProvider;
    providerContainer
        .read(playerProvider.notifier)
        .setIsInPipMode(event.isInPipMode);
  }

  @override
  void onPositionDiscontinuity(PositionDiscontinuityEvent event) {
    debugPrint('onPositionDiscontinuity');
    var playerProvider = event.playerId == 'chromecast'
        ? castPlayerProvider
        : primaryPlayerProvider;
    var player = providerContainer.read(playerProvider);
    final episodeId =
        player?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>();
    if (episodeId != null) {
      final gqlClient = providerContainer.read(gqlClientProvider);

      gqlClient
          .mutate$setEpisodeProgress(Options$Mutation$setEpisodeProgress(
              variables: Variables$Mutation$setEpisodeProgress(
                  id: episodeId,
                  progress: ((event.playbackPositionMs ?? 0) / 1000).round())))
          .then((value) => debugPrint(
              'set progress to: ${value.parsedData?.setEpisodeProgress.progress.toString()}'));
    }
  }

  @override
  void onPlayerStateUpdate(PlayerState event) {
    debugPrint('onPlayerStateUpdate');

    var playerProvider = event.playerId == 'chromecast'
        ? castPlayerProvider
        : primaryPlayerProvider;
    var player = providerContainer.read(playerProvider);

    final episodeId =
        player?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>();
    if (event.isPlaying && episodeId != null) {
      final gqlClient = providerContainer.read(gqlClientProvider);

      gqlClient
          .mutate$setEpisodeProgress(Options$Mutation$setEpisodeProgress(
              variables: Variables$Mutation$setEpisodeProgress(
                  id: episodeId,
                  progress: ((event.playbackPositionMs ?? 0) / 1000).round())))
          .then((value) => debugPrint(
              'set progress to: ${value.parsedData?.setEpisodeProgress.progress.toString()}'));
    }
  }
}
