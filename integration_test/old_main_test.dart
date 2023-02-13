import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/section_item_click_wrapper.dart';
import 'package:brunstadtv_app/helpers/navigation_utils.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:brunstadtv_app/main_prod.dart' as prod;
import 'package:integration_test/integration_test.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Open home', (tester) async {
      await prod.main();
      await tester.pumpAndSettle();

      final context = navigatorKey.currentContext;
      if (context == null) {
        throw Exception('Context was null');
      }

      // Finds the floating action button to tap on.
      final explore = find.text(S.of(context).exploreContent);
      await tester.tap(explore);
      await tester.pumpAndSettle();

      expect(find.text(S.of(context).homeTab), findsOneWidget);
    });

    testWidgets('Click on episode', (tester) async {
      //await tester.restoreFrom(TestRestorationData.empty);
      await prod.main();
      await tester.pumpAndSettle();

      final context = navigatorKey.currentContext;
      if (context == null) {
        throw Exception('Context was null');
      }

      context.router.navigateNamedFromRoot('/');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SectionItemClickWrapper).first);
      await tester.pumpAndSettle();
      debugPrint(context.router.currentUrl);
      assert(context.router.currentUrl.startsWith('/episode'));
    });
  });
}
