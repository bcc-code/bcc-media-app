import 'package:brunstadtv_app/components/pages/sections/cards/generic_card_large.dart';
import 'package:brunstadtv_app/components/pages/sections/cards/study_topic_card_mini.dart';
import 'package:bccm_core/utils/primitive_extensions.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../graphql/queries/page.graphql.dart';
import '../../../../graphql/schema/sections.graphql.dart';
import '../../../../providers/inherited_data.dart';
import '../cards/generic_card_mini.dart';
import '../cards/study_topic_card_large.dart';

class CardSection extends StatelessWidget {
  final Fragment$Section$$CardSection data;

  const CardSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.items.items.asMap().entries.map(
          (kv) {
            final cardSectionItem = kv.value;
            return Padding(
              padding: kv.key == data.items.items.length - 1 ? EdgeInsets.zero : const EdgeInsets.only(bottom: 8),
              child: InheritedData<SectionItemAnalytics>(
                inheritedData: SectionItemAnalytics(
                    position: kv.key, id: cardSectionItem.id, type: cardSectionItem.item.$__typename, name: cardSectionItem.title),
                child: (context) {
                  final studyTopic = cardSectionItem.item.asOrNull<Fragment$Section$$CardSection$items$items$item$$StudyTopic>();
                  if (studyTopic != null) {
                    if (data.cardSize == Enum$CardSectionSize.mini) {
                      return StudyTopicCardMini(studyTopic: studyTopic);
                    } else if (data.cardSize == Enum$CardSectionSize.large) {
                      return StudyTopicCardLarge(studyTopic: studyTopic);
                    }
                  }
                  if (data.cardSize == Enum$CardSectionSize.large) {
                    return GenericCardLarge(item: cardSectionItem);
                  } else if (data.cardSize == Enum$CardSectionSize.mini) {
                    return GenericCardMini(item: cardSectionItem);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
