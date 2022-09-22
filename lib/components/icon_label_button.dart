import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class IconLabelButton extends StatelessWidget {
  final String imagePath;
  final String labelText;
  final VoidCallback onPressed;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;
  double gap;

  IconLabelButton({
    required this.imagePath,
    required this.labelText,
    required this.onPressed,
    this.gap = 0,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 24, height: 24),
          if (gap != 0) SizedBox(width: gap),
          Text(
            labelText,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: Color.fromRGBO(110, 176, 230, 1),
            ),
          )
        ],
      ),
    );
  }
}
