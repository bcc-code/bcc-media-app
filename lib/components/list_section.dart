import 'package:flutter/material.dart';

import '../graphql/queries/page.graphql.dart';
import 'search_episode_list.dart';

class ListSection extends StatelessWidget {
  final Fragment$Section$$ListSection data;

  const ListSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final sectionItems = data.items.items.map((i) => i.item).whereType<Fragment$Section$$ListSection$items$items$item$$Episode>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: EpisodeList(
        items: sectionItems
            .map(
              (e) => EpisodeListEpisodeData(
                  id: e.id, showTitle: e.season?.$show.title, ageRating: e.ageRating, duration: e.duration, title: e.title, image: e.image),
            )
            .toList(),
      ),
    );
  }
}
