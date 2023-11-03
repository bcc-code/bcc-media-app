import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundEffects {
  SoundEffects._();

  static const buttonPush = 'sounds/button-1_push.wav';
  static const buttonRelease = 'sounds/button-1_release.wav';

  static const allToPreload = [
    buttonPush,
    buttonRelease,
  ];
}

final soundEffectsProvider = Provider((ref) {
  final player = AudioPlayer();
  player.setReleaseMode(ReleaseMode.release);
  player.setPlayerMode(PlayerMode.lowLatency);
  player.audioCache.loadAll(SoundEffects.allToPreload);
  player.setVolume(0.3);
  return player;
});

extension AudioPlayerQueueExtension on AudioPlayer {
  // Queue new sound effect after currently playing if any
  Future<void> queue(Source source) async {
    final isPlaying = state == PlayerState.playing || this.source != null;
    if (isPlaying) {
      await eventStream.where((event) => event.eventType == AudioEventType.complete).first;
    }
    await play(source);
  }
}
