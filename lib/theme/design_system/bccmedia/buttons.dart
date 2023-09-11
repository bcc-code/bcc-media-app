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
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return BtvButton(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      backgroundColor: colors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      border: Border.all(color: colors.onTint.withOpacity(0.2), width: 1),
      imageDimension: 20,
      textStyle: textStyles.button1.copyWith(color: colors.label1),
      disabled: disabled,
      autofocus: autofocus,
    );
  }

  @override
  BtvButton smallSecondary({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return small(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
      autofocus: autofocus,
    ).copyWith(
      backgroundColor: colors.separatorOnLight,
      border: Border.all(color: colors.separatorOnLight, width: 1),
    );
  }

  @override
  BtvButton smallGreen({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return small(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
      autofocus: autofocus,
    ).copyWith(backgroundColor: colors.tint3);
  }

  @override
  BtvButton smallRed({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return small(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
      autofocus: autofocus,
    ).copyWith(backgroundColor: colors.tint2);
  }

  @override
  BtvButton medium({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return BtvButton(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      backgroundColor: colors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      border: Border.all(color: colors.onTint.withOpacity(0.2), width: 1),
      imageDimension: 20,
      textStyle: textStyles.button1.copyWith(color: colors.label1),
      disabled: disabled,
      autofocus: autofocus,
    );
  }

  @override
  BtvButton mediumGreen({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return medium(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
      autofocus: autofocus,
    ).copyWith(backgroundColor: colors.tint3);
  }

  @override
  BtvButton mediumRed({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return medium(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
      autofocus: autofocus,
    ).copyWith(backgroundColor: colors.tint2);
  }

  @override
  BtvButton mediumSecondary({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return medium(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
      autofocus: autofocus,
    ).copyWith(
      backgroundColor: colors.separatorOnLight,
      border: Border.all(color: colors.separatorOnLight.withOpacity(0.1), width: 1),
    );
  }

  @override
  BtvButton large({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return BtvButton(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      backgroundColor: colors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12).copyWith(bottom: 16),
      border: Border.all(color: colors.onTint.withOpacity(0.2), width: 1),
      borderRadius: 24,
      imageDimension: 20,
      textStyle: textStyles.button1.copyWith(color: colors.label1),
      disabled: disabled,
      autofocus: autofocus,
    );
  }

  @override
  BtvButton largeGreen({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return large(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
      autofocus: autofocus,
    ).copyWith(backgroundColor: colors.tint3);
  }

  @override
  BtvButton largeRed({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return large(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
      autofocus: autofocus,
    ).copyWith(backgroundColor: colors.tint2);
  }

  @override
  BtvButton largeSecondary({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return large(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
      autofocus: autofocus,
    ).copyWith(
      backgroundColor: colors.separatorOnLight,
      border: Border.all(color: colors.separatorOnLight.withOpacity(0.1), width: 1),
    );
  }
}
