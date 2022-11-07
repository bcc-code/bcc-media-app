import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';

class TabButton extends StatelessWidget {
  const TabButton(this.text, {super.key, required this.selected});

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: !selected
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: BtvColors.seperatorOnLight,
                width: 1,
              ),
              color: BtvColors.background2,
            ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      child: Text(
        text,
        style: BtvTextStyles.button2.copyWith(color: BtvColors.label1),
      ),
    );
  }
}
