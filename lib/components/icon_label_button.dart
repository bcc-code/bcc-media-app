import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class IconLabelButton extends StatelessWidget {
  final String? imagePath;
  final String? labelText;
  final VoidCallback onPressed;
  EdgeInsetsGeometry padding = const EdgeInsets.all(0);
  double borderRadius = 20;
  double? gap = 0;
  double? imageDimension = 24;
  Color? backgroundColor = Colors.transparent;
  Color labelColor = const Color.fromRGBO(110, 176, 230, 1);
  double? labelFontSize = 15;
  BoxBorder? border;

  IconLabelButton({
    super.key,
    required this.onPressed,
    this.labelText,
    this.imagePath,
    this.imageDimension,
    this.backgroundColor,
    this.labelFontSize,
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
    labelColor = const Color.fromRGBO(254, 254, 254, 1);
    labelFontSize = 18;
    border =
        Border.all(color: const Color.fromRGBO(204, 221, 255, 0.1), width: 1);
    imageDimension = 20;
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
    labelColor = const Color.fromRGBO(254, 254, 254, 1);
    labelFontSize = 18;
    border =
        Border.all(color: const Color.fromRGBO(255, 255, 255, 0.2), width: 1);
    imageDimension = 20;
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
    labelColor = const Color.fromRGBO(254, 254, 254, 1);
    labelFontSize = 18;
    border =
        Border.all(color: const Color.fromRGBO(255, 255, 255, 0.2), width: 1);
    imageDimension = 20;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding!,
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
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: labelFontSize,
                  color: labelColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}
