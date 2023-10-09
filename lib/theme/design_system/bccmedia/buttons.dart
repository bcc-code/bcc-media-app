import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../components/buttons/btv_buttons.dart';

class BccMediaButtons extends DesignSystemButtons {
  BccMediaButtons({required this.colors, required this.textStyles});

  final DesignSystemColors colors;
  final DesignSystemTextStyles textStyles;

  @override
  BtvButton small({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    ButtonVariant variant = ButtonVariant.primary,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    final button = BtvButton(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      backgroundColor: colors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      border: Border.all(color: colors.onTint.withOpacity(0.2), width: 1),
      imageDimension: 20,
      textStyle: textStyles.button1.copyWith(color: colors.label1),
      disabled: disabled,
      autofocus: autofocus,
    );

    switch (variant) {
      case ButtonVariant.secondary:
        return button.copyWith(
          backgroundColor: colors.separatorOnLight,
          border: Border.all(color: colors.separatorOnLight, width: 1),
        );
      case ButtonVariant.green:
        return button.copyWith(backgroundColor: colors.tint3);
      case ButtonVariant.red:
        return button.copyWith(backgroundColor: colors.tint2);
      default:
        return button;
    }
  }

  @override
  BtvButton medium({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    ButtonVariant variant = ButtonVariant.primary,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
    Color? backgroundColor,
    Border? border,
  }) {
    final button = BtvButton(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      backgroundColor: backgroundColor ?? colors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      border: border ?? Border.all(color: colors.onTint.withOpacity(0.2), width: 1),
      imageDimension: 20,
      textStyle: textStyles.button1.copyWith(color: colors.label1),
      disabled: disabled,
      autofocus: autofocus,
    );

    switch (variant) {
      case ButtonVariant.secondary:
        return button.copyWith(
          backgroundColor: colors.separatorOnLight,
          border: Border.all(color: colors.separatorOnLight.withOpacity(0.1), width: 1),
        );
      case ButtonVariant.green:
        return button.copyWith(backgroundColor: colors.tint3);
      case ButtonVariant.red:
        return button.copyWith(backgroundColor: colors.tint2);
      default:
        return button;
    }
  }

  @override
  BtvButton large({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    ButtonVariant variant = ButtonVariant.primary,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    final button = BtvButton(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      backgroundColor: colors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      border: Border.all(color: colors.onTint.withOpacity(0.2), width: 1),
      borderRadius: 60,
      imageDimension: 20,
      textStyle: textStyles.button1.copyWith(color: colors.label1),
      disabled: disabled,
      autofocus: autofocus,
    );

    switch (variant) {
      case ButtonVariant.secondary:
        return button.copyWith(
          backgroundColor: colors.separatorOnLight,
          border: Border.all(color: colors.separatorOnLight.withOpacity(0.1), width: 1),
        );
      case ButtonVariant.green:
        return button.copyWith(backgroundColor: colors.tint3);
      case ButtonVariant.red:
        return button.copyWith(backgroundColor: colors.tint2);
      default:
        return button;
    }
  }
}
