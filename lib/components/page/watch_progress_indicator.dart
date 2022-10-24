import 'package:flutter/material.dart';

import '../../services/utils.dart';

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
        color: const Color.fromRGBO(13, 22, 35, 0.7),
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
                      color: const Color.fromRGBO(204, 221, 255, 0.1),
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
              getFormattedDuration(watchedDuration),
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
