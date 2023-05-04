import 'package:flutter/material.dart';

import '../theme/design_system/design_system.dart';

class EpisodeDuration extends StatelessWidget {
  final String duration;

  const EpisodeDuration({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: DesignSystem.of(context).colors.background1.withOpacity(0.7),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        duration,
        style: DesignSystem.of(context).textStyles.caption3.copyWith(color: DesignSystem.of(context).colors.onTint),
      ),
    );
  }
}
