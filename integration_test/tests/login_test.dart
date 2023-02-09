import 'dart:io';

import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:patrol/patrol.dart';
import 'package:url_launcher/url_launcher.dart';
import '../env/test_environment.dart';
import 'package:brunstadtv_app/main_prod.dart' as prod;

void main() {
  patrolTest(
    'login and ensure live tab',
    nativeAutomatorConfig: const NativeAutomatorConfig(
      packageName: 'tv.brunstad.app',
      bundleId: 'tv.brunstad.app',
    ),
    nativeAutomation: true,
    ($) async {
      if (Platform.isAndroid) {
        final PackageInfo info = await PackageInfo.fromPlatform();
        final url = Uri.https(
          Env.auth0Domain,
          '/v2/logout',
          {'client_id': Env.auth0ClientId, 'returnTo': '${info.packageName}://logout-callback'},
        );
        debugPrint(info.packageName);
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
      await Future.delayed(const Duration(seconds: 5));
      await const FlutterSecureStorage().deleteAll();
      await $.tester.runAsync(prod.main);
      await $.tester.pumpAndSettle();

      final context = navigatorKey.currentContext;
      if (context == null) {
        throw Exception('Context was null');
      }
      expect($(WidgetKeys.signInButton), findsOneWidget);
      await $(WidgetKeys.signInButton).$(GestureDetector).tap();
      await Future.delayed(const Duration(seconds: 5));
      if (Platform.isIOS || Platform.isMacOS) {
        try {
          await $.native.tap(Selector(text: 'Fortsett'));
        } catch (e) {
          debugPrint(e.toString());
        }
      }
      await $.native.enterTextByIndex(TestEnvironment.loginEmail, index: 0);
      await $.native.enterTextByIndex(TestEnvironment.loginPassword, index: 1);
      await $.native.tap(Selector(textContains: 'Log In'));

      await $.tester.runAsync(() async => await Future.delayed(const Duration(seconds: 5)));

      var exceptionCount = 0;
      dynamic exception = $.tester.takeException();
      while (exception != null) {
        exceptionCount++;
        exception = $.tester.takeException();
      }
      if (exceptionCount != 0) {
        debugPrint('Warning: $exceptionCount exceptions were ignored');
      }

      expect($(WidgetKeys.liveTabButton), findsOneWidget);
    },
  );
}
