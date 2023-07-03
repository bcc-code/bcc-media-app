import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;
  VoidCallback? _currentAction;
  bool debounceInitial;

  Debouncer({
    required this.milliseconds,
    this.debounceInitial = true,
  });

  run(VoidCallback action) {
    // If first call
    if (debounceInitial == false && _timer?.isActive != true) {
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
