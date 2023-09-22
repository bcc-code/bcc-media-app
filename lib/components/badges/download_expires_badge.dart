import 'dart:async';

import 'package:brunstadtv_app/helpers/hooks/use_interval.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../theme/design_system/design_system.dart';

class DownloadExpiresBadge extends HookWidget {
  final DateTime expiresAt;

  const DownloadExpiresBadge({super.key, required this.expiresAt});

  String getFormattedDuration(int seconds) {
    if (seconds < 60) {
      return '$seconds sec';
    } else if (seconds < 3600) {
      return '${(seconds / 60).floor()}min';
    } else if (seconds < 86400) {
      return '${(seconds / 3600).floor()}h';
    } else {
      return '${(seconds / 86400).floor()}d';
    }
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    useInterval(() {}, const Duration(seconds: 60));
    return Container(
      height: 12,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: design.colors.background1.withOpacity(0.7),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        'Expires in ${getFormattedDuration(expiresAt.difference(DateTime.now()).inSeconds)}',
        style: design.textStyles.caption3.copyWith(color: design.colors.onTint),
      ),
    );
  }
}
