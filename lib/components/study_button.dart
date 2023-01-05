import 'package:brunstadtv_app/graphql/queries/studies.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/btv_colors.dart';
import '../../helpers/btv_gradients.dart';
import '../../helpers/btv_typography.dart';
import '../../helpers/svg_icons.dart';
import './pulse_animation.dart';
import './shiny_clipper.dart';
import './study_progress.dart';

class StudyMoreButton extends StatefulWidget {
  final Fragment$LessonProgressOverview progressOverview;
  const StudyMoreButton({super.key, required this.progressOverview});

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

  int get total => widget.progressOverview.progress.total;
  int get completed => widget.progressOverview.progress.completed;

  String get title {
    if (completed < total) {
      return '$completed / $total tasks completed';
    }
    return 'Discover more';
  }

  String get secondaryTitle {
    if (completed < total) {
      return 'Complete task and discover related resources';
    }
    return 'Find more inspiration and insight from related resources.';
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
                    Text(
                      title,
                      style: BtvTextStyles.title3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        secondaryTitle,
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
      margin: const EdgeInsets.only(right: 12),
      width: 42,
      height: 42,
      child: LessonProgressTree(
        completed: widget.progressOverview.progress.completed,
        total: widget.progressOverview.progress.total,
        outerStrokeWidth: 3,
        innerStrokeWidth: 1.7,
        arcToTreePadding: 8,
      ),
    );
  }

  Container circleButton() {
    return Container(
        decoration: BoxDecoration(color: const Color(0xFF3D4E63), borderRadius: BorderRadius.circular(45)),
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
