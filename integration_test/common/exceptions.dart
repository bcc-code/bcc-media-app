import 'package:flutter/foundation.dart';
import 'package:patrol/patrol.dart';

extension Exceptions on PatrolTester {
  void ignoreExceptions() {
    var exceptionCount = 0;
    dynamic exception = tester.takeException();
    while (exception != null) {
      exceptionCount++;
      exception = tester.takeException();
    }
    if (exceptionCount != 0) {
      debugPrint('Warning: $exceptionCount exceptions were ignored');
    }
  }
}
