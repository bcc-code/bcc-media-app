import 'package:flutter/material.dart';

import 'tests/episode_test.dart' as episode_test;
import 'tests/login_test.dart' as login_test;

void main() {
  episode_test.main();
  runApp(Container());
  login_test.main();
}
