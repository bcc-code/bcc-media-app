import 'dart:ui';

import 'package:flutter/material.dart';

// IIRC this was for better scroll behavior on web
class AnyPointerScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => PointerDeviceKind.values.toSet();
}
