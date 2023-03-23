import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/auth0_api.dart';
import 'package:brunstadtv_app/components/onboarding/signup/signup_birthdate_page.dart';
import 'package:brunstadtv_app/components/onboarding/signup/signup_done_page.dart';
import 'package:brunstadtv_app/components/onboarding/signup/signup_name_page.dart';
import 'package:brunstadtv_app/components/onboarding/signup/signup_verify_email_page.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/models/auth0/auth0_api.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/onboarding/signup/signup_initial_page.dart';
import '../../components/onboarding/signup/signup_password_page.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/analytics.dart';

abstract class SignupScreenPage implements Widget {
  abstract final String analyticsPageCode;
}

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
    final isMounted = useIsMounted();
    final registerFuture = useState<Future?>(null);
    final user = ref.watch(authStateProvider.select((value) => value.user));
    useListenable(emailFocusNode);
    List<SignupScreenPage Function()> pages = [];

    Future onRegister() {
      return registerFuture.value = () async {
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

        pageController.animateToPage(
          pages.indexWhere((build) => build() is SignupDonePage),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutExpo,
        );
      }();
    }

    Future onSocialAuth(Future<bool> socialAuth) async {
      if (await socialAuth) {
        if (!isMounted()) return;
        final user = ref.read(authStateProvider).user;
        if (user?.name != null) {
          context.router.popUntil((route) => false);
          context.router.pushNamed('/');
          return;
        }
        pageController.animateToPage(
          pages.indexWhere((build) => build() is SignupNamePage),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutExpo,
        );
        firstNameFocusNode.requestFocus();
      }
    }

    pages = [
      () => SignupInitialPage(
            pageController: pageController,
            emailTextController: emailTextController,
            emailFocusNode: emailFocusNode,
            nextFocusNode: passwordFocusNode,
            onSocialAuth: onSocialAuth,
          ),
      if (user == null)
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
            yearController: yearController,
            yearFocusNode: yearFocusNode,
            onRegister: onRegister,
          ),
      () => SignupDonePage(
            pageController: pageController,
            emailTextController: emailTextController,
            registerFuture: registerFuture.value,
          ),
    ];

    // ignore: exhaustive_keys
    useMemoized(() => ref.read(analyticsProvider).screen(pages[0]().analyticsPageCode));

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
          onPageChanged: (index) {
            final page = pages[index]();
            ref.read(analyticsProvider).screen(page.analyticsPageCode);
          },
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
