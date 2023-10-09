import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';

import '../../theme/design_system/design_system.dart';

class DialogConfirmCancel extends StatelessWidget {
  const DialogConfirmCancel({super.key});

  void onGoBack(context) {
    Navigator.pop(context, false);
  }

  void onCancelConfirmed(context) {
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Center(
      child: Container(
        width: 343,
        decoration: BoxDecoration(
          color: design.colors.background2,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(32).copyWith(top: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: Text(
                S.of(context).cancelConfirmation,
                style: design.textStyles.headline2,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: Text(
                S.of(context).cancelConfirmationDescription,
                style: design.textStyles.body2.copyWith(color: design.colors.label4),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                design.buttons.large(
                  variant: ButtonVariant.secondary,
                  onPressed: () => onGoBack(context),
                  labelText: S.of(context).goBack,
                ),
                const SizedBox(width: 16),
                design.buttons.large(
                  variant: ButtonVariant.red,
                  onPressed: () => onCancelConfirmed(context),
                  labelText: S.of(context).yesCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
