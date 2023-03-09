import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/onboarding/signup_initial_page.dart';
import '../../components/onboarding/signup_password_page.dart';
import '../../l10n/app_localizations.dart';
import 'package:local_hero/local_hero.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    final pageController = usePageController();
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    useListenable(emailFocusNode);

    final pages = [
      () => SignupInitialPage(
            pageController: pageController,
            emailTextController: emailTextController,
            emailFocusNode: emailFocusNode,
            passwordFocusNode: passwordFocusNode,
          ),
      () => SignupPasswordPage(
            pageController: pageController,
            passwordTextController: passwordTextController,
            passwordFocusNode: passwordFocusNode,
          ),
    ];

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: LocalHeroScope(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
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
      ),
    );
  }
}
