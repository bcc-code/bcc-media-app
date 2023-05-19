import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/env/prod/firebase_options.dart' as prod_firebase;
import 'package:flutter/material.dart';
import 'flavors.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  FlavorConfig.register(
    FlavorConfig(
      flavor: Flavor.bccmedia,
      firebaseOptions: prod_firebase.DefaultFirebaseOptions.currentPlatform,
      enableNotifications: false,
      strings: (context) => FlavorStrings(
        onboardingTitle: S.of(context).loginPageDisplay1,
        onboardingSecondaryTitle: S.of(context).loginPageDisplay2,
      ),
      images: FlavorImages(
        logoHeight: 20,
        logo: const AssetImage('assets/flavors/prod/logo.png'),
        onboarding: const AssetImage('assets/flavors/prod/onboarding.png'),
        home: StateImageProvider(
          image: const AssetImage('assets/icons/Home_Default.png'),
          activeImage: const AssetImage('assets/icons/Home_Selected.png'),
        ),
        search: StateImageProvider(
          image: const AssetImage('assets/icons/Search_Default.png'),
          activeImage: const AssetImage('assets/icons/Search_Selected.png'),
        ),
        live: StateImageProvider(
          image: const AssetImage('assets/icons/Live_Default.png'),
          activeImage: const AssetImage('assets/icons/Live_Selected.png'),
        ),
        calendar: StateImageProvider(
          image: const AssetImage('assets/icons/Calendar_Default.png'),
          activeImage: const AssetImage('assets/icons/Calendar_Selected.png'),
        ),
        myList: StateImageProvider(
          image: const AssetImage('assets/icons/My_List_Default.png'),
          activeImage: const AssetImage('assets/icons/My_List_Selected.png'),
        ),
      ),
    ),
  );
  return $main();
}
