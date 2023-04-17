import 'package:flutter/material.dart';

import '../../theme/bccm_colors.dart';
import '../../theme/bccm_typography.dart';

class BtvButton extends StatelessWidget {
  final Widget? image;
  final String labelText;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double gap;
  final double imageDimension;
  final Color backgroundColor;
  final BoxBorder? border;
  final TextStyle textStyle;
  final bool disabled;

  const BtvButton({
    super.key,
    required this.onPressed,
    required this.labelText,
    this.backgroundColor = Colors.transparent,
    this.image,
    this.imageDimension = 24,
    this.border,
    this.gap = 6,
    this.textStyle = BccmTextStyles.button2,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(0),
    this.disabled = false,
  });

  BtvButton copyWith({
    Key? key,
    VoidCallback? onPressed,
    String? labelText,
    Color? backgroundColor,
    Widget? image,
    double? imageDimension,
    BoxBorder? border,
    double? gap,
    TextStyle? textStyle,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    bool? disabled,
  }) {
    return BtvButton(
      key: key ?? this.key,
      onPressed: onPressed ?? this.onPressed,
      labelText: labelText ?? this.labelText,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      image: image ?? this.image,
      imageDimension: imageDimension ?? this.imageDimension,
      border: border ?? this.border,
      gap: gap ?? this.gap,
      textStyle: textStyle ?? this.textStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      disabled: disabled ?? this.disabled,
    );
  }

  factory BtvButton.small({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      backgroundColor: BccmColors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      border: Border.all(color: BccmColors.onTint.withOpacity(0.2), width: 1),
      imageDimension: 20,
      textStyle: BccmTextStyles.button1.copyWith(color: BccmColors.label1),
      disabled: disabled,
    );
  }

  factory BtvButton.smallSecondary({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton.small(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
    ).copyWith(
      backgroundColor: BccmColors.separatorOnLight,
      border: Border.all(color: BccmColors.separatorOnLight, width: 1),
    );
  }

  factory BtvButton.smallGreen({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton.small(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
    ).copyWith(backgroundColor: BccmColors.tint3);
  }

  factory BtvButton.smallRed({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton.small(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
    ).copyWith(backgroundColor: BccmColors.tint2);
  }

  factory BtvButton.medium({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      backgroundColor: BccmColors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      border: Border.all(color: BccmColors.onTint.withOpacity(0.2), width: 1),
      imageDimension: 20,
      textStyle: BccmTextStyles.button1.copyWith(color: BccmColors.label1),
      disabled: disabled,
    );
  }

  factory BtvButton.mediumGreen({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton.medium(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
    ).copyWith(backgroundColor: BccmColors.tint3);
  }

  factory BtvButton.mediumRed({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton.medium(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
    ).copyWith(backgroundColor: BccmColors.tint2);
  }

  factory BtvButton.mediumSecondary({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton.medium(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
    ).copyWith(
      backgroundColor: BccmColors.separatorOnLight,
      border: Border.all(color: BccmColors.separatorOnLight.withOpacity(0.1), width: 1),
    );
  }

  factory BtvButton.large({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      backgroundColor: BccmColors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      border: Border.all(color: BccmColors.onTint.withOpacity(0.2), width: 1),
      borderRadius: 24,
      imageDimension: 20,
      textStyle: BccmTextStyles.button1.copyWith(color: BccmColors.label1),
      disabled: disabled,
    );
  }

  factory BtvButton.largeGreen({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton.large(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
    ).copyWith(backgroundColor: BccmColors.tint3);
  }

  factory BtvButton.largeRed({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton.large(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
    ).copyWith(backgroundColor: BccmColors.tint2);
  }

  factory BtvButton.largeSecondary({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    Widget? image,
    bool disabled = false,
  }) {
    return BtvButton.large(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      image: image,
      disabled: disabled,
    ).copyWith(
      backgroundColor: BccmColors.separatorOnLight,
      border: Border.all(color: BccmColors.separatorOnLight.withOpacity(0.1), width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final disabledBorder = Border.all(color: BccmColors.separatorOnLight, width: 1);
    const disabledBackgroundColor = BccmColors.background1;
    const disabledTextColor = BccmColors.label4;

    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: FocusableActionDetector(
          mouseCursor: MaterialStateMouseCursor.clickable,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: padding,
            decoration: BoxDecoration(
              border: disabled ? disabledBorder : border,
              borderRadius: BorderRadius.circular(borderRadius),
              color: disabled ? disabledBackgroundColor : backgroundColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (image != null)
                  Container(
                    margin: EdgeInsets.only(right: gap),
                    child: SizedBox(width: imageDimension, height: imageDimension, child: image),
                  ),
                Text(
                  labelText,
                  textAlign: TextAlign.center,
                  style: textStyle.copyWith(color: disabled ? disabledTextColor : textStyle.color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
