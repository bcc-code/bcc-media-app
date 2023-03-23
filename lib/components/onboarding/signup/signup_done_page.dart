import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/helpers/ui/btv_buttons.dart';
import 'package:brunstadtv_app/screens/onboarding/signup.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../helpers/analytics_constants.dart';
import '../../../providers/auth_state/auth_state.dart';
import '../../../theme/bccm_typography.dart';
import '../onboarding_page_wrapper.dart';

class SignupDonePage extends HookConsumerWidget implements SignupScreenPage {
  @override
  final String analyticsPageCode = AnalyticsPageCodes.signupDone;

  const SignupDonePage({
    super.key,
    required this.pageController,
    required this.emailTextController,
    required this.registerFuture,
  });

  final PageController pageController;
  final TextEditingController emailTextController;
  final Future? registerFuture;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final registerStatus = useFuture(registerFuture);
    Widget returnWidget;

    if (registerStatus.connectionState == ConnectionState.waiting) {
      returnWidget = OnboardingPageWrapper(
        key: const Key('signup_creating'),
        body: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: LoadingIndicator(),
                  ),
                  Text(
                    'Creating your account',
                    textAlign: TextAlign.center,
                    style: BccmTextStyles.body1.copyWith(color: BccmColors.label4),
                  ),
                ],
              ),
            ),
          ),
        ],
        bottomArea: [],
      );
    } else {
      returnWidget = OnboardingPageWrapper(
        key: const Key('signup_done'),
        body: [
          Expanded(
            child: DefaultTextStyle(
              style: BccmTextStyles.body1.copyWith(color: BccmColors.label3),
              textAlign: TextAlign.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text('Account created', style: BccmTextStyles.headline1),
                  ),
                  Text('You can now log in to your account and explore a variety of edifying content.'),
                ],
              ),
            ),
          ),
        ],
        bottomArea: [
          Container(
            padding: const EdgeInsets.only(bottom: 32),
            width: double.infinity,
            child: BtvButton.large(
              onPressed: () async {
                final success = await ref.read(authStateProvider.notifier).login();
                if (success && isMounted()) {
                  // because isMounted,
                  // ignore: use_build_context_synchronously
                  final router = context.router;
                  router.popUntil((route) => false);
                  router.pushNamed('/');
                }
              },
              labelText: 'Log in',
            ),
          ),
        ],
      );
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.easeInOutQuad,
      child: returnWidget,
    );
  }
}
