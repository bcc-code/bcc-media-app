import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

enum GyroOrientation { portrait, landscape, unknown }

final gyroOrientationProvider = StateNotifierProvider<GyroOrientationStateNotifier, GyroOrientation>((ref) {
  return GyroOrientationStateNotifier(ref);
});

class GyroOrientationStateNotifier extends StateNotifier<GyroOrientation> {
  GyroOrientationStateNotifier(Ref ref) : super(GyroOrientation.unknown) {
    final sub = accelerometerEvents.listen((event) {
      if (event.x > 9) {
        setOrientation(GyroOrientation.landscape);
      } else if (event.x < -9) {
        setOrientation(GyroOrientation.landscape);
      } else if (event.y > 9) {
        setOrientation(GyroOrientation.portrait);
      } else if (event.y < -9) {
        setOrientation(GyroOrientation.portrait);
      }
    });
    ref.onDispose(() {
      sub.cancel();
    });
  }

  void setOrientation(GyroOrientation orientation) {
    state = orientation;
  }
}


/**
 * 
 * We want to set the player fullscreen when you rotate the device to landscape mode.
 * However, if portrait lock is on, we don't want to do that.
 * It sounds trivial: can't we just go fullscreen when the orientation changes to landscape, letting the OS handle the locking etc?
 * The problem is that we want to stay in portrait when the video isnt playing, so we can't enable landscape orientation globally.
 * We could enable landscape only while the player is playing, but the orientation change events were unreliable.
 * Example of unrelability: when you exit fullscreen while still landscape, we need to force portrait for a moment, then allow landscape again.
 * But as soon as we enable landscape - because the device is still in landscape - the OS will rotate the UI back to landscape.
 * 
 * So the idea here is that we want to detect physical orientation changes, and enable landscape orientation only when the video is playing.
 * On iOS, there's no API to check if the device is locked in portrait mode.
 * 
 * 
 * wait
 * so I can instead just check if the player is playing, and in that case enable landscape orientation.
 * no,
 * 
*/