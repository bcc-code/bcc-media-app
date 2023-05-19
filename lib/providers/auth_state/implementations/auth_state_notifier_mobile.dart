import 'dart:async';
import 'dart:convert';

import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:clock/clock.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';
import 'package:synchronized/synchronized.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../env/env.dart';
import '../../../helpers/constants.dart';
import '../../../models/auth0/auth0_id_token.dart';
import '../../../models/auth_state.dart';
import '../auth_state.dart';

// Careful. The function naming here is very important,
// but because it's conditionally imported (see auth_state_notifier_interface.dart)
// IDEs don't show any errors when you remove/change it..
AuthStateNotifier getPlatformSpecificAuthStateNotifier(Ref ref) {
  return AuthStateNotifierMobile(
    appAuth: const FlutterAppAuth(),
    secureStorage: const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true, // https://github.com/mogol/flutter_secure_storage/issues/354
        sharedPreferencesName: 'auth',
      ),
    ),
    settingsService: ref.watch(settingsProvider.notifier),
  );
}

const kMinimumCredentialsTTL = Duration(hours: 1);

class AuthStateNotifierMobile extends StateNotifier<AuthState> implements AuthStateNotifier {
  AuthStateNotifierMobile({required FlutterAppAuth appAuth, required FlutterSecureStorage secureStorage, required SettingsService settingsService})
      : _appAuth = appAuth,
        _secureStorage = secureStorage,
        _settingsService = settingsService,
        super(const AuthState());

  final appAuthLock = Lock();
  final FlutterAppAuth _appAuth;
  final FlutterSecureStorage _secureStorage;
  final SettingsService _settingsService;

  Future<T> _syncAppAuth<T>(Future<T> Function() call) {
    return appAuthLock.synchronized(
      () => call(),
      timeout: const Duration(seconds: 10),
    );
  }

  @override
  Future<AuthState?> getExistingAndEnsureNotExpired() async {
    if (state.expiresAt == null || state.auth0AccessToken == null) {
      return null;
    }
    if (state.expiresAt!.difference(clock.now()) < kMinimumCredentialsTTL) {
      await _refresh();
    }
    if (state.expiresAt!.difference(clock.now()) < kMinimumCredentialsTTL) {
      throw Exception('Auth state is still expired after attempting to renew.');
    }
    return state;
  }

  @override
  Future<bool> load() async {
    final accessToken = await _secureStorage.read(key: SecureStorageKeys.accessToken);
    final idToken = await _secureStorage.read(key: SecureStorageKeys.idToken);

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
    if (expiry.difference(clock.now()) < kMinimumCredentialsTTL) {
      return await _refresh();
    }
    state = state.copyWith(
      auth0AccessToken: accessToken,
      idToken: idToken,
      user: _parseIdToken(idToken),
      expiresAt: expiry,
      signedOutManually: null,
    );
    return true;
  }

  @override
  Future<bool> forceRefresh() {
    return _refresh();
  }

  Future<bool> _refresh() async {
    final refreshToken = await _secureStorage.read(key: SecureStorageKeys.refreshToken);

    if (refreshToken == null) {
      return false;
    }

    final PackageInfo info = await PackageInfo.fromPlatform();
    try {
      final TokenResponse? result = await _syncAppAuth(
        () => _appAuth.token(
          TokenRequest(
            Env.auth0ClientId,
            '${info.packageName}://login-callback',
            issuer: 'https://${Env.auth0Domain}',
            refreshToken: refreshToken,
            additionalParameters: {'audience': Env.auth0Audience},
          ),
        ),
      );
      await _setStateBasedOnResponse(result!);
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
        _secureStorage.delete(key: SecureStorageKeys.refreshToken),
        _secureStorage.delete(key: SecureStorageKeys.accessToken),
        _secureStorage.delete(key: SecureStorageKeys.idToken),
      ],
    );
  }

  @override
  Future logout({bool manual = true}) async {
    await _clearCredentials();
    if (Platform.isAndroid && manual) {
      final PackageInfo info = await PackageInfo.fromPlatform();
      final url = Uri.https(
        Env.auth0Domain,
        '/v2/logout',
        {'client_id': Env.auth0ClientId, 'returnTo': '${info.packageName}://logout-callback'},
      );
      // Log out of auth0.
      // Couldn't get the callback url to work properly with iOS in-app-browser
      // And with externalApplication on iOS, the callback url doesn't open automatically,
      // the user has to click "Open".
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
    state = AuthState(signedOutManually: manual);
    if (FlavorConfig.current.enableNotifications) {
      FirebaseMessaging.instance.deleteToken();
    }
    RudderController.instance.reset();
    _settingsService.setAnalyticsId(null);
    _settingsService.refreshSessionId();

    return;
  }

  @override
  Future<bool> login({String? connection}) async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    try {
      var additionalParameters = {'audience': Env.auth0Audience};
      if (connection != null) {
        additionalParameters['connection'] = connection;
      }
      final authorizationTokenRequest = AuthorizationTokenRequest(
        Env.auth0ClientId,
        '${info.packageName}://login-callback',
        issuer: 'https://${Env.auth0Domain}',
        scopes: ['openid', 'profile', 'offline_access', 'church', 'country', 'email'],
        promptValues: state.signedOutManually == true ? ['login'] : null,
        additionalParameters: additionalParameters,
      );

      final AuthorizationTokenResponse? result = await _syncAppAuth(
        () => _appAuth.authorizeAndExchangeCode(authorizationTokenRequest),
      );

      await _setStateBasedOnResponse(result!, isLogin: true);
    } catch (e, st) {
      logout(manual: false);
      debugPrint(e.toString());
      FirebaseCrashlytics.instance.recordError(e, st);
      return false;
    }
    return true;
  }

  Future<void> _setStateBasedOnResponse(TokenResponse? result, {bool isLogin = false}) async {
    final accessToken = result?.accessToken;
    final idToken = result?.idToken;
    final refreshToken = result?.refreshToken;
    if (accessToken == null || idToken == null) {
      throw Exception([
        'Invalid token response',
        'result null: ${result == null}',
        'accessToken null: ${accessToken == null}',
        'idToken null: ${idToken == null}',
        'refreshToken null: ${refreshToken == null}'
      ]);
    }
    if (isLogin && refreshToken == null) {
      FirebaseCrashlytics.instance.recordError(Exception('Refresh token missing on login'), StackTrace.current);
    }

    await Future.wait([
      _secureStorage.write(
        key: SecureStorageKeys.idToken,
        value: idToken,
      ),
      _secureStorage.write(
        key: SecureStorageKeys.accessToken,
        value: accessToken,
      ),
      if (refreshToken != null)
        _secureStorage.write(
          key: SecureStorageKeys.refreshToken,
          value: refreshToken,
        ),
    ]);

    state = state.copyWith(
        auth0AccessToken: accessToken,
        idToken: idToken,
        user: _parseIdToken(idToken),
        expiresAt: _getAccessTokenExpiry(accessToken),
        signedOutManually: false);
  }
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
