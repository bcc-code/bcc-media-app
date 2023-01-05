import 'package:brunstadtv_app/components/study_progress_row.dart';
import 'package:brunstadtv_app/helpers/btv_buttons.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/helpers/image_utils.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/navigation_utils.dart';
import '../helpers/svg_icons.dart';
import '../helpers/utils.dart';
import '../l10n/app_localizations.dart';
import 'loading_indicator.dart';

class StudyTopicCardLarge extends StatefulWidget {
  final Fragment$Section$$CardSection$items$items$item$$StudyTopic studyTopic;
  const StudyTopicCardLarge({super.key, required this.studyTopic});

  @override
  State<StudyTopicCardLarge> createState() => _StudyTopicCardLargeState();
}

class _StudyTopicCardLargeState extends State<StudyTopicCardLarge> {
  Future? navigationFuture;

  String? get imageUrl => widget.studyTopic.images.firstWhereOrNull((element) => element.style == 'featured')?.url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: imageUrl == null ? const SizedBox.shrink() : simpleFadeInImage(url: imageUrl!),
              ),
              Container(
                color: BtvColors.separatorOnLight,
                padding: const EdgeInsets.all(18).copyWith(top: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.studyTopic.title,
                      textAlign: TextAlign.left,
                      style: BtvTextStyles.title1,
                    ),
                    if (widget.studyTopic.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          widget.studyTopic.description,
                          textAlign: TextAlign.left,
                          style: BtvTextStyles.body2.copyWith(color: BtvColors.label2),
                        ),
                      ),
                    Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child:
                            StudyProgressRow(completed: widget.studyTopic.lessonsProgress.completed, total: widget.studyTopic.lessonsProgress.total)),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: BtvButton.smallSecondary(
                        onPressed: () => setState(() {
                          navigationFuture = navigateToStudyTopic(context, widget.studyTopic.id);
                        }),
                        labelText: widget.studyTopic.lessonsProgress.completed > 0 ? S.of(context).continueStudy : S.of(context).startStudy,
                        imagePath: 'assets/icons/Play.png',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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
    );
  }

  final _divider = SizedBox(
    height: 18,
    child: VerticalDivider(
      color: BtvColors.separatorOnLight.withOpacity(0.1),
      width: 9,
      thickness: 1,
    ),
  );
}

class _InfoLabel extends StatelessWidget {
  final Widget icon;
  final String label;

  const _InfoLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(margin: const EdgeInsets.only(right: 2), child: icon),
        Flexible(
          child: Text(
            label,
            style: BtvTextStyles.caption3.copyWith(color: BtvColors.label3),
          ),
        )
      ],
    );
  }
}
