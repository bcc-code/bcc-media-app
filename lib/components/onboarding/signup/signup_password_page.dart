import 'package:brunstadtv_app/components/onboarding/password_text_field.dart';
import 'package:brunstadtv_app/components/onboarding/onboarding_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/ui/btv_buttons.dart';
import 'package:brunstadtv_app/screens/onboarding/signup.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../helpers/analytics_constants.dart';
import '../../../l10n/app_localizations.dart';
import '../../../theme/bccm_typography.dart';

class Condition {
  Condition({required this.title, required this.fulfilled});

  final String title;
  final bool fulfilled;
}

List<Condition> getConditions(BuildContext context, String password) {
  return [
    Condition(
      title: S.of(context).passwordConditionLength(8),
      fulfilled: password.length >= 8,
    ),
    Condition(
      title: S.of(context).passwordConditionComplexity,
      fulfilled: RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).+$').hasMatch(password),
    ),
  ];
}

class SignupPasswordPage extends HookWidget implements SignupScreenPage {
  @override
  final String analyticsPageCode = AnalyticsPageCodes.signupPassword;

  const SignupPasswordPage({
    super.key,
    required this.pageController,
    required this.passwordTextController,
    required this.passwordFocusNode,
    required this.nextFocusNode,
  });

  final PageController pageController;
  final TextEditingController passwordTextController;
  final FocusNode passwordFocusNode;
  final FocusNode nextFocusNode;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    useListenable(passwordTextController);
    final formKey = useState(GlobalKey<FormState>());
    final conditions = getConditions(context, passwordTextController.text);

    void nextPage() {
      if (!conditions.every((c) => c.fulfilled)) return;
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
      passwordFocusNode.unfocus();
      nextFocusNode.requestFocus();
    }

    return OnboardingPageWrapper(
      title: S.of(context).setPassword,
      description: 'Choose a password for your account.',
      body: [
        const SizedBox(height: 48),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Choose a password',
            style: BccmTextStyles.caption1.copyWith(color: BccmColors.label2),
          ),
        ),
        Form(
          key: formKey.value,
          child: PasswordTextField(
            focusNode: passwordFocusNode,
            controller: passwordTextController,
            onEditingComplete: nextPage,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 18, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...conditions.map(
                (c) => Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: RichText(
                    text: TextSpan(
                      style: BccmTextStyles.caption1.copyWith(color: c.fulfilled ? BccmColors.tint3 : BccmColors.label3),
                      children: [
                        const WidgetSpan(child: SizedBox(width: 5)),
                        const TextSpan(text: '\u2022'),
                        const WidgetSpan(child: SizedBox(width: 5)),
                        TextSpan(
                          text: c.title,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      bottomArea: [
        Container(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: BtvButton.largeSecondary(
                      onPressed: () {
                        pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
                        passwordFocusNode.unfocus();
                      },
                      labelText: S.of(context).back,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: conditions.any((c) => !c.fulfilled)
                        ? BtvButton.largeDisabled(
                            onPressed: () {},
                            labelText: S.of(context).continueButton,
                          )
                        : BtvButton.large(
                            onPressed: nextPage,
                            labelText: S.of(context).continueButton,
                          ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
