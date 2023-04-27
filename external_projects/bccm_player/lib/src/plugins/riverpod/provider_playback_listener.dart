import 'package:bccm_player/src/plugins/riverpod/providers/player_provider.dart';
import '../../state/player_state_notifier.dart';
import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';
import 'package:riverpod/riverpod.dart';
import '../../utils/extensions.dart';

final playbackListenerProvider = Provider<RiverpodPlaybackListener>((ref) {
  return RiverpodPlaybackListener(ref: ref);
});

class RiverpodPlaybackListener implements PlaybackListenerPigeon {
  Ref ref;

  RiverpodPlaybackListener({required this.ref});

  PlayerStateNotifier? notifierFor(String playerId) => ref.read(playerProviderFor(playerId).notifier);

  @override
  void onPlaybackStateChanged(event) {
    notifierFor(event.playerId)?.setPlaybackState(event.playbackState);
  }

  @override
  void onMediaItemTransition(event) {
    notifierFor(event.playerId)?.setMediaItem(event.mediaItem);
  }

  @override
  void onPictureInPictureModeChanged(event) {
    notifierFor(event.playerId)?.setIsInPipMode(event.isInPipMode);
  }

  @override
  void onPositionDiscontinuity(event) {
    final positionMs = event.playbackPositionMs?.finiteOrNull()?.round();
    notifierFor(event.playerId)?.setPlaybackPosition(positionMs);
  }

  @override
  void onPlayerStateUpdate(event) {
    notifierFor(event.playerId)?.setStateFromSnapshot(event);
  }

  @override
  void onPrimaryPlayerChanged(String? playerId) {}
}
