import 'package:brunstadtv_app/components/onboarding/onboarding_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../helpers/analytics_constants.dart';
import '../../../helpers/ui/btv_buttons.dart';
import '../../../helpers/widget_keys.dart';
import '../../../l10n/app_localizations.dart';
import '../../../l10n/app_localizations_en.dart';
import '../../../screens/onboarding/signup.dart';
import '../../../theme/bccm_colors.dart';
import '../../../theme/bccm_typography.dart';
import '../birth_year_picker.dart';

class SignupBirthDatePage extends HookWidget implements SignupScreenPage {
  @override
  final String analyticsPageCode = AnalyticsPageCodes.signupBirthdate;

  const SignupBirthDatePage({
    super.key,
    required this.pageController,
    required this.yearController,
    required this.yearFocusNode,
    required this.onRegister,
  });

  final PageController pageController;
  final TextEditingController yearController;
  final FocusNode yearFocusNode;
  final void Function() onRegister;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    useListenable(yearController);
    final formKey = useState(GlobalKey<FormState>());
    final privacyPolicyAgreed = useState(false);

    nextPage() {
      if (!formKey.value.currentState!.validate() || !privacyPolicyAgreed.value) {
        return;
      }
      FocusManager.instance.primaryFocus?.unfocus();
      onRegister();
    }

    return Form(
      key: formKey.value,
      child: OnboardingPageWrapper(
        title: 'Birth date',
        description: 'We use your birth date to give you a more tailored experience.',
        body: [
          Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 10),
            child: Text(
              'Birth year',
              style: BccmTextStyles.caption1.copyWith(color: BccmColors.label2),
            ),
          ),
          SizedBox(
            height: 150,
            child: BirthYearPicker(
              onSelectedYearChanged: (year) {
                yearController.value = TextEditingValue(text: year.toString());
              },
            ),
          ),
          const Spacer(),
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
        ],
        bottomArea: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: BtvButton.largeSecondary(
                    onPressed: () {
                      pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    labelText: S.of(context).back,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: yearController.value.text.isBlank || !privacyPolicyAgreed.value
                      ? BtvButton.largeDisabled(
                          key: WidgetKeys.registerButton,
                          onPressed: () {},
                          labelText: S.of(context).registerButton,
                        )
                      : BtvButton.large(
                          key: WidgetKeys.registerButton,
                          onPressed: nextPage,
                          labelText: S.of(context).registerButton,
                        ),
                )
              ],
            ),
          ),
        ],
      ),
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
