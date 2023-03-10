import 'package:brunstadtv_app/components/onboarding/signup_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/ui/btv_buttons.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:open_mail_app/open_mail_app.dart';

import '../../../l10n/app_localizations.dart';
import '../../../theme/bccm_typography.dart';

class SignupVerifyEmailPage extends HookWidget {
  const SignupVerifyEmailPage({super.key, required this.pageController, required this.emailTextController});

  final PageController pageController;
  final TextEditingController emailTextController;

  @override
  Widget build(BuildContext context) {
    final isMounted = useIsMounted();
    return SignupPageWrapper(
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
                  child: Text('Verify your account', style: BccmTextStyles.headline1),
                ),
                Text('We have sent an email to '),
                Text(emailTextController.value.text.toLowerCase(),
                    style: BccmTextStyles.body1.copyWith(color: BccmColors.label3, fontStyle: FontStyle.italic)),
                const SizedBox(height: 8),
                Text('Click the link in the email to verify your account.'),
              ],
            ),
          ),
        ),
      ],
      bottomArea: [
        Container(
          padding: const EdgeInsets.only(bottom: 12),
          width: double.infinity,
          child: BtvButton.large(
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
        BtvButton.mediumSecondary(
          labelText: 'Resend email',
          onPressed: () {},
        ).copyWith(
          backgroundColor: Colors.transparent,
          border: Border.all(color: Colors.transparent),
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
          BtvButton.large(
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
