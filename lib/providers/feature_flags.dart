import 'dart:convert';

import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:unleash_proxy_client_flutter/toggle_config.dart';
import 'package:unleash_proxy_client_flutter/unleash_context.dart';
import 'package:unleash_proxy_client_flutter/unleash_proxy_client_flutter.dart';

import '../models/feature_flags.dart';

final featureFlagsProvider = StateNotifierProvider<FeatureFlagsNotifierBase, FeatureFlags>((ref) {
  if (Env.unleashClientKey.isEmpty) return FeatureFlagsDisabledNotifier(ref);
  return FeatureFlagsNotifier(ref);
});

class FeatureFlagsNotifier extends StateNotifier<FeatureFlags> implements FeatureFlagsNotifierBase {
  UnleashClient? unleash;
  final Ref ref;

  FeatureFlagsNotifier(this.ref) : super(_getCachedFlags(ref)) {
    ref.listen<AuthStateNotifier?>(authStateProvider.notifier, _onAuthNotifierChanged, fireImmediately: true);
  }

  void _onAuthNotifierChanged(AuthStateNotifier? prev, AuthStateNotifier? authNotifier) async {
    if (prev != null || authNotifier == null) return;
    await authNotifier.initializeCompleter.future;
    debugPrint('ag: FeatureFlagsNotifier. auth initialized, starting unleash');
    _startUnleash();
  }

  void _startUnleash() {
    print('ag: Unleash client created');
    final u = unleash = UnleashClient(
      url: Uri.parse(Env.unleashProxyUrl),
      clientKey: Env.unleashClientKey,
      appName: FlavorConfig.current.applicationCode,
      refreshInterval: 60,
      customHeaders: {
        'UNLEASH-APPNAME': Env.unleashAppName,
      },
    );
    final c = ref.refresh(unleashContextProvider);
    u.updateContext(c);
    debugPrint('ag: FeatureFlagsNotifier._startUnleash, starting unleash, context: ${c.properties.toString()}');
    u.on(
      'error',
      (err) => FlutterError.reportError(
        FlutterErrorDetails(
          exception: Exception(err),
          context: ErrorDescription('Unleash got error $err'),
          stack: StackTrace.current,
        ),
      ),
    );
    ref.listen(
      unleashContextProvider,
      (UnleashContext? previous, UnleashContext next) {
        debugPrint('ag: Unleash context updated: ${next.properties.toString()}');
        u.updateContext(next);
      },
      fireImmediately: true,
    );
    u.on('update', onUpdate);
    u.on('ready', onReady);
    u.on('initialized', onInit);
    u.start();
  }

  /// Refreshes the feature flags by stopping and starting unleash.
  ///
  /// Remember: You may want to do .timeout() on this method to avoid hanging the app if it takes a long time to refresh.
  Future<void> refresh() async {
    debugPrint('ag: FeatureFlagsNotifier.refresh');
    unleash?.stop();
    unleash?.updateContext(ref.read(unleashContextProvider));
    debugPrint('ag: FeatureFlagsNotifier.refresh, starting unleash, context: ${unleash?.context.properties.toString()}');
    await unleash?.start();
    debugPrint('ag: Feature flags refresh() completed');
  }

  void onInit(_) {
    debugPrint('ag: FeatureFlagsNotifier.onInit');
    return;
  }

  void onReady(_) {
    debugPrint('ag: FeatureFlagsNotifier.onReady');
    _handleUpdate();
  }

  void onUpdate(_) {
    debugPrint('ag: FeatureFlagsNotifier.onUpdate');
    _handleUpdate();
  }

  _handleUpdate() {
    if (!mounted) {
      debugPrint('Tried to call FeatureFlagsNotifier._update but its not mounted. This should not happen.');
      return;
    }
    final u = unleash;
    if (u == null) return;
    _saveState(_mapFlagsFromUnleash(u));
    debugPrint('ag: Feature flags refreshed: $state');
  }

  _saveState(FeatureFlags flags) {
    state = flags;
    final json = flags.toJson();
    ref.read(sharedPreferencesProvider).setString(PrefKeys.featureFlags, jsonEncode(json));
  }

  static FeatureFlags _getCachedFlags(Ref ref) {
    final json = ref.read(sharedPreferencesProvider).getString(PrefKeys.featureFlags);
    if (json == null) return getDefaultFlags(ref);
    return FeatureFlags.fromJson(jsonDecode(json));
  }

  FeatureFlags _mapFlagsFromUnleash(UnleashClient client) {
    debugPrint('ag: _mapFlagsFromUnleash, client: ${client.hashCode}');
    final flags = getDefaultFlags(ref);
    return flags.copyWith(
      variants: _mapVariants(client.toggles),
      auth: flags.auth || client.isEnabled('kids-auth'),
      publicSignup: client.isEnabled('public-signup'),
      socialSignup: client.isEnabled('social-signup'),
      autoplayNext: flags.autoplayNext || client.isEnabled('autoplay-next'),
      shareVideoButton: flags.shareVideoButton,
      flutterPlayerControls: flags.flutterPlayerControls || client.isEnabled('flutter-player-controls'),
      playNextButton: client.isEnabled('play-next-button'),
      chapters: client.isEnabled('chapters'),
      chaptersFirstTab: client.isEnabled('chapters-first-tab'),
      download: client.isEnabled('download'),
      shorts: Env.forceShorts || client.isEnabled('shorts') && client.getVariant('shorts').name != 'disabled',
      shortsSourceButtonPrimary: client.isEnabled('shorts-source-button-primary'),
      shortsSharing: client.isEnabled('shorts-sharing'),
      shortsHideAutoGenerated: client.isEnabled('shorts-hide-auto-generated'),
      shortsHideBeta: client.isEnabled('shorts-hide-beta'),
      shortsGuide: client.isEnabled('shorts-guide'),
      linkToBccLive: client.isEnabled('link-to-bcc-live'),
      forceBccLive: client.isEnabled('force-bcc-live'),
      removeLiveTab: client.isEnabled('remove-live-tab'),
      disableNpawShorts: client.isEnabled('disable-npaw-shorts'),
    );
  }
}

List<String> _mapVariants(Map<String, ToggleConfig> toggles) {
  return toggles.entries.fold<List<String>>([], (list, toggle) {
    final variantName = toggle.value.variant.name;
    if (variantName.isEmpty || toggle.value.variant.enabled == false) {
      return [...list, toggle.key];
    }
    return [...list, '${toggle.key}:$variantName'];
  });
}

/// Returns the default feature flags for the app.
///
/// Note: Accepts a `ref` and can potentially `watch` other providers.
FeatureFlags getDefaultFlags(Ref ref) {
  return FeatureFlags(
    variants: [],
    auth: FlavorConfig.current.flavor != Flavor.kids,
    publicSignup: false,
    socialSignup: false,
    autoplayNext: FlavorConfig.current.flavor == Flavor.kids,
    shareVideoButton: FlavorConfig.current.flavor != Flavor.kids,
    flutterPlayerControls: Env.forceFlutterControls,
    playNextButton: false,
    chapters: false,
    chaptersFirstTab: false,
    download: false,
    shorts: false,
    shortsSourceButtonPrimary: false,
    shortsSharing: false,
    shortsHideAutoGenerated: false,
    shortsHideBeta: false,
    shortsGuide: false,
    linkToBccLive: true,
    forceBccLive: true,
    removeLiveTab: true,
    disableNpawShorts: false,
  );
}

final featureFlagVariantListProviderOverride = featureFlagVariantListProvider.overrideWith((ref) {
  return ref.watch(featureFlagsProvider).variants;
});

abstract class FeatureFlagsNotifierBase extends StateNotifier<FeatureFlags> {
  FeatureFlagsNotifierBase(FeatureFlags state) : super(state);

  Future<void> refresh();
}

class FeatureFlagsDisabledNotifier extends FeatureFlagsNotifierBase {
  FeatureFlagsDisabledNotifier(Ref ref) : super(getDefaultFlags(ref));

  @override
  Future<void> refresh() async {}
}
