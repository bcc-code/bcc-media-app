import 'package:bccm_core/design_system.dart';
import 'package:brunstadtv_app/components/onboarding/signup/signup_birthdate_page.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/theme/design_system/bccmedia/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../submodules/bccm_flutter/bccm_core/test/utils/basic_init.dart';

void main() {
  testWidgets('Signup year picker', (t) async {
    basicInit();
    final yearController = ValueNotifier<int?>(null);
    final focusNode = FocusNode();
    final page = PageController();
    await t.pumpWidget(DesignSystem(
      designSystem: BccMediaDesignSystem(),
      builder: (context) => MaterialApp(
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
      ),
    ));

    const minAge = 13;
    const maxAge = 150;
    await t.pumpAndSettle();

    await t.fling(
      find.byType(CupertinoPicker),
      const Offset(0, -10000),
      1000,
      warnIfMissed: true,
    );

    await t.drag(
      find.byType(CupertinoPicker),
      const Offset(0, -10000),
      warnIfMissed: true,
    );

    expect(yearController.value, DateTime.now().subtract(const Duration(days: 365 * minAge)).year);

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

    expect(yearController.value, DateTime.now().subtract(const Duration(days: 365 * maxAge)).year);
  });
}
