import 'package:flutter/material.dart';

import 'package:bccm_core/design_system.dart';

class TwoActionGenericDialog extends StatelessWidget {
  const TwoActionGenericDialog({
    super.key,
    this.image,
    required this.title,
    this.description,
    required this.firstButtonText,
    required this.secondButtonText,
    this.slotBeforeDismissButton,
    this.titleStyle,
    this.descriptionStyle,
    this.onFirstButtonPressed,
    this.onSecondButtonPressed,
  });

  final Widget? image;
  final Widget? slotBeforeDismissButton;
  final String title;
  final String? description;
  final String firstButtonText;
  final String secondButtonText;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final void Function(BuildContext context)? onFirstButtonPressed;
  final void Function(BuildContext context)? onSecondButtonPressed;

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
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  description!,
                  style: descriptionStyle ?? DesignSystem.of(context).textStyles.caption1.copyWith(color: DesignSystem.of(context).colors.label3),
                  textAlign: TextAlign.center,
                ),
              ),
            if (slotBeforeDismissButton != null) ...[
              const SizedBox(height: 16),
              slotBeforeDismissButton!,
            ],
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: DesignSystem.of(context).buttons.large(
                        variant: ButtonVariant.secondary,
                        onPressed: () {
                          if (onFirstButtonPressed != null) {
                            onFirstButtonPressed!(context);
                            return;
                          }
                          Navigator.pop(context);
                        },
                        labelText: firstButtonText,
                      ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DesignSystem.of(context).buttons.large(
                        onPressed: () {
                          if (onSecondButtonPressed != null) {
                            onSecondButtonPressed!(context);
                            return;
                          }
                          Navigator.pop(context);
                        },
                        labelText: secondButtonText,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
