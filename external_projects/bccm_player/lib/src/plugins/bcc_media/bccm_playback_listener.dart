import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import '../../utils/debouncer.dart';
import '../../utils/extensions.dart';
import 'bccm_api.dart';

class BccmPlaybackListener implements PlaybackListenerPigeon {
  Ref ref;
  final progressDebouncer = Debouncer(milliseconds: 1000);
  final Provider<BccmApi> apiProvider;

  BccmPlaybackListener({required this.ref, required this.apiProvider});

  @override
  void onIsPlayingChanged(event) {}

  @override
  void onMediaItemTransition(event) {}

  @override
  void onPictureInPictureModeChanged(event) {}

  @override
  void onPositionDiscontinuity(event) {
    debugPrint('onPositionDiscontinuity');
    var player = ref.read(playerProviderFor(event.playerId));
    final positionMs = event.playbackPositionMs?.finiteOrNull()?.round();
    final episodeId = player?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>();
    if (episodeId != null && positionMs != null) {
      progressDebouncer.run(() => ref.read(apiProvider).updateProgress(episodeId: episodeId, progress: positionMs / 1000));
    }
  }

  @override
  void onPlayerStateUpdate(event) {
    var player = ref.read(playerProviderFor(event.playerId));
    final positionMs = event.playbackPositionMs?.finiteOrNull()?.round();
    final episodeId = player?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>();
    if (event.isPlaying && positionMs != null && episodeId != null) {
      progressDebouncer.run(() => ref.read(apiProvider).updateProgress(episodeId: episodeId, progress: positionMs / 1000));
    }
  }

  @override
  void onPrimaryPlayerChanged(String playerId) {}
}
