import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/env/prod/firebase_options.dart' as prod_firebase;
import 'package:flutter/material.dart';
import 'flavors.dart';

Future<void> main() async {
  FlavorConfig.register(
    FlavorConfig(
      flavor: Flavor.bccmedia_prod,
      firebaseOptions: prod_firebase.DefaultFirebaseOptions.currentPlatform,
      logo: (_) => Image.asset('assets/flavors/prod/logo.png'),
    ),
  );
  return $main();
}
