import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/onboarding/onboarding_page_wrapper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../helpers/analytics.dart';
import '../../../helpers/widget_keys.dart';
import '../../../l10n/app_localizations.dart';
import '../../../screens/onboarding/signup.dart';
import 'package:bccm_core/design_system.dart';

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
  final ValueNotifier<int?> yearController;
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

    final design = DesignSystem.of(context);
    return Form(
      key: formKey.value,
      child: OnboardingPageWrapper(
        title: 'Year of birth',
        description: 'We use your birth year to improve the user experience.',
        body: [
          Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 10),
            child: Text(
              'Birth year',
              style: design.textStyles.caption1.copyWith(color: design.colors.label2),
            ),
          ),
          SizedBox(
            height: 250,
            child: BirthYearPicker(
              focusNode: yearFocusNode,
              onSelectedYearChanged: (year) {
                yearController.value = year;
              },
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => privacyPolicyAgreed.value = !privacyPolicyAgreed.value,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Switch.adaptive(
                  key: WidgetKeys.privacyPolicyAgreeSwitch,
                  activeColor: Platform.isIOS ? design.colors.tint1 : null,
                  value: privacyPolicyAgreed.value,
                  onChanged: (value) => privacyPolicyAgreed.value = value,
                ),
                SizedBox(width: Platform.isAndroid ? 0 : 6),
                Expanded(
                  child: Container(
                    height: 75,
                    alignment: Alignment.centerLeft,
                    child: const _PrivacyPolicyAgreeText(),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
        bottomArea: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: design.buttons.large(
                    variant: ButtonVariant.secondary,
                    onPressed: () {
                      pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    labelText: S.of(context).back,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: design.buttons.large(
                    disabled: yearController.value == null || !privacyPolicyAgreed.value,
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

class _PrivacyPolicyAgreeText extends ConsumerWidget {
  const _PrivacyPolicyAgreeText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privacyLink = 'https://bcc.media/${Intl.defaultLocale}/privacy';
    final termsLink = 'https://bcc.media/${Intl.defaultLocale}/terms-of-use';

    final text = S.of(context).signUpAgreePrivacyPolicy;
    final parts = text.split(RegExp('<a>|</a>'));

    final design = DesignSystem.of(context);
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: parts[0], style: design.textStyles.body1),
          TextSpan(
            text: parts[1],
            style: design.textStyles.body1.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ref.read(analyticsProvider).interaction(const InteractionEvent(
                      interaction: 'privacy_policy_clicked',
                      pageCode: 'signup',
                    ));
                launchUrlString(privacyLink);
              },
          ),
          TextSpan(text: parts[2], style: design.textStyles.body1),
          TextSpan(
            text: parts[3],
            style: design.textStyles.body1.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ref.read(analyticsProvider).interaction(const InteractionEvent(
                      interaction: 'terms_of_use_clicked',
                      pageCode: 'signup',
                    ));
                launchUrlString(termsLink);
              },
          ),
          TextSpan(text: parts[4], style: design.textStyles.body1),
        ],
      ),
    );
  }
}
