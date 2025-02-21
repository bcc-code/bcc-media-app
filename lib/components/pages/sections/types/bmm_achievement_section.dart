import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bmm_api/bmm_api.dart';
import 'package:brunstadtv_app/helpers/bmm/bmm_navigation.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

import '../../../misc/horizontal_slider.dart';

class BmmAchievementSection extends StatelessWidget {
  final HvheProjectBox? data;

  const BmmAchievementSection(this.data, {super.key});

  onAchievementTapped(BuildContext context, AchievementModel item) async {
    final id = item.id;
    if (id != null) {
      openBmmPage('/achievement/$id');
    }
  }

  onButtonTapped(HvheProjectBox? data) {
    openBmmPage('/hvhe-standings');
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final achievements = data?.achievements;
    final points = data?.points;
    final boysPoints = data?.boysPoints;
    final girlsPoints = data?.girlsPoints;

    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: design.colors.background2,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
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
                if (boysPoints != null && girlsPoints != null)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      onButtonTapped(data);
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            color: Color.fromRGBO(103, 145, 203, 1),
                            child: Text(
                              '$boysPoints',
                              style: design.textStyles.title3.copyWith(color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            color: Color.fromRGBO(239, 73, 35, 1),
                            child: Text(
                              '$girlsPoints',
                              style: design.textStyles.title3.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          achievements != null
              ? HorizontalSlider(
                  height: 64,
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
              : const SizedBox(height: 64),
        ],
      ),
    );
  }
}
