import 'package:brunstadtv_app/components/onboarding/signup/signup_birthdate_page.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/basic_init.dart';

void main() {
  testWidgets('Signup year picker', (t) async {
    basicInit();
    final yearController = TextEditingController();
    final focusNode = FocusNode();
    final page = PageController();
    await t.pumpWidget(MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: S.localizationsDelegates,
      home: Scaffold(
        body: SignupBirthDatePage(
          pageController: page,
          yearController: yearController,
          yearFocusNode: focusNode,
          onRegister: () => {},
        ),
      ),
    ));

    const minAge = 13;
    const maxAge = 150;

    await t.fling(
      find.byType(CupertinoPicker),
      const Offset(0, -10000),
      1000,
      warnIfMissed: false,
    );

    await t.drag(
      find.byType(CupertinoPicker),
      const Offset(0, -10000),
      warnIfMissed: false,
    );

    expect(yearController.text, DateTime.now().subtract(const Duration(days: 365 * minAge)).year.toString());

    await t.fling(
      find.byType(CupertinoPicker),
      const Offset(0, 10000),
      1000,
      warnIfMissed: false,
    );

    await t.drag(
      find.byType(CupertinoPicker),
      const Offset(0, 10000),
      warnIfMissed: false,
    );

    expect(yearController.text, DateTime.now().subtract(const Duration(days: 365 * maxAge)).year.toString());
  });
}
