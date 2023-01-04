import 'package:brunstadtv_app/components/study_progress_row.dart';
import 'package:brunstadtv_app/helpers/btv_buttons.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/helpers/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/svg_icons.dart';
import '../l10n/app_localizations.dart';

class StudyTopicCardLarge extends StatelessWidget {
  final Fragment$Section$$CardSection$items$items$item$$StudyTopic studyTopic;
  StudyTopicCardLarge({super.key, required this.studyTopic});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: studyTopic.image == null ? const SizedBox.shrink() : simpleFadeInImage(url: studyTopic.image!),
          ),
          Container(
            color: BtvColors.separatorOnLight,
            padding: const EdgeInsets.all(18).copyWith(top: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  studyTopic.title,
                  textAlign: TextAlign.left,
                  style: BtvTextStyles.title1,
                ),
                if (studyTopic.description.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      studyTopic.description,
                      textAlign: TextAlign.left,
                      style: BtvTextStyles.body2.copyWith(color: BtvColors.label2),
                    ),
                  ),
                /* Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 2,
                        child: _InfoLabel(icon: SvgPicture.string(SvgIcons.studyVideos, color: BtvColors.label3), label: '20 Videos'),
                      ),
                      _divider,
                      Flexible(
                        flex: 2,
                        child: _InfoLabel(icon: SvgPicture.string(SvgIcons.studyTasks, color: BtvColors.label3), label: '5 Tasks'),
                      ),
                      _divider,
                      Flexible(
                        flex: 2,
                        child: _InfoLabel(icon: SvgPicture.string(SvgIcons.studyPosters, color: BtvColors.label3), label: '5 Tasks'),
                      ),
                      _divider,
                      Flexible(
                        flex: 3,
                        child: _InfoLabel(icon: SvgPicture.string(SvgIcons.studyResources, color: BtvColors.label3), label: '50 Resources'),
                      ),
                    ],
                  ),
                ), */
                Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: StudyProgressRow(completed: studyTopic.tasksProgress.completed, total: studyTopic.tasksProgress.total)),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  alignment: Alignment.centerRight,
                  child: BtvButton.smallSecondary(
                    onPressed: () {},
                    labelText: studyTopic.tasksProgress.completed > 0 ? S.of(context).continueStudy : S.of(context).startStudy,
                    imagePath: 'assets/icons/Play.png',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
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
