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
