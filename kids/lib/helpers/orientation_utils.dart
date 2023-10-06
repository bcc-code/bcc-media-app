import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void usePortrait(bool enabled) {
  useEffect(() {
    // set portrait for mobile
    if (enabled) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    return () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    };
  }, [enabled]);
}
