import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/providers/unleash.dart';
import 'package:flutter/foundation.dart';
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
    client?.on('update', onUnleashUpdate);
    client?.on('ready', onUnleashReady);
  }

  @override
  void dispose() {
    client?.off(type: 'update', callback: onUnleashUpdate);
    client?.off(type: 'ready', callback: onUnleashReady);
    super.dispose();
  }

  void onUnleashUpdate(_) {
    _update();
  }

  void onUnleashReady(_) {
    _update();
  }

  _update() {
    if (!mounted) {
      debugPrint('Tried to call FeatureFlagsNotifier._update but its not mounted. This should not happen.');
      return;
    }
    state = _getFlags(client);
    debugPrint('Feature flags refreshed: $state');
  }

  static FeatureFlags _getFlags(UnleashClient? client) {
    if (client == null) return const FeatureFlags();

    return FeatureFlags(
      toggles: client.toggles,
      auth: FlavorConfig.current.flavor != Flavor.kids || client.isEnabled('kids-auth'),
      publicSignup: client.isEnabled('public-signup'),
      socialSignup: client.isEnabled('social-signup'),
      autoplayNext: FlavorConfig.current.flavor == Flavor.kids || client.isEnabled('autoplay-next'),
      shareVideoButton: FlavorConfig.current.flavor != Flavor.kids,
      autoFullscreenOnPlay: FlavorConfig.current.flavor == Flavor.kids || client.isEnabled('auto-fullscreen-on-play'),
      gamesTab: FlavorConfig.current.flavor == Flavor.kids || client.isEnabled('games-tab'),
      flutterPlayerControls: Env.forceFlutterControls || client.isEnabled('flutter-player-controls'),
      playNextButton: client.isEnabled('play-next-button'),
      chapters: client.isEnabled('chapters'),
      download: client.isEnabled('download'),
    );
  }
}
