import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/app_theme.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/env/prod/firebase_options.dart' as prod_firebase;
import 'package:brunstadtv_app/theme/bccm_gradients.dart';
import 'package:brunstadtv_app/theme/design_system/bccmedia/design_system.dart';
import 'package:flutter/material.dart';
import 'flavors.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  FlavorConfig.register(
    FlavorConfig(
      applicationCode: AppNames.bccmMobile,
      flavor: Flavor.bccmedia,
      environment: EnvironmentOverride.prod,
      firebaseOptions: prod_firebase.DefaultFirebaseOptions.currentPlatform,
      enableNotifications: true,
      defaultLanguage: 'no',
      designSystem: () => BccMediaDesignSystem(),
      strings: (context) => FlavorStrings(
        onboardingTitle: S.of(context).loginPageDisplay1,
        onboardingSecondaryTitle: S.of(context).loginPageDisplay2,
        aboutText: S.of(context).bccMediaCenter,
        contactEmail: 'support@bcc.media',
        contactWebsite: Uri.parse('https://bcc.media'),
      ),
      appTheme: (context) => AppThemeData(
        studyGradient: BccmGradients.greenYellow,
        genericBackgroundGradient: BccmGradients.purpleTransparentTopBottom,
        achievementBackgroundGradient: BccmGradients.purpleTransparent,
        appBarTransparent: true,
        tabTheme: AppTabThemeData(
          activeColor: DesignSystem.of(context).colors.tint1,
          iconActiveGradient: BccmGradients.softPurpleBlue,
        ),
      ),
      bccmImages: BccmFlavorImages(
        logoHeight: 20,
        logo: const AssetImage('assets/flavors/prod/logo.png'),
        onboarding: const AssetImage('assets/flavors/prod/onboarding.png'),
        home: StateImageProvider(
          image: const AssetImage('assets/icons/Home_Default.png'),
          activeImage: const AssetImage('assets/icons/Home_Selected.png'),
        ),
        audio: StateImageProvider(
          image: const AssetImage('assets/icons/Audio_Default.png'),
          activeImage: const AssetImage('assets/icons/Audio_Default.png'),
        ),
        search: StateImageProvider(
          image: const AssetImage('assets/icons/Search_Default.png'),
          activeImage: const AssetImage('assets/icons/Search_Selected.png'),
        ),
        myList: StateImageProvider(
          image: const AssetImage('assets/icons/My_List_Default.png'),
          activeImage: const AssetImage('assets/icons/My_List_Selected.png'),
        ),
        shorts: StateImageProvider(
          image: const AssetImage('assets/icons/Shorts_Default.png'),
          activeImage: const AssetImage('assets/icons/Shorts_Selected.png'),
        ),
        games: StateImageProvider(
          image: const AssetImage('assets/icons/Games_Default.png'),
          activeImage: const AssetImage('assets/icons/Games_Selected.png'),
        ),
        profile: StateImageProvider(
          image: const AssetImage('assets/icons/Profile_Default.png'),
          activeImage: const AssetImage('assets/icons/Profile_Selected.png'),
        ),
      ),
    ),
  );
  return $main();
}
