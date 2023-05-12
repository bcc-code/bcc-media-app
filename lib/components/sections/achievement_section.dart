import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/graphql/queries/achievements.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../achievements/achievement_dialog.dart';
import '../achievements/achievement_list_item.dart';
import '../horizontal_slider.dart';
import '../../graphql/queries/page.graphql.dart';

class AchievementSection extends StatelessWidget {
  final Fragment$Section$$AchievementSection data;

  const AchievementSection(this.data, {super.key});

  Future onAchievementTapped(BuildContext context, Fragment$Achievement item) async {
    await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => AchievementDialog(achievement: item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Query$getAchievementGroups$Widget(
      options: Options$Query$getAchievementGroups(
        variables: Variables$Query$getAchievementGroups(first: 40, achievementsFirst: 10),
      ),
      builder: (result, {refetch, fetchMore}) {
        if (result.isLoading) {
          return Container(
            padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
            alignment: Alignment.centerLeft,
            child: const LoadingIndicator(),
          );
        } else if (result.hasException || result.parsedData == null) {
          var errorCode =
              result.exception?.graphqlErrors.map((el) => el.extensions?['code'].asOrNull<String>()).firstWhere((element) => element != null);
          return Padding(
            padding: const EdgeInsets.all(16).copyWith(top: 6),
            child: Text('Failed to load achievements. ${errorCode == null ? '' : 'Error code: $errorCode'}'),
          );
        }
        var tempAchievements = result.parsedData?.achievementGroups.items
            .map((group) => group.achievements.items.where((element) => element.achieved))
            .expand((element) => element)
            .toList();
        if (tempAchievements?.isNotEmpty != true) {
          tempAchievements =
              result.parsedData?.achievementGroups.items.map((group) => group.achievements.items).expand((element) => element).take(10).toList();
        }
        if (tempAchievements?.isNotEmpty != true) {
          return const SizedBox.shrink();
        }

        final achievementsToDisplay = tempAchievements!;
        return HorizontalSlider(
          padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 12),
          height: 140,
          itemCount: achievementsToDisplay.length,
          itemBuilder: (BuildContext context, int index) {
            var item = achievementsToDisplay[index];
            return GestureDetector(
              onTap: () => onAchievementTapped(context, item),
              child: AchievementListItem(item: item),
            );
          },
        );
      },
    );
  }
}
