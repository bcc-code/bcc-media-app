// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:bccm_player/playback_service_interface.dart';
import 'package:brunstadtv_app/app_root.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/models/auth_state.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/auth_state/implementations/auth_state_notifier_mobile.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/router/special_routes_guard.dart';
import 'package:brunstadtv_app/services/playback_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';

import '../utils/tokens.dart';
@GenerateNiceMocks([
  MockSpec<PlaybackPlatformInterface>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<Analytics>(onMissingStub: OnMissingStub.returnDefault),
])
import 'episode_test.mocks.dart';
import '../utils/basic_init.dart';

class MockTokenRequest extends Mock implements TokenRequest {}

void main() {
  group('Test', () {
    testWidgets('test', (t) async {
      basicInit();
      final appRouter = AppRouter(specialRoutesGuard: SpecialRoutesGuard(), navigatorKey: navigatorKey);
      await t.pumpWidget(ProviderScope(
        overrides: [
          playbackApiProvider.overrideWithValue(MockPlaybackPlatformInterface()),
          analyticsProvider.overrideWithValue(MockAnalytics()),
        ],
        child: AppRoot(
          navigatorKey: navigatorKey,
          appRouter: appRouter,
          routerDelegate: appRouter.delegate(),
        ),
      ));
      await t.pumpAndSettle();
      debugDumpApp();
      expect(find.text('Explore'), findsOneWidget);
    });
  });
}
