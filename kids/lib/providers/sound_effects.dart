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
  player.setPlayerMode(PlayerMode.lowLatency);
  player.audioCache.loadAll(SoundEffects.allToPreload);
  return player;
});
