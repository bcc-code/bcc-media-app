// ignore_for_file: constant_identifier_names
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

enum Flavor {
  bccmedia,
  kids;
}

class StateImageProvider extends Iterable<ImageProvider> {
  final ImageProvider image;
  final ImageProvider activeImage;

  StateImageProvider({
    required this.image,
    required this.activeImage,
  });

  @override
  Iterator<ImageProvider<Object>> get iterator => [image, activeImage].iterator;
}

class FlavorStrings {
  final String onboardingTitle;
  final String onboardingSecondaryTitle;
  FlavorStrings({
    required this.onboardingTitle,
    required this.onboardingSecondaryTitle,
  });
}

class FlavorImages extends Iterable<ImageProvider> {
  final double logoHeight;
  final ImageProvider logo;
  final ImageProvider onboarding;
  final StateImageProvider home;
  final StateImageProvider search;
  final StateImageProvider live;
  final StateImageProvider calendar;
  final StateImageProvider myList;

  FlavorImages({
    required this.logoHeight,
    required this.logo,
    required this.onboarding,
    required this.home,
    required this.search,
    required this.live,
    required this.calendar,
    required this.myList,
  });

  @override
  Iterator<ImageProvider<Object>> get iterator => [
        logo,
        onboarding,
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
    required this.images,
    required this.strings,
    required this.enableNotifications,
    this.designSystem,
    this.applicationCode,
  });

  // Config
  final Flavor flavor;
  final FirebaseOptions? firebaseOptions;
  final FlavorImages images;
  final DesignSystemData Function()? designSystem;
  final String? applicationCode;
  final FlavorStrings Function(BuildContext context) strings;
  final bool enableNotifications;

  // Static stuff for setting the flavor on startup
  static FlavorConfig? _current;
  static FlavorConfig get current => _current!;

  static register(FlavorConfig flavorConfig) {
    assert(_current == null, 'Flavor Config was already set!');
    _current = flavorConfig;
  }
}
