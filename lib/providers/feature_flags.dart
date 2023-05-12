import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/providers/unleash.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:unleash_proxy_client_flutter/unleash_proxy_client_flutter.dart';

import '../models/feature_flags.dart';

final featureFlagsProvider = StateNotifierProvider<FeatureFlagsNotifier, FeatureFlags>((ref) {
  return FeatureFlagsNotifier(ref.watch(unleashRawProvider));
});

class FeatureFlagsNotifier extends StateNotifier<FeatureFlags> {
  final UnleashClient? client;
  FeatureFlagsNotifier(this.client) : super(getFlags(client)) {
    _update();
    client?.on('update', (_) => _update());
    client?.on('ready', (_) => _update(readyOverride: true));
  }

  static FeatureFlags getFlags(UnleashClient? client) {
    if (client == null) return const FeatureFlags();
    return FeatureFlags(
      auth: FlavorConfig.current.flavor != Flavor.kids_prod || client.isEnabled('kids-auth'),
      publicSignup: client.isEnabled('public-signup'),
      socialSignup: client.isEnabled('social-signup'),
    );
  }

  _update({bool? readyOverride}) {
    state = getFlags(client);
    debugPrint('Feature flags refreshed: $state');
  }
}
