import 'dart:async';

import 'package:flutter/material.dart';

import '../../bccm_player.dart';
import '../pigeon/playback_platform_pigeon.g.dart';

/// The primary listener that just forwards the events to the other listeners
class RootPigeonPlaybackListener implements PlaybackListenerPigeon {
  RootPigeonPlaybackListener(this.parent);
  BccmPlayerInterface parent;
  final List<PlaybackListenerPigeon> _listeners = [];
  final StreamController<Object?> _streamController = StreamController.broadcast();

  Stream<Object?> get stream => _streamController.stream;

  void addListener(listener) {
    _listeners.add(listener);
  }

  void removeListener(listener) {
    _listeners.remove(listener);
  }

  // PlaybackListenerPigeon implementation

  @override
  void onPlaybackStateChanged(event) {
    _streamController.add(event);
    for (var listener in _listeners) {
      listener.onPlaybackStateChanged(event);
    }
  }

  @override
  void onPlaybackEnded(event) {
    _streamController.add(event);
    for (var listener in _listeners) {
      listener.onPlaybackEnded(event);
    }
  }

  @override
  void onMediaItemTransition(event) {
    _streamController.add(event);
    for (var listener in _listeners) {
      listener.onMediaItemTransition(event);
    }
  }

  @override
  void onPictureInPictureModeChanged(event) {
    _streamController.add(event);
    for (var listener in _listeners) {
      listener.onPictureInPictureModeChanged(event);
    }
  }

  @override
  void onPositionDiscontinuity(event) {
    _streamController.add(event);
    for (var listener in _listeners) {
      listener.onPositionDiscontinuity(event);
    }
  }

  @override
  void onPlayerStateUpdate(event) {
    _streamController.add(event);
    for (var listener in _listeners) {
      listener.onPlayerStateUpdate(event);
    }
  }

  @override
  void onPrimaryPlayerChanged(playerId) {
    for (var listener in _listeners) {
      listener.onPrimaryPlayerChanged(playerId);
    }
  }
}
