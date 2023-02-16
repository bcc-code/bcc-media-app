import 'package:brunstadtv_app/env/env.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart';

import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:url_launcher/url_launcher.dart';
import '../env/test_environment.dart';
import 'exceptions.dart';

Future ensureLoggedOut() async {
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
}

extension LoginExtension on PatrolTester {
  Future login(BuildContext context) async {
    final $ = this;
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

    $.ignoreExceptions();
    await $.tester.pumpAndSettle();
    $.ignoreExceptions();

    expect($(WidgetKeys.liveTabButton), findsOneWidget);
  }
}
