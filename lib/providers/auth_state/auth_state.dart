import 'package:brunstadtv_app/api/auth0_api.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/auth_state.dart';
import '../../models/feature_flags.dart';
import 'auth_state_notifier_stub.dart'
    if (dart.library.io) './implementations/auth_state_notifier_mobile.dart'
    if (dart.library.html) './implementations/auth_state_notifier_web.dart';
import 'implementations/auth_state_notifier_disabled.dart';

abstract class AuthStateNotifier implements StateNotifier<AuthState> {
  Future<AuthState?> getExistingAndEnsureNotExpired();
  Future<bool> load();
  Future<bool> forceRefresh();
  Future logout({bool manual = true});
  Future<bool> login({String? connection});
  Future<void> loginViaDeviceCode(DeviceTokenRequestResponse deviceToken);
  factory AuthStateNotifier(Ref ref) => getPlatformSpecificAuthStateNotifier(ref);
}

final authEnabledProvider = StateProvider<bool>((ref) {
  return true;
});

final authFeatureFlagListener = Provider<void>((ref) {
  ref.listen<FeatureFlags>(featureFlagsProvider, (previous, next) {
    ref.read(authEnabledProvider.notifier).state = next.auth;
  });
});

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  if (!ref.watch(authEnabledProvider)) {
    debugPrint('authStateProvider: $AuthStateNotifierDisabled');
    return AuthStateNotifierDisabled();
  }
  final notifier = AuthStateNotifier(ref);
  debugPrint('authStateProvider: ${notifier.runtimeType}');
  return notifier;
});
