import 'package:brunstadtv_app/components/onboarding/onboarding_page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as html_dom;
import 'package:html/parser.dart' as html_parser;
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../helpers/analytics.dart';
import '../../../helpers/widget_keys.dart';
import '../../../l10n/app_localizations.dart';
import '../../../l10n/app_localizations_en.dart';
import '../../../screens/onboarding/signup.dart';
import '../../../theme/design_system/design_system.dart';

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
                    alignment: Alignment.center,
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

class _PrivacyPolicyAgreeText extends StatelessWidget {
  const _PrivacyPolicyAgreeText();

  html_dom.DocumentFragment getValidatedAndParsedLocalization(BuildContext context) {
    final localized = html_parser.parseFragment(S.of(context).signUpAgreePrivacyPolicy);
    final anchors = localized.querySelectorAll('a');
    if (anchors.length == 2) {
      return localized;
    }
    return html_parser.parseFragment(SEn().signUpAgreePrivacyPolicy);
  }

  @override
  Widget build(BuildContext context) {
    final document = getValidatedAndParsedLocalization(context);
    final anchors = document.querySelectorAll('a');
    anchors[0].attributes['href'] = 'https://bcc.media/${Intl.defaultLocale}/privacy';
    anchors[1].attributes['href'] = 'https://bcc.media/${Intl.defaultLocale}/terms-of-use';
    final design = DesignSystem.of(context);
    return Html(
      data: '<p>${document.outerHtml}</p>',
      onAnchorTap: (url, context, attributes, element) => launchUrlString(url!, mode: LaunchMode.externalApplication),
      shrinkWrap: true,
      style: {
        'p': Style(
          fontSize: FontSize(design.textStyles.caption1.fontSize!),
          color: design.colors.label4,
          margin: Margins.only(bottom: 12),
        ),
        'a': Style(
          color: design.colors.tint1,
        ),
      },
    );
  }
}
