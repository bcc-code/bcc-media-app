import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PlayfulDialog extends StatelessWidget {
  const PlayfulDialog({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);

    final borderRadius = bp.smallerThan(TABLET) ? BorderRadius.circular(40) : BorderRadius.circular(56);
    return Dialog(
      insetPadding: const EdgeInsets.all(60),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: design.colors.background1,
          borderRadius: borderRadius,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: child,
          ),
        ),
      ).animate().scaleXY(begin: 0, duration: 500.ms, curve: const ElasticOutCurve(0.8)),
    );
  }
}
