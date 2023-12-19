// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/src/features/auth/implementations/auth_state_notifier_mobile.dart';
import 'package:bccm_core/src/utils/constants.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';

import '../../test/utils/tokens.dart';
@GenerateNiceMocks([
  MockSpec<FlutterAppAuth>(),
  MockSpec<FlutterSecureStorage>(),
  MockSpec<Auth0Api>(),
])
import 'auth_test.mocks.dart';
import '../../test/utils/basic_init.dart';

class MockTokenRequest extends Mock implements TokenRequest {}

TokenResponse mockTokenResponse({required DateTime expiresAt}) {
  final tomorrowEpoch = (expiresAt.millisecondsSinceEpoch / 1000).round();
  final fakeAccessTokenJwt =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.${base64UrlEncode(utf8.encode('{"exp": $tomorrowEpoch}'))}.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

  return TokenResponse(
    fakeAccessTokenJwt,
    fakeAccessTokenJwt,
    expiresAt,
    fakeIdTokenJwt,
    'tokenType',
    null,
    null,
  );
}

void main() {
  group('Mobile authentication (AuthStateNotifierMobile)', () {
    test('Dont refresh when not old', () async {
      basicInit();
      final secureStorage = MockFlutterSecureStorage();
      when(secureStorage.read(key: SecureStorageKeys.refreshToken)).thenAnswer((_) async => 'refresh token');

      final mockAppAuth = MockFlutterAppAuth();

      final auth = AuthStateNotifierMobile(
        appAuth: MockFlutterAppAuth(),
        secureStorage: secureStorage,
        config: AuthConfig(
          auth0Audience: 'audience',
          auth0ClientId: 'clientId',
          auth0Domain: 'domain',
          scopes: ['scope'],
          isTv: false,
        ),
      );
      auth.state = AuthState(
        auth0AccessToken: 'something',
        expiresAt: DateTime.now().add(const Duration(days: 1)),
      );

      final response = await auth.getExistingAndEnsureNotExpired();
      verifyNever(mockAppAuth.token(any));
      assert(response?.auth0AccessToken == 'something', 'Access token must be the same  value');
    });
    test('Refresh when old', () async {
      basicInit();
      final secureStorage = MockFlutterSecureStorage();
      when(secureStorage.read(key: SecureStorageKeys.refreshToken)).thenAnswer((_) async => 'refresh token');

      final mockAppAuth = MockFlutterAppAuth();
      when(mockAppAuth.token(any)).thenAnswer((_) async => mockTokenResponse(expiresAt: DateTime.now().add(const Duration(days: 1))));

      final auth = AuthStateNotifierMobile(
        appAuth: mockAppAuth,
        secureStorage: secureStorage,
        config: AuthConfig(
          auth0Audience: 'audience',
          auth0ClientId: 'clientId',
          auth0Domain: 'domain',
          scopes: ['scope'],
          isTv: false,
        ),
      );
      auth.state = AuthState(
        auth0AccessToken: 'something',
        expiresAt: DateTime.now(),
      );

      await auth.getExistingAndEnsureNotExpired();
      verify(mockAppAuth.token(any)).called(1);
    });
  });
}
