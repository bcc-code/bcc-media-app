import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bmm_api/bmm_api.dart';
import 'package:brunstadtv_app/helpers/bmm/bmm_navigation.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

import '../../../misc/horizontal_slider.dart';

class BmmAchievementSection extends StatelessWidget {
  final ForbildePoints? data;

  const BmmAchievementSection(
    this.data, {
    super.key,
  });

  onAchievementTapped(BuildContext context, AchievementModel item) {}

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final achievements = data?.achievements;
    final points = data?.points;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: design.colors.background2,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16).copyWith(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).bmmBibleStudyTitle,
                      style: design.textStyles.title3,
                    ),
                    points != null
                        ? Text(
                            S.of(context).bmmBibleStudyPoints(points),
                            style: design.textStyles.body2,
                          )
                        : Container(
                            height: 16,
                            width: 64,
                            margin: const EdgeInsets.only(top: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: design.colors.separator2,
                            ),
                          ),
                  ],
                ),
                design.buttons.small(
                  onPressed: () {
                    openBmmPage('/');
                  },
                  variant: ButtonVariant.secondary,
                  labelText: 'Standings',
                )
              ],
            ),
          ),
          achievements != null
              ? HorizontalSlider(
                  height: 72,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: achievements.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = achievements[index];
                    return GestureDetector(
                      onTap: () => onAchievementTapped(context, item),
                      child: simpleFadeInImage(url: item.url ?? ''),
                    );
                  },
                )
              : const SizedBox(height: 72),
        ],
      ),
    );
  }
}
