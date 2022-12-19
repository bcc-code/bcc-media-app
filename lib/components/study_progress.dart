import 'dart:math' as math;
import 'dart:math';

import 'package:brunstadtv_app/graphql/queries/studies.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_gradients.dart';
import '../helpers/svg_icons.dart';

class LessonProgressTree extends ConsumerWidget {
  final int completed;
  final int total;
  const LessonProgressTree({super.key, required this.completed, required this.total});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: ArcPainter(
              gradient: const SweepGradient(
                startAngle: 3 * math.pi / 2,
                endAngle: 7 * math.pi / 2,
                tileMode: TileMode.repeated,
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.5),
                  Color.fromRGBO(255, 255, 255, 0.05),
                ],
              ),
              strokeWidth: 2,
            ),
          ),
        ),
        Positioned.fill(
          child: OverflowBox(
            child: CustomPaint(
                painter: ArcPainter(
              gradient: BtvGradients.greenYellow,
              strokeWidth: 3,
              progress: completed / max(1, total),
            )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: ShaderMask(
              shaderCallback: (bounds) {
                return BtvGradients.greenYellow.createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: SvgPicture.string(height: double.infinity, SvgIcons.taskTreeLarge)),
        ),
      ],
    );
  }
}

class ArcPainter extends CustomPainter {
  final double strokeWidth;
  final double progress;
  final Gradient gradient;
  ArcPainter({required this.gradient, this.strokeWidth = 2, this.progress = 1}) : super();

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(-(strokeWidth / 2), 0.0, size.width + strokeWidth, size.height + strokeWidth);

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.butt // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2);
    const startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(ArcPainter oldDelegate) {
    return true;
  }
}
