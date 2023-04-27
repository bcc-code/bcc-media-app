import 'package:flutter/material.dart';

import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';

class EpisodeDuration extends StatelessWidget {
  final String duration;

  const EpisodeDuration({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: BccmColors.background1.withOpacity(0.7),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        duration,
        style: BccmTextStyles.caption3.copyWith(color: BccmColors.onTint),
      ),
    );
  }
}
