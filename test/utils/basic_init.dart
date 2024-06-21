import 'package:bccm_core/design_system.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/app_theme.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/theme/bccm_gradients.dart';
import 'package:brunstadtv_app/theme/design_system/bccmedia/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';

void basicInit() {
  FlavorConfig.register(FlavorConfig(
    applicationCode: 'btv',
    flavor: Flavor.bccmedia,
    firebaseOptions: null,
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
  ));

  PackageInfo.setMockInitialValues(
      appName: 'appName',
      packageName: 'packageName',
      version: 'version',
      buildNumber: 'buildNumber',
      buildSignature: 'buildSignature',
      installerStore: 'installerStore');
  TestWidgetsFlutterBinding.ensureInitialized();
}
