import 'package:brunstadtv_app/components/onboarding/onboarding_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../helpers/analytics_constants.dart';
import '../../../l10n/app_localizations.dart';
import '../../../screens/onboarding/signup.dart';
import '../../../theme/design_system/design_system.dart';

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
      FocusManager.instance.primaryFocus?.unfocus();
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
      nextFocusNode.requestFocus();
    }

    final design = DesignSystem.of(context);
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
              style: design.textStyles.caption1.copyWith(color: design.colors.label2),
            ),
          ),
          TextFormField(
            autofocus: true,
            autofillHints: const [AutofillHints.givenName],
            controller: firstNameController,
            focusNode: firstNameFocusNode,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.disabled,
            style: design.textStyles.body2.copyWith(color: design.colors.label1),
            cursorColor: design.colors.tint1,
            cursorWidth: 1,
            validator: (val) => val?.isNotEmpty == true ? null : 'Required',
            decoration: design.inputDecorations.textFormField.copyWith(hintText: 'Type in first name'),
            onEditingComplete: () => lastNameFocusNode.requestFocus(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 10),
            child: Text(
              'Last name',
              style: design.textStyles.caption1.copyWith(color: design.colors.label2),
            ),
          ),
          TextFormField(
            autofillHints: const [AutofillHints.familyName],
            controller: lastNameController,
            focusNode: lastNameFocusNode,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.disabled,
            style: design.textStyles.body2.copyWith(color: design.colors.label1),
            cursorColor: design.colors.tint1,
            cursorWidth: 1,
            validator: (val) => val?.isNotEmpty == true ? null : 'Required',
            decoration: design.inputDecorations.textFormField.copyWith(hintText: 'Type in last name'),
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
                        disabled: firstNameController.value.text.isBlank || lastNameController.value.text.isBlank,
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
