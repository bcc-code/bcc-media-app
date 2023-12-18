import 'package:flutter/material.dart';

import 'package:bccm_core/design_system.dart';

import '../../l10n/app_localizations.dart';

class GenericDialog extends StatelessWidget {
  const GenericDialog({
    super.key,
    this.image,
    required this.title,
    this.description,
    this.dismissButtonText,
    this.slotBeforeDismissButton,
    this.titleStyle,
    this.descriptionStyle,
  });

  final Widget? image;
  final Widget? slotBeforeDismissButton;
  final String title;
  final String? description;
  final String? dismissButtonText;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

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
            if (image != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: image,
              ),
            Text(
              title,
              style: titleStyle ?? DesignSystem.of(context).textStyles.headline2,
              textAlign: TextAlign.center,
            ),
            if (description?.isNotEmpty == true)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  description!,
                  style: descriptionStyle ?? DesignSystem.of(context).textStyles.caption1.copyWith(color: DesignSystem.of(context).colors.label3),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 24),
            if (slotBeforeDismissButton != null) slotBeforeDismissButton!,
            SizedBox(
              width: double.infinity,
              child: DesignSystem.of(context).buttons.large(
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
