import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:unleash_proxy_client_flutter/unleash_context.dart';
import 'package:unleash_proxy_client_flutter/unleash_proxy_client_flutter.dart';

import '../env/env.dart';
import '../flavors.dart';
import 'auth_state/auth_state.dart';

final unleashProvider = FutureProvider<UnleashClient?>((ref) async {
  final unleash = ref.watch(unleashRawProvider);
  if (unleash == null) return null;
  try {
    await unleash.start();
  } catch (e, st) {
    FlutterError.reportError(FlutterErrorDetails(exception: e, stack: st));
    return null;
  }
  return unleash;
});

final unleashRawProvider = Provider<UnleashClient?>((ref) {
  if (Env.unleashClientKey.isEmpty) return null;
  final isBetaTester = ref.watch(settingsProvider.select((s) => s.isBetaTester == true));
  final client = UnleashClient(
    url: Uri.parse(Env.unleashProxyUrl),
    clientKey: isBetaTester ? Env.unleashClientKeyBetaTester : Env.unleashClientKey,
    appName: FlavorConfig.current.applicationCode,
    refreshInterval: 60,
    customHeaders: {
      'UNLEASH-APPNAME': Env.unleashAppName,
    },
  );
  client.on(
    'error',
    (err) => FlutterError.reportError(
      FlutterErrorDetails(
        exception: Exception(err),
        context: ErrorDescription('Unleash got error $err'),
        stack: StackTrace.current,
      ),
    ),
  );
  client.on('update', (_) => debugPrint('Unleash refresh'));
  ref.listen(
    unleashContextProvider,
    (UnleashContext? previous, UnleashContext next) {
      client.updateContext(next);
    },
    fireImmediately: true,
  );
  return client;
});

final unleashContextProvider = Provider<UnleashContext>((ref) {
  return UnleashContext(
    properties: {
      'appName': FlavorConfig.current.applicationCode,
    },
    userId: ref.watch(
      authStateProvider.select((value) => value.user?.bccPersonId),
    ),
  );
});
