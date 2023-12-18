import 'dart:math';

import 'package:flutter/material.dart';

import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';

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
        color: DesignSystem.of(context).colors.background1.withOpacity(0.7),
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
                      color: DesignSystem.of(context).colors.separatorOnLight,
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
              style: DesignSystem.of(context).textStyles.caption3.copyWith(color: DesignSystem.of(context).colors.label1),
            ),
          )
        ],
      ),
    );
  }
}
