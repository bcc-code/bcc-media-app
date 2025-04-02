import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/providers/settings.dart';

final unleashContextProviderOverride = unleashContextProvider.overrideWith((ref) async {
  return getStandardUnleashContext(
    userId: ref.watch(authStateProvider.select((value) => value.user?.bccPersonId)),
    gender: ref.watch(authStateProvider.select((value) => value.user?.gender)),
    birthDate: ref.watch(authStateProvider.select((value) => value.user?.birthdate)),
    isBetaTester: ref.watch(settingsProvider.select((s) => s.isBetaTester)),
    appVersion: formatAppVersion(ref.watch(packageInfoProvider)),
    appBuildNumber: ref.watch(packageInfoProvider.select((pi) => pi.buildNumber)),
    appLanguage: ref.watch(settingsProvider.select((value) => value.appLanguage.languageCode)),
  );
});
