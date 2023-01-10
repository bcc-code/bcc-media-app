import 'package:flutter/material.dart';

import '../graphql/queries/achievements.graphql.dart';
import 'achievement_dialog.dart';
import 'achievement_list_item.dart';
import 'grid_row.dart';

class AchievementList extends StatelessWidget {
  const AchievementList({super.key, required this.achievements});

  final List<Fragment$Achievement> achievements;
  final colSize = 3;

  Future onAchievementTapped(BuildContext context, Fragment$Achievement item) async {
    await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => AchievementDialog(achievement: item),
    );
  }

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
                child: AchievementListItem(item: item),
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
