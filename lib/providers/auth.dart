import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/models/feature_flags.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final kidsAuthFeatureFlagListener = Provider<void>((ref) {
  ref.listen<FeatureFlags>(featureFlagsProvider, (previous, next) {
    ref.read(authEnabledProvider.notifier).state = next.kidsAuth;
  });
});

final authEnabledProvider = StateProvider<bool>((ref) {
  return true;
});

final authStateProviderOverride = authStateProvider.overrideWith((ref) {
  if (!ref.watch(authEnabledProvider)) {
    debugPrint('authStateProvider: $AuthStateNotifierDisabled');
    return AuthStateNotifierDisabled();
  }
  final notifier = AuthStateNotifier(
    AuthConfig(
      auth0Audience: Env.auth0Audience,
      auth0ClientId: Env.auth0ClientId,
      auth0Domain: Env.auth0Domain,
      scopes: Env.auth0Scopes,
      isTv: ref.watch(isAndroidTvProvider),
      onSignout: () async {
        ref.read(analyticsProvider).reset();
        if (FlavorConfig.current.enableNotifications) {
          try {
            await FirebaseMessaging.instance.getToken();
            ref.read(notificationServiceProvider).deleteToken();
          } catch (e) {
            debugPrint('Failed to delete token: $e');
          }
        }
        ref.read(settingsProvider.notifier).setAnalyticsId(null);
        ref.read(settingsProvider.notifier).refreshSessionId();

        ref.read(featureFlagsProvider.notifier).refresh();
      },
      onSignIn: () {
        ref.read(sharedPreferencesProvider).setBool(PrefKeys.hasEverLoggedIn, true);
      },
    ),
    ref,
  );
  debugPrint('authStateProvider: ${notifier.runtimeType}');
  return notifier;
});
