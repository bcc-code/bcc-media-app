import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:riverpod/riverpod.dart';
import 'package:unleash_proxy_client_flutter/unleash_proxy_client_flutter.dart';

final rawUnleashProviderOverride = rawUnleashProvider.overrideWith((Ref ref) {
  if (Env.unleashClientKey.isEmpty) return null;
  final client = UnleashClient(
    url: Uri.parse(Env.unleashProxyUrl),
    clientKey: Env.unleashClientKey,
    appName: FlavorConfig.current.applicationCode,
    refreshInterval: 60,
    customHeaders: {
      'UNLEASH-APPNAME': Env.unleashAppName,
    },
  );
  return client;
});

final unleashContextProviderOverride = unleashContextProvider.overrideWith((ref) {
  return getStandardUnleashContext(
    userId: ref.watch(authStateProvider.select((value) => value.user?.bccPersonId)),
    gender: ref.watch(authStateProvider.select((value) => value.user?.gender)),
    birthDate: ref.watch(authStateProvider.select((value) => value.user?.birthdate)),
    isBetaTester: ref.watch(settingsProvider.select((s) => s.isBetaTester)),
  );
});
