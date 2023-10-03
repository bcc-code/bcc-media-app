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
      strictAnonymousAnalytics: true,
      designSystem: () => BibleKidsDesignSystem(),
      strings: (context) => FlavorStrings(
        onboardingTitle: S.of(context).kidsOnboardingTitle,
        onboardingSecondaryTitle: S.of(context).kidsOnboardingSecondaryTitle,
        aboutText: S.of(context).biblekidsAbout,
        contactEmail: 'hello@biblekids.io',
        contactWebsite: Uri.parse('https://biblekids.io'),
      ),
      images: FlavorImages(
        logoHeight: 23,
        logo: const AssetImage('assets/flavors/kids_prod/logo.png', package: 'brunstadtv_app'),
        onboarding: const AssetImage('assets/flavors/kids_prod/onboarding.png', package: 'brunstadtv_app'),
        home: StateImageProvider(
          image: const AssetImage('assets/icons/Home_Default.png', package: 'brunstadtv_app'),
          activeImage: const AssetImage('assets/icons/Home_Selected.png', package: 'brunstadtv_app'),
        ),
        search: StateImageProvider(
          image: const AssetImage('assets/icons/Search_Default.png', package: 'brunstadtv_app'),
          activeImage: const AssetImage('assets/icons/Search_Selected.png', package: 'brunstadtv_app'),
        ),
        live: StateImageProvider(
          image: const AssetImage('assets/icons/Live_Default.png', package: 'brunstadtv_app'),
          activeImage: const AssetImage('assets/icons/Live_Selected.png', package: 'brunstadtv_app'),
        ),
        calendar: StateImageProvider(
          image: const AssetImage('assets/icons/Calendar_Default.png', package: 'brunstadtv_app'),
          activeImage: const AssetImage('assets/icons/Calendar_Selected.png', package: 'brunstadtv_app'),
        ),
        myList: StateImageProvider(
          image: const AssetImage('assets/icons/My_List_Default.png', package: 'brunstadtv_app'),
          activeImage: const AssetImage('assets/icons/My_List_Selected.png', package: 'brunstadtv_app'),
        ),
        games: StateImageProvider(
          image: const AssetImage('assets/icons/Games_Default.png', package: 'brunstadtv_app'),
          activeImage: const AssetImage('assets/icons/Games_Selected.png', package: 'brunstadtv_app'),
        ),
        profile: StateImageProvider(
          image: const AssetImage('assets/icons/Profile_Default.png', package: 'brunstadtv_app'),
          activeImage: const AssetImage('assets/icons/Profile_Selected.png', package: 'brunstadtv_app'),
        ),
      ),
    ),
  );
  return $main();
}
