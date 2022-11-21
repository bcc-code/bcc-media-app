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
    return SizedBox(
      height: 16,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: BtvColors.separatorOnLight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 2, right: 4),
            child: Text(
              label,
              style: BtvTextStyles.caption2.copyWith(color: BtvColors.onTint),
            ),
          )
        ],
      ),
    );
  }
}
