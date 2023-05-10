import 'package:brunstadtv_app/env/prod/firebase_options.dart' as prod_firebase;
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/theme/design_system/biblekids/design_system.dart';
import 'package:flutter/material.dart';
import 'flavors.dart';

Future<void> main() async {
  FlavorConfig.register(
    FlavorConfig(
      flavor: Flavor.bccmedia_prod,
      firebaseOptions: prod_firebase.DefaultFirebaseOptions.currentPlatform,
      applicationCode: 'kids',
      logo: (_) => Image.asset('assets/images/biblekids_logo.png', height: 25),
      designSystem: () => BibleKidsDesignSystem(),
    ),
  );
  return $main();
}
