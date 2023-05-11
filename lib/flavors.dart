// ignore_for_file: constant_identifier_names

import 'dart:collection';

import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

enum Flavor {
  bccmedia_prod,
  bccmedia_dev,
  kids_prod;
}

class StateImageProvider with IterableMixin<ImageProvider> {
  final ImageProvider image;
  final ImageProvider activeImage;

  StateImageProvider({
    required this.image,
    required this.activeImage,
  });

  @override
  Iterator<ImageProvider<Object>> get iterator => [image, activeImage].iterator;
}

class FlavorImages with IterableMixin<ImageProvider> {
  final ImageProvider logo;
  final StateImageProvider home;
  final StateImageProvider search;
  final StateImageProvider live;
  final StateImageProvider calendar;
  final StateImageProvider myList;

  FlavorImages({
    required this.logo,
    required this.home,
    required this.search,
    required this.live,
    required this.calendar,
    required this.myList,
  });

  @override
  Iterator<ImageProvider<Object>> get iterator => [
        logo,
        ...home,
        ...search,
        ...live,
        ...calendar,
        ...myList,
      ].iterator;
}

class FlavorConfig {
  const FlavorConfig({
    required this.flavor,
    required this.firebaseOptions,
    required this.flavorImages,
    this.designSystem,
    this.applicationCode,
  });

  // Config
  final Flavor flavor;
  final FirebaseOptions? firebaseOptions;
  final FlavorImages flavorImages;
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
