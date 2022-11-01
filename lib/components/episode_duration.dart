import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';

class EpisodeDuration extends StatelessWidget {
  final String duration;

  const EpisodeDuration({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: BtvColors.background1.withOpacity(0.7),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        duration,
        style: BtvTextStyles.caption3.copyWith(color: BtvColors.onTint),
      ),
    );
  }
}
