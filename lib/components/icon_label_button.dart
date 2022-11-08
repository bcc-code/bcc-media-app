import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';

class IconLabelButton extends StatelessWidget {
  final String? imagePath;
  final String labelText;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double gap;
  final double imageDimension;
  final Color backgroundColor;
  BoxBorder? border;
  TextStyle textStyle;

  IconLabelButton({
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

  IconLabelButton copyWith({
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
    return IconLabelButton(
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

  factory IconLabelButton.small({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return IconLabelButton(
      onPressed: onPressed,
      labelText: labelText,
      imagePath: imagePath,
      backgroundColor: BtvColors.seperatorOnLight,
      padding: const EdgeInsets.only(top: 4, right: 12, bottom: 4, left: 14),
      border: Border.all(color: BtvColors.seperatorOnLight, width: 1),
      imageDimension: 20,
      textStyle: BtvTextStyles.button1.copyWith(color: BtvColors.label1),
    );
  }

  factory IconLabelButton.secondarySmall({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return IconLabelButton.small(
            onPressed: onPressed, labelText: labelText, imagePath: imagePath)
        .copyWith(backgroundColor: BtvColors.seperatorOnLight);
  }

  // IconLabelButton.redSmall({
  //   super.key,
  //   required this.labelText,
  //   required this.onPressed,
  //   this.imagePath,
  // }) {
  //   gap = imagePath != null ? 6 : 0;
  //   padding = const EdgeInsets.only(top: 4, right: 12, bottom: 4, left: 14);
  //   backgroundColor = BtvColors.tint2;
  //   border = Border.all(color: BtvColors.onTint.withOpacity(0.2), width: 1);
  //   imageDimension = 20;
  //   textStyle = BtvTextStyles.button1.copyWith(color: BtvColors.label1);
  // }

  factory IconLabelButton.redSmall({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return IconLabelButton(
      onPressed: onPressed,
      labelText: labelText,
      imagePath: imagePath,
      backgroundColor: BtvColors.tint2,
      padding: const EdgeInsets.only(top: 4, right: 12, bottom: 4, left: 14),
      border: Border.all(color: BtvColors.onTint.withOpacity(0.2), width: 1),
      imageDimension: 20,
      textStyle: BtvTextStyles.button1.copyWith(color: BtvColors.label1),
    );
  }

  // IconLabelButton.medium({
  //   super.key,
  //   required this.labelText,
  //   required this.onPressed,
  //   this.imagePath,
  // }) {
  //   gap = imagePath != null ? 6 : 0;
  //   padding = const EdgeInsets.only(top: 7.5, right: 16, bottom: 8.5, left: 16);
  //   backgroundColor = BtvColors.tint1;
  //   border = Border.all(color: BtvColors.onTint.withOpacity(0.2), width: 1);
  //   imageDimension = 20;
  //   textStyle = BtvTextStyles.button1.copyWith(color: BtvColors.label1);
  // }

  factory IconLabelButton.medium({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return IconLabelButton(
      onPressed: onPressed,
      labelText: labelText,
      imagePath: imagePath,
      backgroundColor: BtvColors.tint1,
      padding:
          const EdgeInsets.only(top: 7.5, right: 16, bottom: 8.5, left: 16),
      border: Border.all(color: BtvColors.onTint.withOpacity(0.2), width: 1),
      imageDimension: 20,
      textStyle: BtvTextStyles.button1.copyWith(color: BtvColors.label1),
    );
  }

  // IconLabelButton.secondaryMedium({
  //   super.key,
  //   required this.labelText,
  //   required this.onPressed,
  //   this.imagePath,
  // }) {
  //   gap = imagePath != null ? 6 : 0;
  //   padding = const EdgeInsets.only(top: 7.5, right: 16, bottom: 8.5, left: 16);
  //   backgroundColor = BtvColors.seperatorOnLight;
  //   border = Border.all(color: BtvColors.seperatorOnLight, width: 1);
  //   imageDimension = 20;
  //   textStyle = BtvTextStyles.button1.copyWith(color: BtvColors.label1);
  // }

  factory IconLabelButton.secondaryMedium({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return IconLabelButton(
      onPressed: onPressed,
      labelText: labelText,
      imagePath: imagePath,
      backgroundColor: BtvColors.seperatorOnLight,
      padding:
          const EdgeInsets.only(top: 7.5, right: 16, bottom: 8.5, left: 16),
      border: Border.all(color: BtvColors.seperatorOnLight, width: 1),
      imageDimension: 20,
      textStyle: BtvTextStyles.button1.copyWith(color: BtvColors.label1),
    );
  }

  // IconLabelButton.large({
  //   super.key,
  //   required this.labelText,
  //   required this.onPressed,
  //   this.imagePath,
  // }) {
  //   gap = imagePath != null ? 6 : 0;
  //   padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
  //   backgroundColor = BtvColors.tint1;
  //   border = Border.all(color: BtvColors.onTint.withOpacity(0.2), width: 1);
  //   borderRadius = 24;
  //   imageDimension = 20;
  //   textStyle = BtvTextStyles.button1.copyWith(color: BtvColors.label1);
  // }

  factory IconLabelButton.large({
    required VoidCallback onPressed,
    required String labelText,
    String? imagePath,
  }) {
    return IconLabelButton(
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
                margin: EdgeInsets.only(right: gap!),
                child: Image.asset(imagePath!,
                    width: imageDimension, height: imageDimension),
              ),
            if (labelText != null)
              Text(
                labelText!,
                textAlign: TextAlign.center,
                style: textStyle,
              )
          ],
        ),
      ),
    );
  }
}
