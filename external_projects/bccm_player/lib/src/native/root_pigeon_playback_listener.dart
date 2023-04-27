import '../../bccm_player.dart';
import '../pigeon/playback_platform_pigeon.g.dart';

class RootPigeonPlaybackListener implements PlaybackListenerPigeon {
  RootPigeonPlaybackListener(this.parent);
  BccmPlayerInterface parent;
  final List<PlaybackListenerPigeon> _listeners = [];

  void addListener(PlaybackListenerPigeon listener) {
    _listeners.add(listener);
  }

  void removeListener(PlaybackListenerPigeon listener) {
    _listeners.remove(listener);
  }

  @override
  void onIsPlayingChanged(IsPlayingChangedEvent event) {
    for (var listener in _listeners) {
      listener.onIsPlayingChanged(event);
    }
  }

  @override
  void onMediaItemTransition(MediaItemTransitionEvent event) {
    for (var listener in _listeners) {
      listener.onMediaItemTransition(event);
    }
  }

  @override
  void onPictureInPictureModeChanged(PictureInPictureModeChangedEvent event) {
    for (var listener in _listeners) {
      listener.onPictureInPictureModeChanged(event);
    }
  }

  @override
  void onPositionDiscontinuity(PositionDiscontinuityEvent event) {
    for (var listener in _listeners) {
      listener.onPositionDiscontinuity(event);
    }
  }

  @override
  void onPlayerStateUpdate(PlayerStateSnapshot event) {
    for (var listener in _listeners) {
      listener.onPlayerStateUpdate(event);
    }
  }

  @override
  void onPrimaryPlayerChanged(String playerId) {
    parent.stateNotifier.setPrimaryPlayer(playerId);
    for (var listener in _listeners) {
      listener.onPrimaryPlayerChanged(playerId);
    }
  }
}
