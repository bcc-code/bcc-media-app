import 'dart:async';

import 'package:brunstadtv_app/components/onboarding/onboarding_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/ui/btv_buttons.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/me_provider.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_mail_app/open_mail_app.dart';

import '../../../l10n/app_localizations.dart';
import '../../../theme/bccm_typography.dart';

class EmailVerificationSuccessPage extends HookConsumerWidget {
  const EmailVerificationSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();

    final me = ref.watch(meProvider).valueOrNull?.me;
    final email = ref.watch(authStateProvider).user?.email;
    if (email == null) {
      return const SizedBox.shrink();
    }
    return OnboardingPageWrapper(
      body: [
        Expanded(
          child: DefaultTextStyle(
            style: BccmTextStyles.body1.copyWith(color: BccmColors.label3),
            textAlign: TextAlign.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text('Account created', style: BccmTextStyles.headline1),
                ),
                Text('We have sent an email to '),
                Text(email!.toLowerCase(), style: BccmTextStyles.body1.copyWith(color: BccmColors.label3, fontStyle: FontStyle.italic)),
                const SizedBox(height: 8),
                Text('Click the link in the email to verify your account.'),
              ],
            ),
          ),
        ),
      ],
      bottomArea: [
        BtvButton.large(
          labelText: S.of(context).continueButton,
          onPressed: () {},
        ),
      ],
    );
  }
}
