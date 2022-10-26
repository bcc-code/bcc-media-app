import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';

class FeatureBadge extends StatelessWidget {
  final String label;
  final Color color;

  const FeatureBadge({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4, bottom: 2, right: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(204, 221, 255, 0.1),
        ),
      ),
      child: Text(
        label,
        style: BtvTextStyles.caption2.copyWith(color: BtvColors.onTint),
      ),
    );
  }
}
