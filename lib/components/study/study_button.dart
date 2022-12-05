import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/btv_colors.dart';
import '../../helpers/btv_gradients.dart';
import '../../helpers/btv_typography.dart';
import '../../helpers/svg_icons.dart';
import '../pulse_animation.dart';

class StudyMoreButton extends StatefulWidget {
  const StudyMoreButton({super.key});

  @override
  State<StudyMoreButton> createState() => _StudyMoreButtonState();
}

class _StudyMoreButtonState extends State<StudyMoreButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: BtvColors.tint1.withAlpha((255 * 0.1).round()),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: BtvColors.separatorOnLight, width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              studyProgress(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Explore more',
                      style: BtvTextStyles.title3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        'Tasks, scriptures and other related content',
                        overflow: TextOverflow.fade,
                        style: BtvTextStyles.caption1.copyWith(color: BtvColors.label3),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Stack(
                  children: [
                    const Positioned.fill(child: PulseAnimation()),
                    circleButton(),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
          child: LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.only(left: constraints.maxWidth * 0.6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ClipPath(
                  clipper: ShinyClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffccddff), Color(0xffedf2fd), Color(0x00ccddff)],
                      ).scale(0.1),
                    ),
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  Container studyProgress() {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 40,
      child: ShaderMask(
          shaderCallback: (bounds) {
            return BtvGradients.greenYellow.createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: SvgPicture.string(SvgIcons.temporaryTree)),
    );
  }

  Container circleButton() {
    return Container(
        decoration: BoxDecoration(color: Color(0xFF3D4E63), borderRadius: BorderRadius.circular(45)),
        foregroundDecoration: BoxDecoration(border: Border.all(color: BtvColors.separatorOnLight, width: 1), borderRadius: BorderRadius.circular(45)),
        width: 38,
        height: 38,
        child: Center(
            child: SvgPicture.string(
          SvgIcons.chevronRight,
          height: 11,
        )));
  }
}

class ShinyClipper extends CustomClipper<Path> {
  // Generated from svg with https://itchylabs.com/tools/path-to-bezier/
  // Slightly modified
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 150;
    const double yScaling = 1;
    path.lineTo(48.1429 * xScaling, 24.7451 * yScaling);
    path.cubicTo(
      16.9429 * xScaling,
      50.7451 * yScaling,
      3.14288 * xScaling,
      81.5785 * yScaling,
      0.142883 * xScaling,
      93.7451 * yScaling,
    );
    path.cubicTo(
      0.142883 * xScaling,
      93.7451 * yScaling,
      208.643 * xScaling,
      93.7451 * yScaling,
      208.643 * xScaling,
      93.7451 * yScaling,
    );
    path.cubicTo(
      208.643 * xScaling,
      93.7451 * yScaling,
      208.643 * xScaling,
      -24.7549 * yScaling,
      208.643 * xScaling,
      -24.7549 * yScaling,
    );
    path.cubicTo(
      208.643 * xScaling,
      -24.7549 * yScaling,
      88.1429 * xScaling,
      -24.7549 * yScaling,
      88.1429 * xScaling,
      -24.7549 * yScaling,
    );
    path.cubicTo(
      87.8095 * xScaling,
      -19.0882 * yScaling,
      79.3429 * xScaling,
      -1.25488 * yScaling,
      48.1429 * xScaling,
      24.7451 * yScaling,
    );
    path.cubicTo(
      48.1429 * xScaling,
      24.7451 * yScaling,
      48.1429 * xScaling,
      24.7451 * yScaling,
      48.1429 * xScaling,
      24.7451 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
