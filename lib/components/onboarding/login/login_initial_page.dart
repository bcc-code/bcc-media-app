import 'package:brunstadtv_app/components/onboarding/onboarding_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/screens/onboarding/social_auth_buttons.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../l10n/app_localizations.dart';

import '../email_text_field.dart';

class LoginInitialPage extends HookWidget {
  const LoginInitialPage({
    super.key,
    required this.pageController,
    required this.onLogin,
    required this.emailTextController,
    required this.emailFocusNode,
    required this.passwordTextController,
    required this.passwordFocusNode,
  });

  final PageController pageController;
  final void Function() onLogin;
  final TextEditingController emailTextController;
  final FocusNode emailFocusNode;
  final TextEditingController passwordTextController;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    useListenable(emailFocusNode);
    useListenable(emailTextController);
    final formKey = useState(GlobalKey<FormState>());
    nextPage() {
      if (!formKey.value.currentState!.validate()) {
        return;
      }
      onLogin();
    }

    final design = DesignSystem.of(context);
    return OnboardingPageWrapper(
      body: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            reverseDuration: Duration.zero,
            child: emailFocusNode.hasFocus ? null : Text(S.of(context).signUpTitle, style: design.textStyles.headline1),
          ),
        ),
        Text(
          S.of(context).signUpDescription,
          style: design.textStyles.body1.copyWith(color: design.colors.label3),
        ),
        const SizedBox(height: 48),
        Center(child: SocialAuthButtons()),
        const SizedBox(height: 24),
        Center(
          child: Text(
            'or'.toUpperCase(),
            style: design.textStyles.overline.copyWith(color: design.colors.label1),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Register with email address',
            style: design.textStyles.caption1.copyWith(color: design.colors.label2),
          ),
        ),
        Form(
          key: formKey.value,
          child: EmailTextField(
            emailFocusNode: emailFocusNode,
            emailTextController: emailTextController,
            onEditingComplete: nextPage,
          ),
        )
      ],
      bottomArea: [
        Container(
          padding: const EdgeInsets.only(bottom: 16),
          width: double.infinity,
          child: design.buttons.large(
            disabled: emailTextController.value.text.isBlank || passwordTextController.value.text.isBlank,
            onPressed: nextPage,
            labelText: S.of(context).continueButton,
          ),
        )
      ],
    );
  }
}
