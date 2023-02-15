import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/bccm_gradients.dart';
import '../helpers/svg_icons.dart';

enum LessonProgressTreeVariant { border2, border3 }

class LessonProgressTree extends ConsumerWidget {
  final int completed;
  final int total;
  final double innerStrokeWidth;
  final double outerStrokeWidth;
  final double arcToTreePadding;
  const LessonProgressTree({
    super.key,
    required this.completed,
    required this.total,
    required this.innerStrokeWidth,
    required this.outerStrokeWidth,
    required this.arcToTreePadding,
  });

  double get completedFraction => completed / max(1, total);

  SvgPicture get treeWidget {
    if (completedFraction == 1) {
      return SvgPicture.string(height: double.infinity, SvgIcons.taskTreeLarge);
    } else if (completedFraction >= 0.5) {
      return SvgPicture.string(height: double.infinity, SvgIcons.taskTreeMedium);
    } else {
      return SvgPicture.string(height: double.infinity, SvgIcons.taskTreeSmall);
    }
  }

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
              strokeWidth: innerStrokeWidth,
            ),
          ),
        ),
        Positioned.fill(
          child: OverflowBox(
            child: CustomPaint(
                painter: ArcPainter(
              gradient: BccmGradients.greenYellow,
              strokeWidth: outerStrokeWidth,
              progress: completedFraction,
            )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(arcToTreePadding),
          child: ShaderMask(
              shaderCallback: (bounds) {
                return BccmGradients.greenYellow.createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: treeWidget),
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
