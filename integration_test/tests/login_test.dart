import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import '../common/context.dart';
import '../common/exceptions.dart';
import '../common/login.dart';
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
      await ensureLoggedOut();
      await $.tester.runAsync(prod.main);
      await $.tester.pumpAndSettle();

      final context = getContext();
      await $.login(context);

      $.ignoreExceptions();
      await $.tester.pumpAndSettle();
      $.ignoreExceptions();

      expect($(WidgetKeys.liveTabButton), findsOneWidget);
    },
  );
}
