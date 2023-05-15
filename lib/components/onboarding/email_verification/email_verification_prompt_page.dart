import 'dart:async';
import 'dart:math';

import 'package:brunstadtv_app/components/status_indicators/loading_indicator.dart';
import 'package:brunstadtv_app/components/onboarding/onboarding_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/ui/btv_buttons.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/me_provider.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_mail_app/open_mail_app.dart';

import '../../../graphql/queries/me.graphql.dart';
import '../../../l10n/app_localizations.dart';

class EmailVerificationPromptPage extends HookConsumerWidget {
  const EmailVerificationPromptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final sendVerificationEmail = useMutation$sendVerificationEmail(
        WidgetOptions$Mutation$sendVerificationEmail(cacheRereadPolicy: CacheRereadPolicy.ignoreAll, fetchPolicy: FetchPolicy.networkOnly));
    final meAsync = ref.watch(meProvider);
    final email = meAsync.valueOrNull?.me.email;

    Future resendEmail() async {
      try {
        await sendVerificationEmail.runMutation().networkResult;
      } catch (e, st) {
        FlutterError.reportError(
          FlutterErrorDetails(
            exception: e,
            stack: st,
            context: ErrorDescription('Resend failed'),
          ),
        );
      }
      if (!isMounted()) return;
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Verification email sent', style: DesignSystem.of(context).textStyles.title1),
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text('If you still did not receive an email, please contact support at support@bcc.media.')),
              Container(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 12),
                child: DesignSystem.of(context).buttons.medium(onPressed: () => Navigator.pop(context), labelText: S.of(context).ok),
              )
            ],
          );
        },
      );
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
                  child: Text('Verify your account', style: DesignSystem.of(context).textStyles.headline1),
                ),
                if (email != null) const Text('We have sent an email to '),
                if (email != null)
                  Text(email.toLowerCase(),
                      style: DesignSystem.of(context)
                          .textStyles
                          .body1
                          .copyWith(color: DesignSystem.of(context).colors.label3, fontStyle: FontStyle.italic)),
                const SizedBox(height: 8),
                const Text('Click the link in the email to verify your account.'),
              ],
            ),
          ),
        ),
      ],
      bottomArea: [
        Container(
          padding: const EdgeInsets.only(bottom: 12),
          width: double.infinity,
          child: DesignSystem.of(context).buttons.large(
                onPressed: () async {
                  // Android: Will open mail app or show native picker.
                  // iOS: Will open mail app if single mail app found.
                  var result = await OpenMailApp.openMailApp();

                  if (!isMounted()) return;

                  if (!result.didOpen && !result.canOpen) {
                    // ignore: use_build_context_synchronously
                    _showNoMailAppsDialog(context);
                  } else if (!result.didOpen && result.canOpen) {
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (_) {
                        return MailAppPickerDialog(
                          mailApps: result.options,
                        );
                      },
                    );
                  }
                },
                labelText: 'Open email app',
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: DesignSystem.of(context)
              .buttons
              .mediumSecondary(
                labelText: 'Resend email',
                image: sendVerificationEmail.result.isLoading ? const Padding(padding: EdgeInsets.all(2), child: LoadingIndicator()) : null,
                onPressed: resendEmail,
              )
              .copyWith(
                backgroundColor: Colors.transparent,
                border: Border.all(color: Colors.transparent),
              ),
        ),
      ],
    );
  }
}

void _showNoMailAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Open Mail App"),
        content: const Text("No mail apps installed"),
        actions: <Widget>[
          DesignSystem.of(context).buttons.large(
                labelText: S.of(context).ok,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
        ],
      );
    },
  );
}
