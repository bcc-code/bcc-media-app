import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';

class IconLabelButton extends StatelessWidget {
  final String? imagePath;
  final String? labelText;
  final VoidCallback onPressed;
  EdgeInsetsGeometry padding = const EdgeInsets.all(0);
  double borderRadius = 20;
  double? gap = 0;
  double? imageDimension = 24;
  Color? backgroundColor = Colors.transparent;
  BoxBorder? border;
  TextStyle? textStyle = BtvTextStyles.button2;

  IconLabelButton({
    super.key,
    required this.onPressed,
    this.labelText,
    this.imagePath,
    this.imageDimension,
    this.backgroundColor,
    this.border,
  });

  IconLabelButton.secondarySmall({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.imagePath,
  }) {
    gap = imagePath != null ? 6 : 0;
    padding = const EdgeInsets.only(top: 4, right: 12, bottom: 4, left: 14);
    backgroundColor = const Color.fromRGBO(204, 221, 255, 0.1);
    border =
        Border.all(color: const Color.fromRGBO(204, 221, 255, 0.1), width: 1);
    imageDimension = 20;
    textStyle = BtvTextStyles.button1.copyWith(color: BtvColors.label1);
  }

  IconLabelButton.redSmall({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.imagePath,
  }) {
    gap = imagePath != null ? 6 : 0;
    padding = const EdgeInsets.only(top: 4, right: 12, bottom: 4, left: 14);
    backgroundColor = const Color.fromRGBO(230, 60, 98, 1);
    border =
        Border.all(color: const Color.fromRGBO(255, 255, 255, 0.2), width: 1);
    imageDimension = 20;
    textStyle = BtvTextStyles.button1.copyWith(color: BtvColors.label1);
  }

  IconLabelButton.medium({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.imagePath,
  }) {
    gap = imagePath != null ? 6 : 0;
    padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    backgroundColor = const Color.fromRGBO(110, 176, 230, 1);
    border =
        Border.all(color: const Color.fromRGBO(255, 255, 255, 0.2), width: 1);
    imageDimension = 20;
    textStyle = BtvTextStyles.button1.copyWith(color: BtvColors.label1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(borderRadius!),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
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
                style: textStyle,
              )
          ],
        ),
      ),
    );
  }
}
