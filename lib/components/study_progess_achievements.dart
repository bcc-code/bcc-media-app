import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../helpers/svg_icons.dart';
import 'grid_row.dart';

class StudyProgressAchievements extends StatelessWidget {
  final items = [
    {'numLessons': 1, 'enabled': true},
    {'numLessons': 5, 'enabled': false},
    {'numLessons': 10, 'enabled': false},
    {'numLessons': 25, 'enabled': false},
    {'numLessons': 50, 'enabled': false},
    {'numLessons': 100, 'enabled': false},
    {'numLessons': 150, 'enabled': false},
  ];
  final colSize = 3;

  StudyProgressAchievements({super.key});

  void onSeeAllTapped() {}

  void onAchievementTapped(item) {}

  @override
  Widget build(BuildContext context) {
    final rowSize = (items.length / colSize).ceil();

    final rows = List<GridRow>.generate(rowSize, (rowIndex) {
      final firstIndex = rowIndex * colSize;
      final subList = firstIndex + colSize <= items.length ? items.sublist(firstIndex, firstIndex + colSize) : items.sublist(firstIndex);
      return GridRow(
        colSize: colSize,
        gap: 5,
        items: subList
            .map<Widget>(
              (item) => GestureDetector(
                child: _AchievementItem(item: item),
                onTap: () => onAchievementTapped(item),
              ),
            )
            .toList(),
      );
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, right: 16, bottom: 5, left: 16),
          child: Row(children: [
            const Text('Progress achievements', style: BtvTextStyles.title2),
            Expanded(
              child: GestureDetector(
                onTap: onSeeAllTapped,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('See All', style: BtvTextStyles.button2),
                    SvgPicture.string(SvgIcons.right),
                  ],
                ),
              ),
            ),
          ]),
        ),
        Padding(
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
        ),
      ],
    );
  }
}

class _AchievementItem extends StatelessWidget {
  final Map<String, dynamic> item;
  const _AchievementItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: item['enabled'] ? 1 : 0.3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: ClipOval(child: Image.asset('assets/icons/app_icon.png')),
            ),
            Text(
              "${item['numLessons']} lesson${item['numLessons'] == 1 ? '' : 's'} completed",
              style: BtvTextStyles.caption2.copyWith(color: BtvColors.label3),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
