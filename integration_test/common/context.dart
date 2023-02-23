import 'package:brunstadtv_app/main.dart';
import 'package:flutter/cupertino.dart';

BuildContext getContext() {
  final context = navigatorKey.currentContext;
  if (context == null) {
    throw Exception('Context was null');
  }
  return context;
}
