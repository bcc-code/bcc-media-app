import 'package:brunstadtv_app/components/onboarding/signup/signup_password_page.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/theme/design_system/bcc_media/design_system.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/basic_init.dart';

void main() {
  group('Signup tests', () {
    testWidgets('Password conditions', (t) async {
      bool Function(Widget) richTextWithColor(String text, Color color) => (Widget w) {
            return w is RichText && w.text.toPlainText().contains(text) && w.text.style?.color == color;
          };

      final ds = BccMediaDesignSystem();
      void expectNeutral(String condition) => expect(find.byWidgetPredicate(richTextWithColor(condition, ds.colors.label3)), findsOneWidget);
      void expectSuccess(String condition) => expect(find.byWidgetPredicate(richTextWithColor(condition, ds.colors.tint3)), findsOneWidget);

      basicInit();
      final passwordController = TextEditingController();
      final focusNode = FocusNode();
      final page = PageController();
      await t.pumpWidget(DesignSystem(
        designSystem: ds,
        child: (context) => MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: S.localizationsDelegates,
          home: Scaffold(
            body: SignupPasswordPage(
              pageController: page,
              passwordTextController: passwordController,
              passwordFocusNode: focusNode,
              nextFocusNode: FocusNode(),
            ),
          ),
        ),
      ));

      await t.pumpAndSettle();
      expectNeutral('Minimum 8 characters');
      expectNeutral('Must contain lower case, uppercase and numbers.');

      passwordController.value = const TextEditingValue(text: '');
      await t.pumpAndSettle();
      expectNeutral('Minimum 8 characters');
      expectNeutral('Must contain lower case, uppercase and numbers.');

      passwordController.value = const TextEditingValue(text: 'pAss1');
      await t.pumpAndSettle();
      expectNeutral('Minimum 8 characters');
      expectSuccess('Must contain lower case, uppercase and numbers.');

      passwordController.value = const TextEditingValue(text: 'passord123');
      await t.pumpAndSettle();
      expectSuccess('Minimum 8 characters');
      expectNeutral('Must contain lower case, uppercase and numbers.');

      passwordController.value = const TextEditingValue(text: 'PASSORD123');
      await t.pumpAndSettle();
      expectSuccess('Minimum 8 characters');
      expectNeutral('Must contain lower case, uppercase and numbers.');
      passwordController.value = const TextEditingValue(text: 'pass word');
      await t.pumpAndSettle();
      expectSuccess('Minimum 8 characters');
      expectNeutral('Must contain lower case, uppercase and numbers.');

      passwordController.value = const TextEditingValue(text: 'Passord123');
      await t.pumpAndSettle();
      expectSuccess('Minimum 8 characters');
      expectSuccess('Must contain lower case, uppercase and numbers.');

      passwordController.value = const TextEditingValue(text: 'Passord12312a312  3123123c =!()"/(#&("!)=_\\\\)');
      await t.pumpAndSettle();
      expectSuccess('Minimum 8 characters');
      expectSuccess('Must contain lower case, uppercase and numbers.');
    });
  });
}
