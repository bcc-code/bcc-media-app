import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class IconLabelButton extends StatelessWidget {
  final String imagePath;
  final String labelText;
  final VoidCallback onPressed;
  EdgeInsetsGeometry? padding = const EdgeInsets.all(0);
  double? borderRadius = 20;
  double? gap = 0;
  double? imageDimension = 24;
  Color? backgroundColor = Colors.transparent;
  Color? labelColor = const Color.fromRGBO(110, 176, 230, 1);
  double? labelFontSize = 15;
  BoxBorder? border;

  IconLabelButton({
    required this.imagePath,
    required this.labelText,
    required this.onPressed,
    /**
     * TODO: Figure out what the issue is when removing constructor initializers for following fields
     */
    this.padding = const EdgeInsets.all(0),
    this.borderRadius = 20,
    this.gap = 0,
    this.labelColor = const Color.fromRGBO(110, 176, 230, 1),
    this.imageDimension,
    this.backgroundColor,
    this.labelFontSize,
    this.border,
  });

  IconLabelButton.secondarySmall({
    required this.imagePath,
    required this.labelText,
    required this.onPressed,
  }) {
    gap = 6;
    padding = const EdgeInsets.only(top: 4, right: 12, bottom: 4, left: 14);
    backgroundColor = const Color.fromRGBO(204, 221, 255, 0.1);
    labelColor = const Color.fromRGBO(254, 254, 254, 1);
    labelFontSize = 18;
    border =
        Border.all(color: const Color.fromRGBO(204, 221, 255, 0.1), width: 1);
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
            Container(
              margin: EdgeInsets.only(right: gap!),
              child: Image.asset(imagePath,
                  width: imageDimension, height: imageDimension),
            ),
            Text(
              labelText,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: labelFontSize,
                color: labelColor!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
