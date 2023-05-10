import 'package:brunstadtv_app/env/kids_prod/firebase_options.dart' as kids_prod_firebase;
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/theme/design_system/biblekids/design_system.dart';
import 'package:flutter/material.dart';
import 'flavors.dart';

Future<void> main() async {
  FlavorConfig.register(
    FlavorConfig(
      flavor: Flavor.bccmedia_prod,
      firebaseOptions: kids_prod_firebase.DefaultFirebaseOptions.currentPlatform,
      applicationCode: 'kids',
      logo: (_) => Image.asset('assets/flavors/kids_prod/logo.png', height: 25),
      designSystem: () => BibleKidsDesignSystem(),
    ),
  );
  return $main();
}
