import 'dart:async';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/components/onboarding/onboarding_page_wrapper.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/providers/me_provider.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:bccm_core/platform.dart';
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
            title: Text(S.of(context).verificationEmailSent, style: DesignSystem.of(context).textStyles.title1),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '${S.of(context).ifYouDidntReceiveVerificationEmail} ${FlavorConfig.current.strings(context).contactEmail}.',
                ),
              ),
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
                  child: Text(S.of(context).verifyYourAccount, style: DesignSystem.of(context).textStyles.headline1),
                ),
                if (email != null) ...[
                  Text(S.of(context).weHaveSentAnEmailTo),
                  Text(email.toLowerCase(),
                      style: DesignSystem.of(context)
                          .textStyles
                          .body1
                          .copyWith(color: DesignSystem.of(context).colors.label3, fontStyle: FontStyle.italic)),
                ],
                const SizedBox(height: 8),
                Text(S.of(context).clickTheLinkToVerify),
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
                labelText: S.of(context).openEmailApp,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: DesignSystem.of(context).buttons.medium(
                labelText: S.of(context).resendEmail,
                image: sendVerificationEmail.result.isLoading ? const Padding(padding: EdgeInsets.all(2), child: LoadingIndicator()) : null,
                onPressed: resendEmail,
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
        title: Text(S.of(context).openEmailApp),
        content: Text(S.of(context).noMailAppsDescription),
        actions: <Widget>[
          DesignSystem.of(context).buttons.large(
                labelText: S.of(context).ok,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
        ],
      );
    },
  );
}
