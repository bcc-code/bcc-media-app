import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/providers/settings.dart';

final unleashContextProviderOverride = unleashContextProvider.overrideWith((ref) async {
  final anonymousId = await ref.watch(analyticsProvider.select((value) => value.getAnonymousId()));
  return getStandardUnleashContext(
    userId: anonymousId,
    isBetaTester: ref.watch(settingsProvider.select((s) => s.isBetaTester)),
    appVersion: formatAppVersion(ref.watch(packageInfoProvider)),
    appBuildNumber: ref.watch(packageInfoProvider.select((pi) => pi.buildNumber)),
    appLanguage: ref.watch(settingsProvider.select((s) => s.appLanguage.languageCode)),
  );
});
