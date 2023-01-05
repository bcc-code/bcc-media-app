import 'package:brunstadtv_app/components/study_topic_card_mini.dart';
import 'package:brunstadtv_app/graphql/schema/pages.graphql.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';

import '../graphql/queries/page.graphql.dart';
import 'study_topic_card_large.dart';

class CardSection extends StatelessWidget {
  final Fragment$Section$$CardSection data;

  const CardSection(this.data, {super.key});

  Widget getCardWidget(Fragment$ItemSectionItem item) {
    final studyTopic = item.item.asOrNull<Fragment$Section$$CardSection$items$items$item$$StudyTopic>();
    if (studyTopic != null) {
      if (data.cardSize == Enum$CardSectionSize.mini) {
        return StudyTopicCardMini(
          studyTopic: studyTopic,
        );
      } else if (data.cardSize == Enum$CardSectionSize.large) {
        return StudyTopicCardLarge(studyTopic: studyTopic);
      }
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: getCardWidget(data.items.items.first));
  }
}
