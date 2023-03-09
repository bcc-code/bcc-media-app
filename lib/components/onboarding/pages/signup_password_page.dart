import 'package:brunstadtv_app/components/onboarding/password_text_field.dart';
import 'package:brunstadtv_app/components/onboarding/signup_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/ui/btv_buttons.dart';
import 'package:brunstadtv_app/l10n/app_localizations_en.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../helpers/widget_keys.dart';
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

class SignupPasswordPage extends HookWidget {
  const SignupPasswordPage({
    super.key,
    required this.pageController,
    required this.passwordTextController,
    required this.passwordFocusNode,
  });

  final PageController pageController;
  final TextEditingController passwordTextController;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    useListenable(passwordTextController);
    final privacyPolicyAgreed = useState(false);
    final formKey = useState(GlobalKey<FormState>());
    final conditions = getConditions(context, passwordTextController.text);

    return SignupPageWrapper(
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
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
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
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 1,
                    child: Switch.adaptive(
                      key: WidgetKeys.privacyPolicyAgreeSwitch,
                      activeColor: Platform.isIOS ? BccmColors.tint1 : null,
                      value: privacyPolicyAgreed.value,
                      onChanged: (value) => privacyPolicyAgreed.value = value,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: _PrivacyPolicyAgreeText())
                ],
              ),
              const SizedBox(height: 12),
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
                    child: conditions.any((c) => !c.fulfilled) || !privacyPolicyAgreed.value
                        ? BtvButton.largeDisabled(
                            key: WidgetKeys.registerButton,
                            onPressed: () {},
                            labelText: S.of(context).registerButton,
                          )
                        : BtvButton.large(
                            key: WidgetKeys.registerButton,
                            onPressed: () {
                              pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
                              passwordFocusNode.unfocus();
                            },
                            labelText: S.of(context).registerButton,
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

class _PrivacyPolicyAgreeText extends StatelessWidget {
  const _PrivacyPolicyAgreeText();

  @override
  Widget build(BuildContext context) {
    final textParts = RegExp(r'(?<start>.+)<a>(?<link>.+)<\/a>(?<end>.+)');
    var match = textParts.firstMatch(S.of(context).signUpAgreePrivacyPolicy);
    match ??= textParts.firstMatch(SEn().signUpAgreePrivacyPolicy)!;
    match.namedGroup('start');
    return RichText(
      softWrap: true,
      text: TextSpan(style: BccmTextStyles.caption1.copyWith(color: BccmColors.label4), children: [
        TextSpan(text: match.namedGroup('start')),
        TextSpan(
          text: match.namedGroup('link'),
          style: BccmTextStyles.caption1.copyWith(
            color: BccmColors.tint1,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrlString(
                'https://bcc.media/privacy',
                mode: LaunchMode.externalApplication,
              );
            },
        ),
        TextSpan(text: match.namedGroup('end')),
      ]),
    );
  }
}
