import 'package:brunstadtv_app/components/pages/sections/section_item_click_wrapper.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../graphql/queries/page.graphql.dart';
import '../../../episode/list/episode_list_episode.dart';

class ListSection extends StatelessWidget {
  final Fragment$Section$$ListSection data;

  const ListSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final sectionItems = data.items.items.map((i) => i.item).whereType<Fragment$Section$$ListSection$items$items$item$$Episode>().toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: sectionItems
            .asMap()
            .entries
            .map(
              (kv) => SectionItemClickWrapper(
                item: kv.value,
                analytics: SectionItemAnalytics(id: kv.value.id, position: kv.key, type: kv.value.$__typename, name: kv.value.title),
                child: EpisodeListEpisode(
                  showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
                  id: kv.value.id,
                  showTitle: kv.value.season?.$show.title,
                  ageRating: kv.value.ageRating,
                  duration: kv.value.duration,
                  title: kv.value.title,
                  image: kv.value.image,
                  publishDate: kv.value.publishDate,
                  locked: kv.value.locked,
                  progress: kv.value.progress,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
