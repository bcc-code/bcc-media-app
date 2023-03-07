import 'package:bccm_player/src/plugins/riverpod/providers/player_provider.dart';
import '../../state/player_state_notifier.dart';
import 'package:bccm_player/src/playback_platform_pigeon.g.dart';
import 'package:riverpod/riverpod.dart';
import '../../utils/various.dart';

class RiverpodPlaybackListener implements PlaybackListenerPigeon {
  Ref ref;

  RiverpodPlaybackListener({required this.ref});

  PlayerStateNotifier? notifierFor(String playerId) => ref.read(playerProviderFor(playerId).notifier);

  @override
  void onIsPlayingChanged(event) {
    notifierFor(event.playerId)?.setPlaybackState(event.isPlaying ? PlaybackState.playing : PlaybackState.paused);
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
    final positionMs = event.playbackPositionMs?.finiteOrNull()?.round();
    notifierFor(event.playerId)?.setPlaybackPosition(positionMs);
  }
}
