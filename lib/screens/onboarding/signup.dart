import 'package:brunstadtv_app/api/auth0_api.dart';
import 'package:brunstadtv_app/components/onboarding/pages/signup_birthdate_page.dart';
import 'package:brunstadtv_app/components/onboarding/pages/signup_name_page.dart';
import 'package:brunstadtv_app/components/onboarding/pages/signup_verify_email_page.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/models/auth0/auth0_api.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/onboarding/pages/signup_initial_page.dart';
import '../../components/onboarding/pages/signup_password_page.dart';
import '../../l10n/app_localizations.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final emailTextController = useTextEditingController();
    final emailFocusNode = useFocusNode();
    final passwordTextController = useTextEditingController();
    final passwordFocusNode = useFocusNode();
    final firstNameController = useTextEditingController();
    final firstNameFocusNode = useFocusNode();
    final lastNameController = useTextEditingController();
    final lastNameFocusNode = useFocusNode();
    final monthController = useTextEditingController();
    final monthFocusNode = useFocusNode();
    final yearController = useTextEditingController();
    final yearFocusNode = useFocusNode();
    useListenable(emailFocusNode);
    List<Widget Function()> pages = [];

    Future onRegister() async {
      final response = await ref.read(auth0ApiProvider).signup(
            Auth0SignupRequestBody(
              clientId: Env.auth0ClientId,
              email: emailTextController.value.text,
              password: passwordTextController.value.text,
              givenName: firstNameController.value.text,
              familyName: lastNameController.value.text,
              userMetadata: {'birth_month': monthController.value.text, 'birth_year': yearController.value.text},
              connection: Env.auth0SignupConnection,
            ),
          );
      if (response?.emailVerified != true) {
        pageController.animateToPage(
          pages.indexWhere((build) => build() is SignupVerifyEmailPage),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutExpo,
        );
      }
    }

    pages = [
      () => SignupInitialPage(
            pageController: pageController,
            emailTextController: emailTextController,
            emailFocusNode: emailFocusNode,
            nextFocusNode: passwordFocusNode,
          ),
      () => SignupPasswordPage(
            pageController: pageController,
            passwordTextController: passwordTextController,
            passwordFocusNode: passwordFocusNode,
            nextFocusNode: firstNameFocusNode,
          ),
      () => SignupNamePage(
            pageController: pageController,
            firstNameController: firstNameController,
            firstNameFocusNode: firstNameFocusNode,
            lastNameController: lastNameController,
            lastNameFocusNode: lastNameFocusNode,
            nextFocusNode: monthFocusNode,
          ),
      () => SignupBirthDatePage(
            pageController: pageController,
            monthController: monthController,
            monthFocusNode: monthFocusNode,
            yearController: yearController,
            yearFocusNode: yearFocusNode,
            onRegister: onRegister,
          ),
      () => SignupVerifyEmailPage(
            pageController: pageController,
            emailTextController: emailTextController,
          ),
    ];

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 44,
          leadingWidth: 92,
          title: AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            reverseDuration: Duration.zero,
            child: !emailFocusNode.hasFocus ? null : Text(S.of(context).signUpTitle),
          ),
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.maybePop(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 12),
              child: Text(
                S.of(context).cancel,
              ),
            ),
          ),
        ),
        body: PageView.builder(
          controller: pageController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return pages[index]();
          },
        ),
      ),
    );
  }
}
