import 'dart:async';
import 'dart:ui';

import 'package:flutter_hooks/flutter_hooks.dart';

Future<void> useInterval(VoidCallback callback, Duration delay) async {
  final savedCallback = useRef(callback);
  savedCallback.value = callback;

  useEffect(() {
    final timer = Timer.periodic(delay, (_) => savedCallback.value());
    return timer.cancel;
  }, [delay]);
}
