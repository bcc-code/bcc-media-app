// ignore_for_file: constant_identifier_names

import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

enum Flavor {
  bccmedia_prod,
  bccmedia_dev,
  kids_prod;
}

class FlavorConfig {
  const FlavorConfig({
    required this.flavor,
    required this.firebaseOptions,
    required this.logo,
    this.designSystem,
    this.applicationCode,
  });

  // Config
  final Flavor flavor;
  final FirebaseOptions? firebaseOptions;
  final Widget Function(BuildContext) logo;
  final DesignSystemData Function()? designSystem;
  final String? applicationCode;

  // Static stuff for setting the flavor on startup
  static FlavorConfig? _current;
  static FlavorConfig get current => _current!;

  static register(FlavorConfig flavorConfig) {
    assert(_current == null, 'Flavor Config was already set!');
    _current = flavorConfig;
  }
}
