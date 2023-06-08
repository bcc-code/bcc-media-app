import 'package:brunstadtv_app/components/study/study_topic_card_mini.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../graphql/queries/page.graphql.dart';
import '../../graphql/schema/sections.graphql.dart';
import '../../providers/inherited_data.dart';
import '../study/study_topic_card_large.dart';

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
    final cardSectionItem = data.items.items.first;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 12),
      child: InheritedData<SectionItemAnalytics>(
        inheritedData: SectionItemAnalytics(position: 0, id: cardSectionItem.id, type: cardSectionItem.item.$__typename, name: cardSectionItem.title),
        child: (context) => getCardWidget(cardSectionItem),
      ),
    );
  }
}
