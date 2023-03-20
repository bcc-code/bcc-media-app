import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:unleash_proxy_client_flutter/toggle_config.dart';
import 'package:unleash_proxy_client_flutter/unleash_context.dart';
import 'package:unleash_proxy_client_flutter/unleash_proxy_client_flutter.dart';
import 'package:unleash_proxy_client_flutter/variant.dart';

import '../env/env.dart';
import 'auth_state/auth_state.dart';

final unleashProvider = FutureProvider<UnleashClient>((ref) async {
  final unleash = ref.watch(unleashRawProvider);
  await unleash.start();
  return unleash;
});

final unleashRawProvider = Provider<UnleashClient>((ref) {
  final client = UnleashClient(
    url: Uri.parse(Env.unleashProxyUrl),
    clientKey: Env.unleashClientKey,
    appName: Env.unleashAppName,
    refreshInterval: 30,
  );
  client.on(
    'error',
    (err) => FlutterError.reportError(FlutterErrorDetails(
      exception: Exception(err),
      context: ErrorDescription('Unleash got error $err'),
    )),
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
    userId: ref.watch(authStateProvider.select((value) => value.user?.bccPersonId)),
  );
});
