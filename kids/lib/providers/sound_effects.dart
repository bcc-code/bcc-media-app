import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundpool/soundpool.dart';

class SoundEffects {
  SoundEffects._();

  static const buttonPush = 'sounds/button-1_push.wav';
  static const buttonRelease = 'sounds/button-1_release.wav';

  static const allToPreload = [
    buttonPush,
    buttonRelease,
  ];
}

class SoundEffectPlayer {
  final Soundpool player;
  final soundIds = <String, int>{};

  SoundEffectPlayer(this.player) {
    for (final sound in SoundEffects.allToPreload) {
      player.loadAssetSound(sound).then((id) => soundIds[sound] = id);
    }
  }

  Future<void> queue(String sound) async {
    var soundId = soundIds[sound];
    if (soundId == null) {
      soundId = await player.loadAssetSound(sound);
      player.setVolume(soundId: soundId, volume: 0.2);
      soundIds[sound] = soundId;
    }
    await player.play(soundId);
  }
}

final soundEffectsProvider = Provider((ref) {
  final player = Soundpool.fromOptions(options: const SoundpoolOptions(iosOptions: SoundpoolOptionsIos(audioSessionMode: AudioSessionMode.normal)));
  return SoundEffectPlayer(player);
});

extension SoundEffectsExtension on Soundpool {
  Future<int> loadAssetSound(String sound) async {
    return await rootBundle.load('assets/$sound').then((bytes) => load(bytes));
  }
}
