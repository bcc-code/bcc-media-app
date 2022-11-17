import 'dart:async';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../env/env.dart';

part 'auth_state.freezed.dart';

const kMinimumCredentialsTTL = Duration(minutes: 60);

final Auth0 _auth0 = Auth0("https://${Env.auth0Domain}", Env.auth0ClientId);

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(const AuthState());
  Timer? refreshTimer;

  void setStateBasedOnCredentials(Credentials result) {
    state = state.copyWith(
        auth0AccessToken: result.accessToken, guestMode: false, idToken: result.idToken, user: result.user, expiresAt: result.expiresAt);
  }

  void scheduleRefresh() {
    final expiresAt = state.expiresAt;
    if (expiresAt == null) {
      FirebaseCrashlytics.instance.recordError('AuthState.scheduleRefresh: expiresAt is null. Logging user out.', null);
      logout();
      return;
    }
    refreshTimer?.cancel();
    final timeUntilExpiry = expiresAt.difference(DateTime.now());
    refreshTimer = Timer(timeUntilExpiry - kMinimumCredentialsTTL, () => load());
  }

  Future<bool> load() async {
    try {
      Stopwatch stopwatch = Stopwatch()..start();
      final result = await _auth0.credentialsManager.credentials(minTtl: kMinimumCredentialsTTL.inSeconds);
      print('credentials() took ${stopwatch.elapsedMilliseconds}ms');
      setStateBasedOnCredentials(result);
      scheduleRefresh();
      return true;
    } catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      final cause = e.asOrNull<CredentialsManagerException>()?.code;
      if (cause == 'RENEW_FAILED') {
        rethrow;
      } else {
        logout();
      }
      return false;
    }
  }

  void setGuestMode(bool guestMode) {
    state = state.copyWith(guestMode: guestMode);
  }

  Future logout() async {
    await _auth0.credentialsManager.clearCredentials();
    state = const AuthState();
    FirebaseMessaging.instance.deleteToken();
  }

  Future<bool> login() async {
    try {
      final PackageInfo info = await PackageInfo.fromPlatform();
      final result = await _auth0.webAuthentication(scheme: info.packageName).login(
        audience: Env.auth0Audience,
        scopes: {'openid', 'profile', 'offline_access', 'email'},
      );
      setStateBasedOnCredentials(result);
      final durationUntilExpiry = result.expiresAt.difference(DateTime.now());
      if (durationUntilExpiry > kMinimumCredentialsTTL) {
        scheduleRefresh();
      } else {
        FirebaseCrashlytics.instance.recordError(
            'Expiry time for fresh token is very short, it\'s only: ${durationUntilExpiry.inSeconds} seconds. Not scheduling refresh to prevent excessive load.',
            StackTrace.current);
      }
      return true;
    } catch (e) {
      logout();
      return false;
    }
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    UserProfile? user,
    String? auth0AccessToken,
    DateTime? expiresAt,
    String? idToken,
    @Default(false) bool guestMode,
  }) = _Auth;
}
