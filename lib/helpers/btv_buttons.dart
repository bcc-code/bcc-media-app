import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import 'btv_colors.dart';
import 'btv_typography.dart';

class BtvButton extends StatelessWidget {
  final String? imagePath;
  final String labelText;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double gap;
  final double imageDimension;
  final Color backgroundColor;
  final BoxBorder? border;
  final TextStyle textStyle;

  const BtvButton({
    super.key,
    required this.onPressed,
    required this.labelText,
    this.backgroundColor = Colors.transparent,
    this.imagePath,
    this.imageDimension = 24,
    this.border,
    this.gap = 6,
    this.textStyle = BtvTextStyles.button2,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(0),
  });

  BtvButton copyWith({
    VoidCallback? onPressed,
    String? labelText,
    Color? backgroundColor,
    String? imagePath,
    double? imageDimension,
    BoxBorder? border,
    double? gap,
    TextStyle? textStyle,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
  }) {
    return BtvButton(
      onPressed: onPressed ?? this.onPressed,
      labelText: labelText ?? this.labelText,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      imagePath: imagePath ?? this.imagePath,
      imageDimension: imageDimension ?? this.imageDimension,
      border: border ?? this.border,
      gap: gap ?? this.gap,
      textStyle: textStyle ?? this.textStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }

  factory BtvButton.small({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return BtvButton(
      onPressed: onPressed,
      labelText: labelText,
      imagePath: imagePath,
      backgroundColor: BtvColors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      border: Border.all(color: BtvColors.onTint.withOpacity(0.2), width: 1),
      imageDimension: 20,
      textStyle: BtvTextStyles.button1.copyWith(color: BtvColors.label1),
    );
  }

  factory BtvButton.smallSecondary({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return BtvButton.small(
            onPressed: onPressed, labelText: labelText, imagePath: imagePath)
        .copyWith(
      backgroundColor: BtvColors.seperatorOnLight,
      border: Border.all(color: BtvColors.seperatorOnLight, width: 1),
    );
  }

  factory BtvButton.smallRed({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return BtvButton.small(
            onPressed: onPressed, labelText: labelText, imagePath: imagePath)
        .copyWith(backgroundColor: BtvColors.tint2);
  }

  factory BtvButton.medium({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return BtvButton(
      onPressed: onPressed,
      labelText: labelText,
      imagePath: imagePath,
      backgroundColor: BtvColors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      border: Border.all(color: BtvColors.onTint.withOpacity(0.2), width: 1),
      imageDimension: 20,
      textStyle: BtvTextStyles.button1.copyWith(color: BtvColors.label1),
    );
  }

  factory BtvButton.mediumSecondary({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return BtvButton.medium(
            onPressed: onPressed, labelText: labelText, imagePath: imagePath)
        .copyWith(
      backgroundColor: BtvColors.seperatorOnLight,
      border: Border.all(
          color: BtvColors.seperatorOnLight.withOpacity(0.1), width: 1),
    );
  }

  factory BtvButton.large({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return BtvButton(
      onPressed: onPressed,
      labelText: labelText,
      imagePath: imagePath,
      backgroundColor: BtvColors.tint1,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      border: Border.all(color: BtvColors.onTint.withOpacity(0.2), width: 1),
      borderRadius: 24,
      imageDimension: 20,
      textStyle: BtvTextStyles.button1.copyWith(color: BtvColors.label1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imagePath != null)
              Container(
                margin: EdgeInsets.only(right: gap),
                child: Image.asset(imagePath!,
                    width: imageDimension, height: imageDimension),
              ),
            Text(
              labelText,
              textAlign: TextAlign.center,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }
}
