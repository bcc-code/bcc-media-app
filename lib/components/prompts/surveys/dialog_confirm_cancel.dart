import 'package:flutter/material.dart';

import '../../../../helpers/ui/btv_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../theme/bccm_colors.dart';
import '../../../../theme/bccm_typography.dart';

class DialogConfirmCancel extends StatelessWidget {
  const DialogConfirmCancel({super.key});

  void onGoBack(context) {
    Navigator.pop(context, false);
  }

  void onCancel(context) {
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 242,
        width: 343,
        decoration: BoxDecoration(
          color: BccmColors.background2,
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
                style: BccmTextStyles.headline2,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: Text(
                S.of(context).cancelConfirmationDescription,
                style: BccmTextStyles.body2.copyWith(color: BccmColors.label4),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtvButton.largeSecondary(
                  onPressed: () => onGoBack(context),
                  labelText: S.of(context).goBack,
                ),
                const SizedBox(width: 16),
                BtvButton.largeRed(
                  onPressed: () => onCancel(context),
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
