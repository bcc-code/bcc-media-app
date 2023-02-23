import 'dart:math';

import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:flutter/material.dart';

import '../theme/bccm_colors.dart';
import '../services/utils.dart';

class WatchProgressIndicator extends StatelessWidget {
  final int totalDuration;
  final int watchedDuration;

  const WatchProgressIndicator({
    super.key,
    required this.totalDuration,
    required this.watchedDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      decoration: BoxDecoration(
        color: BccmColors.background1.withOpacity(0.7),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(4),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: BccmColors.separatorOnLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: watchedDuration / max(1, totalDuration),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text(
              getFormattedDuration(totalDuration),
              style: BccmTextStyles.caption3.copyWith(color: BccmColors.label1),
            ),
          )
        ],
      ),
    );
  }
}
