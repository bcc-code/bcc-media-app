import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:riverpod/riverpod.dart';
import 'package:unleash_proxy_client_flutter/unleash_proxy_client_flutter.dart';

UnleashClient? getRawUnleashProvider(Ref ref) {
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
  return client;
}
