import 'package:brunstadtv_app/models/analytics/achievement_clicked.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/queries/achievements.graphql.dart';
import 'achievement_dialog.dart';
import 'achievement_list_item.dart';
import 'grid_row.dart';

class AchievementList extends ConsumerWidget {
  const AchievementList({super.key, required this.achievements});

  final List<Fragment$Achievement> achievements;
  final colSize = 3;

  Future onAchievementTapped(BuildContext context, WidgetRef ref, Fragment$Achievement item) async {
    if (!item.achieved) {
      return;
    }
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => AchievementDialog(achievement: item),
    );
    final index = achievements.indexOf(item);
    ref.read(analyticsProvider).achievementClicked(AchievementClickedEvent(elementTitle: item.title, elementPosition: index));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rowSize = (achievements.length / colSize).ceil();

    final rows = List<GridRow>.generate(rowSize, (rowIndex) {
      final firstIndex = rowIndex * colSize;
      final subList =
          firstIndex + colSize <= achievements.length ? achievements.sublist(firstIndex, firstIndex + colSize) : achievements.sublist(firstIndex);
      return GridRow(
        columnCount: colSize,
        gap: 5,
        items: subList
            .map(
              (item) => GestureDetector(
                child: AchievementListItem(item: item),
                onTap: () => onAchievementTapped(context, ref, item),
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
