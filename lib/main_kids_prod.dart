import 'package:brunstadtv_app/env/kids_prod/firebase_options.dart' as kids_prod_firebase;
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/theme/design_system/biblekids/design_system.dart';
import 'package:flutter/material.dart';
import 'flavors.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  FlavorConfig.register(
    FlavorConfig(
      flavor: Flavor.kids,
      firebaseOptions: kids_prod_firebase.DefaultFirebaseOptions.currentPlatform,
      enableNotifications: false,
      applicationCode: 'kids',
      designSystem: () => BibleKidsDesignSystem(),
      strings: (context) => FlavorStrings(
        onboardingTitle: S.of(context).kidsOnboardingTitle,
        onboardingSecondaryTitle: S.of(context).kidsOnboardingSecondaryTitle,
      ),
      images: FlavorImages(
        logoHeight: 23,
        logo: const AssetImage('assets/flavors/kids_prod/logo.png'),
        onboarding: const AssetImage('assets/flavors/kids_prod/onboarding.png'),
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
