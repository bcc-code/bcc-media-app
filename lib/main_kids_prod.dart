import 'package:brunstadtv_app/env/kids_prod/firebase_options.dart' as kids_prod_firebase;
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/theme/design_system/biblekids_old/design_system.dart';
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
      designSystem: () => OldBibleKidsDesignSystem(),
      strings: (context) => FlavorStrings(
        onboardingTitle: S.of(context).kidsOnboardingTitle,
        onboardingSecondaryTitle: S.of(context).kidsOnboardingSecondaryTitle,
        aboutText: S.of(context).biblekidsAbout,
        contactEmail: 'hello@biblekids.io',
        contactWebsite: Uri.parse('https://biblekids.io'),
      ),
      bccmImages: null,
    ),
  );
  return $main();
}
