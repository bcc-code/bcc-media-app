import 'package:brunstadtv_app/helpers/btv_buttons.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/btv_colors.dart';
import '../helpers/svg_icons.dart';

class StudyTopicCardLarge extends StatelessWidget {
  StudyTopicCardLarge({super.key});

  @override
  Widget build(BuildContext context) {
    final title = 'Letter to the Hebrews';
    final description = 'What is the relevance of Judaism in the Letter to the Hebrews, and for us personally?';
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 200,
            width: double.infinity,
            child: Image(
              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Container(
            color: BtvColors.separatorOnLight,
            padding: const EdgeInsets.all(18).copyWith(top: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    title,
                    style: BtvTextStyles.title1,
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Text(description, style: BtvTextStyles.body2.copyWith(color: BtvColors.label2)),
                ),
                Container(
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
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: BtvButton.smallSecondary(
                    onPressed: () {},
                    labelText: 'Continue study',
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
