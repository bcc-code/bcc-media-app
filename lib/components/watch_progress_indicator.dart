import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';
import '../services/utils.dart';

class WatchProgressIndicator extends StatelessWidget {
  final int totalDuration;
  final int watchedDuration;

  WatchProgressIndicator({
    required this.totalDuration,
    required this.watchedDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      decoration: BoxDecoration(
        color: BtvColors.background1.withOpacity(0.7),
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
                      color: BtvColors.separatorOnLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: watchedDuration / totalDuration,
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
              style: BtvTextStyles.caption3.copyWith(color: BtvColors.label1),
            ),
          )
        ],
      ),
    );
  }
}
