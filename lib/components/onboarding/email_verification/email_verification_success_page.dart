import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/onboarding/onboarding_page_wrapper.dart';
import 'package:bccm_core/design_system.dart';
import 'package:brunstadtv_app/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../l10n/app_localizations.dart';
import '../../../router/router.gr.dart';

class EmailVerificationSuccessPage extends HookConsumerWidget {
  const EmailVerificationSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(authStateProvider).user?.email;
    if (email == null) {
      return const SizedBox.shrink();
    }
    return OnboardingPageWrapper(
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
                  child: Text(S.of(context).accountCreated, style: DesignSystem.of(context).textStyles.headline1),
                ),
                Text(S.of(context).youCanNowUseYourAccount),
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
                labelText: S.of(context).continueButton,
                onPressed: () {
                  Navigator.pop(context);
                  context.router.replaceAll([const TabsRootScreenRoute()]);
                },
              ),
        )
      ],
    );
  }
}
