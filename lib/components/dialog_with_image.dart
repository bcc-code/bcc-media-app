import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/btv_buttons.dart';
import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';

class DialogWithImage extends StatelessWidget {
  const DialogWithImage(
      {super.key, required this.image, required this.title, required this.description, this.dismissButtonText, this.slotBeforeDismissButton});

  final Widget image;
  final Widget? slotBeforeDismissButton;
  final String title;
  final String description;
  final String? dismissButtonText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 40, bottom: 32),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: image,
            ),
            Text(
              title,
              style: BtvTextStyles.headline2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(description, style: BtvTextStyles.caption1.copyWith(color: BtvColors.label3)),
            const SizedBox(height: 24),
            if (slotBeforeDismissButton != null) slotBeforeDismissButton!,
            SizedBox(
              width: double.infinity,
              child: BtvButton.large(
                onPressed: () {
                  Navigator.pop(context);
                },
                labelText: dismissButtonText ?? S.of(context).done,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
