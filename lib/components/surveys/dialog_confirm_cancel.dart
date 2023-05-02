import 'package:flutter/material.dart';

import '../../../helpers/ui/btv_buttons.dart';
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
    return Center(
      child: Container(
        width: 343,
        decoration: BoxDecoration(
          color: DesignSystem.of(context).colors.background2,
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
                style: DesignSystem.of(context).textStyles.headline2,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: Text(
                S.of(context).cancelConfirmationDescription,
                style: DesignSystem.of(context).textStyles.body2.copyWith(color: DesignSystem.of(context).colors.label4),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DesignSystem.of(context).buttons.largeSecondary(
                      onPressed: () => onGoBack(context),
                      labelText: S.of(context).goBack,
                    ),
                const SizedBox(width: 16),
                DesignSystem.of(context).buttons.largeRed(
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
