// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';

import '../utils/tokens.dart';
@GenerateNiceMocks([
  MockSpec<FlutterAppAuth>(),
  MockSpec<FlutterSecureStorage>(),
])
import 'auth_test.mocks.dart';
import '../utils/basic_init.dart';

class MockTokenRequest extends Mock implements TokenRequest {}

void main() {
  group('Authentication', () {
    test('Refresh when old', () async {
      basicInit();
      final secureStorage = MockFlutterSecureStorage();
      when(secureStorage.read(key: SecureStorageKeys.refreshToken)).thenAnswer((_) async => 'refresh token');

      final customExpiry = DateTime.now().add(const Duration(days: 5));
      final tomorrowEpoch = (customExpiry.millisecondsSinceEpoch / 1000).round();
      final fakeAccessTokenJwt =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.${base64UrlEncode(utf8.encode('{"exp": $tomorrowEpoch}'))}.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

      final mockAppAuth = MockFlutterAppAuth();
      when(mockAppAuth.token(any)).thenAnswer((_) async => TokenResponse(
            fakeAccessTokenJwt,
            fakeAccessTokenJwt,
            customExpiry,
            fakeIdTokenJwt,
            'tokenType',
            null,
            null,
          ));

      final auth = AuthStateNotifier(mockAppAuth, secureStorage);
      auth.state = AuthState(
        auth0AccessToken: 'something',
        expiresAt: DateTime.now(),
      );

      await auth.getExistingAndEnsureNotExpired();
      verify(mockAppAuth.token(any)).called(1);
    });
  });
}
