// ignore_for_file: constant_identifier_names
import 'package:bccm_core/design_system.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  StateImageProvider.empty()
      : image = const AssetImage(''),
        activeImage = const AssetImage('');

  @override
  Iterator<ImageProvider<Object>> get iterator => [image, activeImage].iterator;
}

class FlavorStrings {
  final String onboardingTitle;
  final String onboardingSecondaryTitle;
  final String aboutText;
  final String contactEmail;
  final Uri contactWebsite;
  FlavorStrings({
    required this.onboardingTitle,
    required this.onboardingSecondaryTitle,
    required this.aboutText,
    required this.contactEmail,
    required this.contactWebsite,
  });
}

class BccmFlavorImages extends Iterable<ImageProvider> {
  final double logoHeight;
  final ImageProvider logo;
  final ImageProvider onboarding;
  final StateImageProvider home;
  final StateImageProvider search;
  final StateImageProvider live;
  final StateImageProvider calendar;
  final StateImageProvider shorts;
  final StateImageProvider myList;
  final StateImageProvider games;
  final StateImageProvider profile;

  BccmFlavorImages({
    required this.logoHeight,
    required this.logo,
    required this.onboarding,
    required this.home,
    required this.search,
    required this.live,
    required this.calendar,
    required this.shorts,
    required this.myList,
    required this.games,
    required this.profile,
  });

  @override
  Iterator<ImageProvider<Object>> get iterator => [
        logo,
        onboarding,
        ...home,
        ...search,
        ...live,
        ...calendar,
        ...shorts,
        ...myList,
        ...games,
        ...profile,
      ].iterator;
}

class FlavorConfig {
  const FlavorConfig({
    required this.applicationCode,
    required this.flavor,
    required this.firebaseOptions,
    required this.strings,
    required this.enableNotifications,
    required this.designSystem,
    this.bccmImages,
    this.strictAnonymousAnalytics,
    this.defaultLanguage = 'en',
  });

  // Config
  final Flavor flavor;
  final FirebaseOptions? firebaseOptions;
  final BccmFlavorImages? bccmImages;
  final DesignSystemData Function() designSystem;
  final String applicationCode;
  final FlavorStrings Function(BuildContext context) strings;
  final bool enableNotifications;
  final String defaultLanguage;
  final bool? strictAnonymousAnalytics;

  // Static stuff for setting the flavor on startup
  static FlavorConfig? _current;
  static FlavorConfig get current => _current!;

  static register(FlavorConfig flavorConfig) {
    assert(_current == null, 'Flavor Config was already set!');
    _current = flavorConfig;
  }
}
