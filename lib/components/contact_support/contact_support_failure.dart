import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/design_system/design_system.dart';

class ContactSupportFailure extends StatelessWidget {
  const ContactSupportFailure({super.key, required this.onTryAgain});

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).sendFail,
                textAlign: TextAlign.center,
                style: design.textStyles.headline1,
              ),
              const SizedBox(height: 12),
              Text(
                S.of(context).sendFailDescription,
                textAlign: TextAlign.center,
                style: design.textStyles.body1.copyWith(color: design.colors.label3),
              ),
            ],
          ),
        ),
        design.buttons.large(
          onPressed: onTryAgain,
          labelText: S.of(context).tryAgainButton,
        ),
      ],
    );
  }
}
