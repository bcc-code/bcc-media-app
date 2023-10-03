import 'package:flutter/material.dart';

import '../../theme/design_system/design_system.dart';

class WatchedBadge extends StatelessWidget {
  const WatchedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: DesignSystem.of(context).colors.background1.withOpacity(0.7),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Image.asset('assets/icons/Seen.png', package: 'brunstadtv_app'),
    );
  }
}
