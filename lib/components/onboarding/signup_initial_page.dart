import 'package:brunstadtv_app/components/onboarding/signup_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/ui/btv_buttons.dart';
import 'package:brunstadtv_app/screens/onboarding/social_auth_buttons.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/bccm_typography.dart';
import 'email_text_field.dart';

class SignupInitialPage extends HookWidget {
  const SignupInitialPage(
      {super.key, required this.pageController, required this.emailTextController, required this.emailFocusNode, required this.passwordFocusNode});

  final PageController pageController;
  final TextEditingController emailTextController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    useListenable(emailFocusNode);
    useListenable(emailTextController);
    final formKey = useState(GlobalKey<FormState>());
    return SignupPageWrapper(
      bottomArea: [
        Container(
          padding: const EdgeInsets.only(bottom: 16),
          width: double.infinity,
          child: emailTextController.value.text == ''
              ? BtvButton.largeDisabled(
                  onPressed: () {},
                  labelText: S.of(context).continueButton,
                )
              : BtvButton.large(
                  onPressed: () {
                    if (!formKey.value.currentState!.validate()) {
                      return;
                    }
                    pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
                    passwordFocusNode.requestFocus();
                  },
                  labelText: S.of(context).continueButton,
                ),
        )
      ],
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            reverseDuration: Duration.zero,
            child: emailFocusNode.hasFocus ? null : Text(S.of(context).signUpTitle, style: BccmTextStyles.headline1),
          ),
        ),
        Text(
          S.of(context).signUpDescription,
          style: BccmTextStyles.body1.copyWith(color: BccmColors.label3),
        ),
        const SizedBox(height: 48),
        const Center(child: SocialAuthButtons()),
        const SizedBox(height: 24),
        Center(
          child: Text(
            'or'.toUpperCase(),
            style: BccmTextStyles.overline.copyWith(color: BccmColors.label1),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Register with email address',
            style: BccmTextStyles.caption1.copyWith(color: BccmColors.label2),
          ),
        ),
        Form(
          key: formKey.value,
          child: EmailTextField(
            emailFocusNode: emailFocusNode,
            emailTextController: emailTextController,
          ),
        )
      ],
    );
  }
}
