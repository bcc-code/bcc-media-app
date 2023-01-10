import 'dart:math';

import 'package:flutter/material.dart';

import '../../helpers/btv_colors.dart';
import '../../helpers/btv_gradients.dart';
import '../../helpers/btv_typography.dart';
import './study_progress.dart';

class StudyProgressRow extends StatelessWidget {
  final int completed;
  final int total;
  const StudyProgressRow({super.key, required this.completed, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: LessonProgressTree(
            completed: completed,
            total: total,
            outerStrokeWidth: 2,
            innerStrokeWidth: 1.7,
            arcToTreePadding: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6, right: 12),
          child: Text(
            '$completed/$total',
            style: BtvTextStyles.caption1.copyWith(color: BtvColors.label1),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: BtvColors.separatorOnLight,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: completed / max(1, total),
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    gradient: BtvGradients.greenYellow,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
