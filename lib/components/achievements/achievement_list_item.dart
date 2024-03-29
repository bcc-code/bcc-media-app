import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/platform.dart';
import 'package:bccm_core/design_system.dart';

class AchievementListItem extends StatelessWidget {
  final Fragment$Achievement item;
  const AchievementListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: item.achieved ? 1 : 0.3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: ClipOval(child: item.image == null ? const SizedBox.shrink() : SizedBox(height: 80, child: simpleFadeInImage(url: item.image!))),
            ),
            Text(
              item.title,
              style: DesignSystem.of(context).textStyles.caption2.copyWith(color: DesignSystem.of(context).colors.label3),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
