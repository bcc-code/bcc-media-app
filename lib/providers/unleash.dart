import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/providers/settings.dart';

final unleashContextProviderOverride = unleashContextProvider.overrideWith((ref) {
  print('ag: unleashContextProviderOverride');
  final c = getStandardUnleashContext(
    userId: ref.watch(authStateProvider.select((value) => value.user?.bccPersonId)),
    gender: ref.watch(authStateProvider.select((value) => value.user?.gender)),
    birthDate: ref.watch(authStateProvider.select((value) => value.user?.birthdate)),
    isBetaTester: ref.watch(settingsProvider.select((s) => s.isBetaTester)),
  );
  print('ag: unleashContextProviderOverride: ${c.properties.toString()}');
  return c;
});
