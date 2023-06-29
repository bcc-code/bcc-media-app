import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;
  VoidCallback? _currentAction;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    // If first call
    if (_timer?.isActive != true) {
      print('>>> Yes');
      action();
      _currentAction = () {};
    } else {
      _currentAction = action;
    }
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), _currentAction!);
  }

  forceEarly() {
    _timer?.cancel();
    _currentAction?.call();
  }
}
