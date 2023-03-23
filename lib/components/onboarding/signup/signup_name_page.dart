import 'package:brunstadtv_app/components/onboarding/onboarding_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/analytics_constants.dart';
import '../../../helpers/ui/btv_buttons.dart';
import '../../../helpers/ui/svg_icons.dart';
import '../../../l10n/app_localizations.dart';
import '../../../screens/onboarding/signup.dart';
import '../../../theme/bccm_colors.dart';
import '../../../theme/bccm_input_decorations.dart';
import '../../../theme/bccm_typography.dart';

class SignupNamePage extends HookWidget implements SignupScreenPage {
  @override
  final String analyticsPageCode = AnalyticsPageCodes.signupName;

  const SignupNamePage({
    super.key,
    required this.pageController,
    required this.firstNameController,
    required this.firstNameFocusNode,
    required this.lastNameController,
    required this.lastNameFocusNode,
    required this.nextFocusNode,
  });

  final PageController pageController;
  final TextEditingController firstNameController;
  final FocusNode firstNameFocusNode;
  final TextEditingController lastNameController;
  final FocusNode lastNameFocusNode;
  final FocusNode nextFocusNode;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    useListenable(firstNameController);
    useListenable(lastNameController);
    final formKey = useState(GlobalKey<FormState>());

    nextPage() {
      if (!formKey.value.currentState!.validate()) {
        return;
      }
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
      nextFocusNode.requestFocus();
    }

    return Form(
      key: formKey.value,
      child: OnboardingPageWrapper(
        title: 'Your name',
        description: "What's your name?",
        body: [
          Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 10),
            child: Text(
              'First name',
              style: BccmTextStyles.caption1.copyWith(color: BccmColors.label2),
            ),
          ),
          TextFormField(
            autofillHints: const [AutofillHints.givenName],
            controller: firstNameController,
            focusNode: firstNameFocusNode,
            autovalidateMode: AutovalidateMode.disabled,
            style: BccmTextStyles.body2.copyWith(color: BccmColors.label1),
            cursorColor: BccmColors.tint1,
            cursorWidth: 1,
            decoration: BccmInputDecorations.textFormField.copyWith(hintText: 'Type in first name'),
            onEditingComplete: () => lastNameFocusNode.requestFocus(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 10),
            child: Text(
              'Last name',
              style: BccmTextStyles.caption1.copyWith(color: BccmColors.label2),
            ),
          ),
          TextFormField(
            autofillHints: const [AutofillHints.familyName],
            controller: lastNameController,
            focusNode: lastNameFocusNode,
            autovalidateMode: AutovalidateMode.disabled,
            style: BccmTextStyles.body2.copyWith(color: BccmColors.label1),
            cursorColor: BccmColors.tint1,
            cursorWidth: 1,
            decoration: BccmInputDecorations.textFormField.copyWith(hintText: 'Type in last name'),
            onEditingComplete: nextPage,
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
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        labelText: S.of(context).back,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: firstNameController.value.text.isBlank || lastNameController.value.text.isBlank
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
      ),
    );
  }
}
