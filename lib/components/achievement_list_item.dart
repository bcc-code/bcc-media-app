import 'package:brunstadtv_app/helpers/image_utils.dart';
import 'package:flutter/material.dart';

import '../graphql/queries/achievements.graphql.dart';
import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';

class AchievementListItem extends StatelessWidget {
  final Fragment$Achievement item;
  const AchievementListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: item.achieved ? 1 : 0.3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: ClipOval(child: item.image == null ? const SizedBox.shrink() : SizedBox(height: 80, child: simpleFadeInImage(url: item.image!))),
            ),
            Text(
              item.title,
              style: BccmTextStyles.caption2.copyWith(color: BccmColors.label3),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
