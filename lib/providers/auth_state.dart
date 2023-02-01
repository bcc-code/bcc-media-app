import 'dart:async';
import 'dart:convert';

import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';
import 'package:http/http.dart' as http;

import '../env/env.dart';
import '../helpers/constants.dart';
import '../models/auth/auth0_id_token.dart';

part 'auth_state.freezed.dart';

const kMinimumCredentialsTTL = Duration(hours: 1);

const FlutterAppAuth appAuth = FlutterAppAuth();
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(const AuthState());
  Timer? refreshTimer;

  Future<AuthState?> getExistingAndEnsureNotExpired() async {
    if (state.expiresAt == null || state.auth0AccessToken == null) {
      return null;
    }
    if (state.expiresAt!.difference(DateTime.now()) < kMinimumCredentialsTTL) {
      await refresh();
    }
    if (state.expiresAt!.difference(DateTime.now()) < kMinimumCredentialsTTL) {
      throw Exception('Auth state is still expired after attempting to renew.');
    }
    return state;
  }

  Future<bool> loadFromStorage() async {
    final accessToken = await secureStorage.read(key: SecureStorageKeys.accessToken);
    final idToken = await secureStorage.read(key: SecureStorageKeys.idToken);

    if (accessToken == null || idToken == null) {
      return false;
    }
    DateTime? expiry;
    try {
      expiry = _getAccessTokenExpiry(accessToken);
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      logout();
      return false;
    }
    final ttl = expiry.difference(DateTime.now());
    if (ttl < kMinimumCredentialsTTL) {
      return refresh();
    }
    state = state.copyWith(
      auth0AccessToken: accessToken,
      idToken: idToken,
      user: _parseIdToken(idToken),
      expiresAt: expiry,
    );
    return true;
  }

  Future<bool> refresh() async {
    final refreshToken = await secureStorage.read(key: SecureStorageKeys.refreshToken);

    if (refreshToken == null) {
      return false;
    }

    final PackageInfo info = await PackageInfo.fromPlatform();
    try {
      final TokenResponse? result = await appAuth.token(
        TokenRequest(
          Env.auth0ClientId,
          '${info.packageName}://login-callback',
          issuer: 'https://${Env.auth0Domain}',
          refreshToken: refreshToken,
          additionalParameters: {'audience': Env.auth0Audience},
        ),
      );
      _setStateBasedOnResponse(result!);
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      print('error on Refresh Token: $e - stack: $s');
      // logOut() possibly
      return false;
    }
    return true;
  }

  Future _clearCredentials() async {
    await Future.wait(
      [
        secureStorage.delete(key: SecureStorageKeys.refreshToken),
        secureStorage.delete(key: SecureStorageKeys.accessToken),
        secureStorage.delete(key: SecureStorageKeys.idToken),
      ],
    );
  }

  Future<bool> logoutFederated() async {
    final url = Uri.https(
      'https://${Env.auth0Domain}',
      '/v2/logout',
      {'client_id': Env.auth0ClientId, 'federated': ''},
    );

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${state.auth0AccessToken}'},
    );

    print(
      'logout: ${response.request} ${response.statusCode} ${response.body}',
    );
    return response.statusCode == 200;
  }

  Future logout({bool federated = true}) async {
    await _clearCredentials();

    if (federated) {
      await logoutFederated();
    }

    return;
  }

  Future<bool> login() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    try {
      final authorizationTokenRequest = AuthorizationTokenRequest(
        Env.auth0ClientId,
        '${info.packageName}://login-callback',
        issuer: 'https://${Env.auth0Domain}',
        scopes: ['openid', 'profile', 'offline_access', 'church', 'country'],
        additionalParameters: {'audience': Env.auth0Audience},
      );

      final AuthorizationTokenResponse? result = await appAuth.authorizeAndExchangeCode(
        authorizationTokenRequest,
      );

      await _setStateBasedOnResponse(result!);
    } catch (e, st) {
      logout(federated: false);
      debugPrint(e.toString());
      FirebaseCrashlytics.instance.recordError(e, st);
      return false;
    }
    return true;
  }

  Future<void> _setStateBasedOnResponse(TokenResponse? result) async {
    final accessToken = result?.accessToken;
    final idToken = result?.idToken;
    final refreshToken = result?.idToken;
    if (accessToken == null || idToken == null || refreshToken == null) {
      throw Exception([
        'Invalid token response',
        'result null: ${result == null}',
        'accessToken null: ${accessToken == null}',
        'idToken null: ${idToken == null}',
        'refreshToken null: ${refreshToken == null}',
      ]);
    }

    await Future.wait([
      secureStorage.write(
        key: SecureStorageKeys.refreshToken,
        value: refreshToken,
      ),
      secureStorage.write(
        key: SecureStorageKeys.idToken,
        value: idToken,
      ),
      secureStorage.write(
        key: SecureStorageKeys.accessToken,
        value: accessToken,
      )
    ]);

    state = state.copyWith(
      auth0AccessToken: accessToken,
      idToken: idToken,
      user: _parseIdToken(idToken),
      expiresAt: _getAccessTokenExpiry(accessToken),
    );
  }
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    Auth0IdToken? user,
    String? auth0AccessToken,
    DateTime? expiresAt,
    String? idToken,
  }) = _Auth;

  bool get guestMode => auth0AccessToken == null;
}

Auth0IdToken _parseIdToken(String idToken) {
  final parts = idToken.split(r'.');
  assert(parts.length == 3);

  final Map<String, dynamic> json = jsonDecode(
    utf8.decode(
      base64Url.decode(
        base64Url.normalize(parts[1]),
      ),
    ),
  );

  return Auth0IdToken.fromJson(json);
}

DateTime _getAccessTokenExpiry(String accessToken) {
  final accessTokenExpiry = (JwtDecoder.decode(accessToken)['exp'] as Object?).asOrNull<int>();
  if (accessTokenExpiry == null) {
    throw Exception('AuthState: expiry is null: $accessTokenExpiry');
  }
  final expiry = DateTime.fromMillisecondsSinceEpoch(accessTokenExpiry * 1000, isUtc: true);
  return expiry;
}
