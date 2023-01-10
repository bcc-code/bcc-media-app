import 'package:brunstadtv_app/components/bordered_image_container.dart';
import 'package:brunstadtv_app/components/pulse_animation.dart';
import 'package:brunstadtv_app/components/shiny_clipper.dart';
import 'package:brunstadtv_app/components/study_progress.dart';
import 'package:brunstadtv_app/helpers/btv_gradients.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:brunstadtv_app/graphql/queries/studies.graphql.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/btv_colors.dart';
import '../../helpers/svg_icons.dart';
import '../graphql/queries/page.graphql.dart';
import '../helpers/navigation_utils.dart';
import '../helpers/utils.dart';
import 'loading_indicator.dart';
import 'study_progress_row.dart';

class StudyTopicCardMini extends StatefulWidget {
  final Fragment$Section$$CardSection$items$items$item$$StudyTopic studyTopic;
  const StudyTopicCardMini({super.key, required this.studyTopic});

  @override
  State<StudyTopicCardMini> createState() => _StudyTopicCardMiniState();
}

class _StudyTopicCardMiniState extends State<StudyTopicCardMini> {
  Future? navigationFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? get imageUrl => widget.studyTopic.images.firstWhereOrNull((element) => element.style == 'icon')?.url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        navigationFuture = navigateToStudyTopic(context, widget.studyTopic.id);
      }),
      child: Stack(
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
                Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: BorderedImageContainer(
                        borderRadius: BorderRadius.circular(12),
                        imageUrl: imageUrl,
                      ),
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          widget.studyTopic.title,
                          style: BtvTextStyles.title3,
                        ),
                      ),
                      StudyProgressRow(
                        completed: widget.studyTopic.lessonsProgress.completed,
                        total: widget.studyTopic.lessonsProgress.total,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SvgPicture.string(
                    SvgIcons.chevronRight,
                    color: BtvColors.label3,
                    width: 9,
                    height: 17,
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
          ),
          if (navigationFuture != null)
            simpleFutureBuilder(
                future: navigationFuture!,
                loading: () =>
                    Positioned.fill(child: Container(color: BtvColors.background1.withOpacity(0.5), child: const Center(child: LoadingIndicator()))),
                error: (e) => const SizedBox.shrink(),
                noData: () => const SizedBox.shrink(),
                ready: (d) => const SizedBox.shrink()),
        ],
      ),
    );
  }
}
