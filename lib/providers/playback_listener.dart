import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/video_state.dart';

import '../helpers/debouncer.dart';

final playbackListenerProvider = Provider<PlaybackListener>((_) => throw UnimplementedError());

class PlaybackListener implements PlaybackListenerPigeon {
  ProviderContainer ref;
  Debouncer progressDebouncer = Debouncer(milliseconds: 1000);

  PlaybackListener({required this.ref});

  @override
  void onIsPlayingChanged(IsPlayingChangedEvent event) {
    var playerProvider = getPlayerProvider(ref, event.playerId);
    if (playerProvider == null) return;
    ref.read(playerProvider.notifier).setPlaybackState(event.isPlaying ? PlaybackState.playing : PlaybackState.paused);
  }

  @override
  void onMediaItemTransition(MediaItemTransitionEvent event) {
    var playerProvider = getPlayerProvider(ref, event.playerId);
    if (playerProvider == null) return;
    ref.read(playerProvider.notifier).setMediaItem(event.mediaItem);
  }

  @override
  void onPictureInPictureModeChanged(PictureInPictureModeChangedEvent event) {
    var playerProvider = getPlayerProvider(ref, event.playerId);
    if (playerProvider == null) return;
    ref.read(playerProvider.notifier).setIsInPipMode(event.isInPipMode);
  }

  @override
  void onPositionDiscontinuity(PositionDiscontinuityEvent event) {
    debugPrint('onPositionDiscontinuity');
    var playerProvider = getPlayerProvider(ref, event.playerId);
    if (playerProvider == null) return;
    var player = ref.read(playerProvider);
    final positionMs = event.playbackPositionMs?.finiteOrNull()?.round();
    ref.read(playerProvider.notifier).setPlaybackPosition(positionMs);
    final episodeId = player?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>();
    if (episodeId != null && positionMs != null) {
      progressDebouncer.run(() => ref.read(apiProvider).updateProgress(episodeId: episodeId, progress: positionMs / 1000));
    }
  }

  @override
  void onPlayerStateUpdate(PlayerState event) {
    debugPrint('onPlayerStateUpdate');

    var playerProvider = getPlayerProvider(ref, event.playerId);
    if (playerProvider == null) return;
    var player = ref.read(playerProvider);

    final positionMs = event.playbackPositionMs?.finiteOrNull()?.round();
    ref.read(playerProvider.notifier).setPlaybackPosition(positionMs);

    final episodeId = player?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>();
    if (event.isPlaying && positionMs != null && episodeId != null) {
      progressDebouncer.run(() => ref.read(apiProvider).updateProgress(episodeId: episodeId, progress: positionMs / 1000));
    }
  }
}
