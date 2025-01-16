import 'dart:convert';

import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:unleash_proxy_client_flutter/toggle_config.dart';
import 'package:unleash_proxy_client_flutter/unleash_proxy_client_flutter.dart';

import '../models/feature_flags.dart';

/// Returns the base feature flags for the app.
///
/// Note: Anything that's true here will always be enabled.
FeatureFlags getBaseFeatureFlags() {
  return FeatureFlags(
    variants: [],
    kidsAuth: FlavorConfig.current.flavor != Flavor.kids,
    publicSignup: false,
    socialSignup: false,
    shorts: false,
    shortsHideBeta: false,
    shortsGuide: false,
    disableNpawShorts: false,
    skipToChapter: false,
    bccmAudioTest: false,
    shortsWithScores: false,
    elasticSearch: false,
    chapterSlider: false,
    showBmmStreak: false,
  );
}

class FeatureFlagsNotifier extends FeatureFlagsNotifierBase {
  UnleashClient? unleash;

  static final variantsProvider = StateProvider<List<String>>((ref) {
    return [];
  });

  @override
  FeatureFlags build() {
    final unleash = this.unleash;
    if (unleash == null || unleash.clientState != ClientState.ready) {
      final flags = _getCachedFlags(ref);
      // TODO: make variantsProvider a real reactive provider
      Future.delayed(const Duration(milliseconds: 0), () {
        ref.read(variantsProvider.notifier).state = flags.variants;
      });
      return flags;
    }
    ref.listen(
      unleashContextProvider,
      (previous, next) async {
        final context = await next;
        unleash.updateContext(context);
      },
    );

    final value = getBaseFeatureFlags().mergeWithTrueAlwaysWins(
      FeatureFlags(
        variants: _mapVariants(unleash.toggles),
        kidsAuth: _verifyToggle(unleash, 'kids-auth'),
        publicSignup: _verifyToggle(unleash, 'public-signup'),
        socialSignup: _verifyToggle(unleash, 'social-signup'),
        shorts: _verifyToggle(unleash, 'shorts'),
        shortsHideBeta: _verifyToggle(unleash, 'shorts-hide-beta'),
        shortsGuide: _verifyToggle(unleash, 'shorts-guide'),
        disableNpawShorts: _verifyToggle(unleash, 'disable-npaw-shorts'),
        skipToChapter: _verifyToggle(unleash, 'skip-to-chapter'),
        bccmAudioTest: _verifyToggle(unleash, 'bccm-audio-test'),
        shortsWithScores: _verifyToggle(unleash, 'shorts-with-scores3'),
        elasticSearch: _verifyToggle(unleash, 'elastic-search'),
        chapterSlider: _verifyToggle(unleash, 'chapter-slider'),
        showBmmStreak: _verifyToggle(unleash, 'show-bmm-streak'),
      ),
    );

    _saveCache(value);
    // TODO: make variantsProvider a real reactive provider
    Future.delayed(const Duration(milliseconds: 0), () {
      ref.read(variantsProvider.notifier).state = value.variants;
    });
    return value;
  }

  /// A generic method to confirm we want a toggle, with extra logic besides just checking if it's enabled.
  bool _verifyToggle(UnleashClient unleash, String toggleName) {
    final enabled = unleash.isEnabled(toggleName);
    final variant = unleash.getVariant(toggleName);
    final hasVariant = variant.enabled;
    return enabled && (!hasVariant || variant.name != 'disabled');
  }

  @override
  Future<void> activateFeatureFlags() {
    return _createUnleashClient();
  }

  Future<void> _createUnleashClient() async {
    final unleash = this.unleash = UnleashClient(
      url: Uri.parse(Env.unleashProxyUrl),
      clientKey: Env.unleashClientKey,
      appName: FlavorConfig.current.applicationCode,
      refreshInterval: 60,
      customHeaders: {
        'UNLEASH-APPNAME': Env.unleashAppName,
      },
    );
    final context = await ref.read(unleashContextProvider);
    unleash.updateContext(context);
    unleash.on(
      'error',
      (err) => FlutterError.reportError(
        FlutterErrorDetails(
          exception: Exception(err),
          context: ErrorDescription('Unleash got error $err'),
          stack: StackTrace.current,
        ),
      ),
    );
    unleash.on('update', onUnleashUpdate);
    unleash.on('ready', onUnleashReady);
    unleash.on('initialized', onUnleashInit);
    await unleash.start();
  }

  /// Refreshes the feature flags by stopping and starting unleash.
  ///
  /// Remember: You may want to do .timeout() on this method to avoid hanging the app if it takes a long time to refresh.
  @override
  Future<void> refresh() async {
    unleash?.stop();
    final c = await ref.read(unleashContextProvider);
    unleash?.updateContext(c);
    await unleash?.start();
  }

  /// We dont need to do anything on init, as we dont want to use unleash's cached values.
  void onUnleashInit(_) {
    return;
  }

  void onUnleashReady(_) {
    _handleUpdate();
  }

  void onUnleashUpdate(_) {
    _handleUpdate();
  }

  _handleUpdate() {
    final unleash = this.unleash;
    if (unleash == null) return;
    ref.invalidateSelf();
  }

  _saveCache(FeatureFlags flags) {
    final json = flags.toJson();
    ref.read(sharedPreferencesProvider).setString(PrefKeys.featureFlags, jsonEncode(json));
  }

  static FeatureFlags _getCachedFlags(Ref ref) {
    final json = ref.read(sharedPreferencesProvider).getString(PrefKeys.featureFlags);
    if (json == null) return getBaseFeatureFlags();
    try {
      return FeatureFlags.fromJson(jsonDecode(json));
    } catch (e) {
      return getBaseFeatureFlags();
    }
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

final featureFlagsProvider = NotifierProvider<FeatureFlagsNotifierBase, FeatureFlags>(() {
  if (Env.unleashClientKey.isEmpty) return FeatureFlagsDisabledNotifier();
  return FeatureFlagsNotifier();
});

final featureFlagVariantListProviderOverride = featureFlagVariantListProvider.overrideWith((ref) {
  return ref.watch(FeatureFlagsNotifier.variantsProvider);
});

abstract class FeatureFlagsNotifierBase extends Notifier<FeatureFlags> {
  Future<void> activateFeatureFlags();
  Future<void> refresh();
}

class FeatureFlagsDisabledNotifier extends FeatureFlagsNotifierBase {
  @override
  Future<void> activateFeatureFlags() async {}
  @override
  Future<void> refresh() async {}
  @override
  FeatureFlags build() {
    return getBaseFeatureFlags();
  }
}
