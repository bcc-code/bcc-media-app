import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class AsyncDebouncer<T> {
  final int milliseconds;
  Timer? _timer;

  AsyncDebouncer({required this.milliseconds});

  Future<T> run(Future<T> Function() action) {
    var completer = Completer<T>();
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), () async {
      final value = await action();
      completer.complete(value);
    });
    return completer.future;
  }
}
