import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/image_utils.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../graphql/queries/achievements.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../helpers/svg_icons.dart';
import 'achivement_dialog.dart';
import 'grid_row.dart';

class AchievementGroupSection extends StatelessWidget {
  const AchievementGroupSection({super.key, required this.achievementGroup});

  final Fragment$AchievementGroup achievementGroup;
  final colSize = 3;

  Future onAchievementTapped(BuildContext context, Fragment$AchievementGroup$achievements$items item) async {
    await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => AchievementDialog(achievement: item),
    );
  }

  List<Fragment$AchievementGroup$achievements$items> get achievements => achievementGroup.achievements.items;

  @override
  Widget build(BuildContext context) {
    final rowSize = (achievements.length / colSize).ceil();

    final rows = List<GridRow>.generate(rowSize, (rowIndex) {
      final firstIndex = rowIndex * colSize;
      final subList =
          firstIndex + colSize <= achievements.length ? achievements.sublist(firstIndex, firstIndex + colSize) : achievements.sublist(firstIndex);
      return GridRow(
        colSize: colSize,
        gap: 5,
        items: subList
            .map(
              (item) => GestureDetector(
                child: _AchievementItem(item: item),
                onTap: () => onAchievementTapped(context, item),
              ),
            )
            .toList(),
      );
    });

    return Padding(
      padding: const EdgeInsets.all(16).copyWith(bottom: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: rows
            .map(
              (row) => rows.last == row
                  ? row
                  : Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: row,
                    ),
            )
            .toList(),
      ),
    );
  }
}

class _AchievementItem extends StatelessWidget {
  final Fragment$AchievementGroup$achievements$items item;
  const _AchievementItem({required this.item});

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
              style: BtvTextStyles.caption2.copyWith(color: BtvColors.label3),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
