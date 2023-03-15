import 'package:brunstadtv_app/env/prod/firebase_options.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/auth_state/implementations/auth_state_notifier_mobile.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mockito/mockito.dart';
import 'package:patrol/patrol.dart';
import '../../test/auth/auth_test.mocks.dart';
import '../common/context.dart';
import '../common/login.dart';

import 'package:clock/clock.dart';
/* 
// Fake class
class FakeCat extends MockFlutterAppAuth {
  /// For exchanging tokens
  @override
  Future<TokenResponse?> login(TokenRequest? request) async {
    return ;
  }
} */

void main() {
  patrolTest(
    'login and ensure live tab',
    nativeAutomatorConfig: const NativeAutomatorConfig(
      packageName: 'tv.brunstad.app',
      bundleId: 'tv.brunstad.app',
    ),
    nativeAutomation: true,
    ($) async {
      await ensureLoggedOut();
      var time = DateTime.now();
      var auth = MockFlutterAppAuth();
      when(auth.authorizeAndExchangeCode(any))
          .thenAnswer((realInvocation) => const FlutterAppAuth().authorizeAndExchangeCode(realInvocation.positionalArguments[0]));
      await withClock(Clock(() => time), () async {
        await $main(
          firebaseOptions: DefaultFirebaseOptions.currentPlatform,
          providerOverrides: [
            authStateProvider.overrideWith((ref) => AuthStateNotifierMobile(appAuth: auth, secureStorage: const FlutterSecureStorage())),
          ],
        );
      });
      await $.tester.pumpAndSettle();

      final context = getContext();
      await $.login(context);
      /* verify(auth.token(any)).called(0);
      time = DateTime.now().add(Duration(hours: 24));
      $(WidgetKeys.liveTabButton).tap();

      verify(auth.token(any)).called(greaterThan(1)); */
    },
  );
}
