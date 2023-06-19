import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/providers/unleash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:unleash_proxy_client_flutter/unleash_proxy_client_flutter.dart';

import '../models/feature_flags.dart';

final featureFlagsProvider = StateNotifierProvider<FeatureFlagsNotifier, FeatureFlags>((ref) {
  return FeatureFlagsNotifier(ref.watch(unleashRawProvider));
});

class FeatureFlagsNotifier extends StateNotifier<FeatureFlags> {
  final UnleashClient? client;
  FeatureFlagsNotifier(this.client) : super(_getFlags(client)) {
    _update();
    client?.on('update', (_) => _update());
    client?.on('ready', (_) => _update(readyOverride: true));
  }

  static FeatureFlags _getFlags(UnleashClient? client) {
    if (client == null) return const FeatureFlags();
    return FeatureFlags(
      auth: FlavorConfig.current.flavor != Flavor.kids || client.isEnabled('kids-auth'),
      publicSignup: client.isEnabled('public-signup'),
      socialSignup: client.isEnabled('social-signup'),
      autoplayNext: client.isEnabled('autoplay-next'),
      shareVideoButton: FlavorConfig.current.flavor != Flavor.kids,
      autoFullscreenOnPlay: FlavorConfig.current.flavor == Flavor.kids || client.isEnabled('auto-fullscreen-on-play'),
      gamesTab: kDebugMode && FlavorConfig.current.flavor == Flavor.kids || client.isEnabled('games-tab'),
      flutterPlayerControls: Env.forceFlutterControls || client.isEnabled('flutter-player-controls'),
    );
  }

  _update({bool? readyOverride}) {
    state = _getFlags(client);
    debugPrint('Feature flags refreshed: $state');
  }
}
