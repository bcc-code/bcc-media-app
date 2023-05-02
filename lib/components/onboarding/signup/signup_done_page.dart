import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/auth0_api.dart';
import 'package:brunstadtv_app/components/error_generic.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/helpers/ui/btv_buttons.dart';
import 'package:brunstadtv_app/models/auth0/auth0_api.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/screens/onboarding/signup.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../helpers/analytics_constants.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/auth_state/auth_state.dart';

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
    final user = ref.watch(authStateProvider).user;
    Widget returnWidget;

    if (registerStatus.connectionState != ConnectionState.waiting && registerStatus.hasError) {
      final auth0ApiException = registerStatus.error.asOrNull<Auth0ApiException>();
      returnWidget = ErrorGeneric(
        title: S.of(context).anErrorOccurred,
        description: auth0ApiException?.description ?? S.of(context).errorTryAgain,
        details: registerStatus.error.toString(),
        retryButtonText: S.of(context).goBack,
        onRetry: () {
          pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
        },
      );
    } else if (registerStatus.connectionState == ConnectionState.waiting) {
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
                    style: DesignSystem.of(context).textStyles.body1.copyWith(color: DesignSystem.of(context).colors.label4),
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
              style: DesignSystem.of(context).textStyles.body1.copyWith(color: DesignSystem.of(context).colors.label3),
              textAlign: TextAlign.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('Account created', style: DesignSystem.of(context).textStyles.headline1),
                  ),
                  if (user == null)
                    Text('You can now log in to your account and explore a variety of edifying content.')
                  else
                    Text('You can now use your account and explore a variety of edifying content.'),
                ],
              ),
            ),
          ),
        ],
        bottomArea: [
          Container(
            padding: const EdgeInsets.only(bottom: 32),
            width: double.infinity,
            child: DesignSystem.of(context).buttons.large(
                  onPressed: () async {
                    if (user == null) {
                      final success = await ref.read(authStateProvider.notifier).login();
                      if (!success) return;
                    }
                    if (!isMounted()) return;
                    // because isMounted,
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    // ignore: use_build_context_synchronously
                    context.router.replaceAll([const TabsRootScreenRoute()]);
                  },
                  labelText: user == null ? 'Log in' : S.of(context).exploreContent,
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
