import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../env/env.dart';
import '../helpers/constants.dart';
import '../router/router.gr.dart';

part 'auth_state.freezed.dart';

final Auth0 _auth0 = Auth0("https://${Env.auth0Domain}", Env.auth0ClientId);

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(const AuthState());

  void setStateBasedOnCredentials(Credentials result) {
    state = state.copyWith(auth0AccessToken: result.accessToken, guestUser: false, idToken: result.idToken, user: result.user, loading: false);
  }

  void load() async {
    try {
      state = state.copyWith(loading: true);
      Stopwatch stopwatch = Stopwatch()..start();
      final result = await _auth0.credentialsManager.credentials();
      print('credentials() took ${stopwatch.elapsedMilliseconds}ms');
      setStateBasedOnCredentials(result);
    } catch (e) {
      state = const AuthState();
    }
  }

  void setGuestUserMode(bool guestUser) {
    state = state.copyWith(guestUser: guestUser);
  }

  Future logoutAndNavigate(BuildContext context) async {
    await _auth0.credentialsManager.clearCredentials();
    state = const AuthState();
    FirebaseMessaging.instance.deleteToken();
    context.router.push(LoginScreenRoute());
  }

  Future<bool> login() async {
    try {
      state = state.copyWith(loading: true);
      final PackageInfo info = await PackageInfo.fromPlatform();
      final result = await _auth0.webAuthentication(scheme: info.packageName).login(
        audience: Env.auth0Audience,
        scopes: {'openid', 'profile', 'offline_access', 'email'},
      );
      setStateBasedOnCredentials(result);
      return true;
    } catch (e) {
      state = const AuthState();
      return false;
    }
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool loading,
    UserProfile? user,
    String? auth0AccessToken,
    String? idToken,
    @Default(false) bool guestUser,
  }) = _Auth;
}
