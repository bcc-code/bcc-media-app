import 'package:brunstadtv_app/env/dev/firebase_options.dart' as dev_firebase;
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:flutter/material.dart';

void main() async {
  FlavorConfig.register(
    FlavorConfig(
      flavor: Flavor.bccmedia_dev,
      firebaseOptions: dev_firebase.DefaultFirebaseOptions.currentPlatform,
      logo: (_) => Image.asset('assets/flavors/prod/logo.png'),
    ),
  );
  return $main();
}
