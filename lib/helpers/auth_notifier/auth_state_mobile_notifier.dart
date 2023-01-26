import 'dart:async';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';

import '../utils.dart';
import '../../env/env.dart';
import '../../models/auth_state.dart';
import 'auth_state_notifier_interface.dart';

const kMinimumCredentialsTTL = Duration(hours: 1, minutes: 59);

final Auth0 _auth0 = Auth0('https://${Env.auth0Domain}', Env.auth0ClientId);

class AuthStateMobileNotifier extends StateNotifier<AuthState> implements AuthStateNotifier {
  AuthStateMobileNotifier() : super(const AuthState());
  Timer? refreshTimer;

  void setStateBasedOnCredentials(Credentials result) {
    state = state.copyWith(auth0AccessToken: result.accessToken, idToken: result.idToken, user: result.user, expiresAt: result.expiresAt);
  }

  @override
  Future<AuthState?> getExistingAndEnsureNotExpired() async {
    if (state.expiresAt == null || state.auth0AccessToken == null) {
      return null;
    }
    if (state.expiresAt!.isBefore(DateTime.now())) {
      await load();
    }
    if (state.expiresAt!.isBefore(DateTime.now())) {
      throw Exception('Auth state is still expired after attempting to renew.');
    }
    return state;
  }

  @override
  Future<bool> load() async {
    try {
      Stopwatch stopwatch = Stopwatch()..start();
      final result = await _auth0.credentialsManager.credentials(minTtl: kMinimumCredentialsTTL.inSeconds);
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

  @override
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

  @override
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

AuthStateNotifier getAuthStateNotifier() => AuthStateMobileNotifier();
