import 'dart:async';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';

import '../env/env.dart';

part 'auth_state.freezed.dart';

const kMinimumCredentialsTTL = Duration(hours: 1, minutes: 59);

final Auth0 _auth0 = Auth0("https://${Env.auth0Domain}", Env.auth0ClientId);

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(const AuthState());
  Timer? refreshTimer;

  void setStateBasedOnCredentials(Credentials result) {
    final accessTokenExpiry = (JwtDecoder.decode(result.accessToken)['exp'] as Object?).asOrNull<int>();
    if (accessTokenExpiry == null) {
      throw Exception('AuthState: expiry is null: $accessTokenExpiry');
    }
    final expiry = DateTime.fromMillisecondsSinceEpoch(accessTokenExpiry * 1000, isUtc: true);
    state = state.copyWith(auth0AccessToken: result.accessToken, idToken: result.idToken, user: result.user, expiresAt: expiry);
  }

  Future<AuthState?> getExistingAndEnsureNotExpired() async {
    if (state.expiresAt == null || state.auth0AccessToken == null) {
      return null;
    }
    if (state.expiresAt!.isBefore(DateTime.now())) {
      await load(force: true);
    }
    if (state.expiresAt!.isBefore(DateTime.now())) {
      throw Exception('Auth state is still expired after attempting to renew.');
    }
    return state;
  }

  Future<bool> load({bool force = false}) async {
    try {
      Stopwatch stopwatch = Stopwatch()..start();
      final result =
          await _auth0.credentialsManager.credentials(minTtl: force ? const Duration(hours: 23).inSeconds : kMinimumCredentialsTTL.inSeconds);
      print('credentials() took ${stopwatch.elapsedMilliseconds}ms');
      setStateBasedOnCredentials(result);
      return true;
    } catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      final cause = e.asOrNull<CredentialsManagerException>()?.code;
      if (cause == 'RENEW_FAILED') {
        rethrow;
      } else {
        logout(federated: false);
      }
      return false;
    }
  }

  Future logout({bool federated = true}) async {
    RudderController.instance.reset();
    final PackageInfo info = await PackageInfo.fromPlatform();
    if (federated) {
      await _auth0.webAuthentication(scheme: info.packageName).logout();
    }
    await _auth0.credentialsManager.clearCredentials();
    state = const AuthState();
    FirebaseMessaging.instance.deleteToken();
  }

  Future<bool> login() async {
    try {
      final PackageInfo info = await PackageInfo.fromPlatform();
      final result = await _auth0.webAuthentication(scheme: info.packageName).login(
        audience: Env.auth0Audience,
        scopes: {'openid', 'profile', 'offline_access', 'church', 'country'},
      );
      setStateBasedOnCredentials(result);
      return true;
    } catch (e) {
      logout(federated: false);
      return false;
    }
  }
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    UserProfile? user,
    String? auth0AccessToken,
    DateTime? expiresAt,
    String? idToken,
  }) = _Auth;

  bool get guestMode => auth0AccessToken == null;
}
