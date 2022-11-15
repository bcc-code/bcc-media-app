import 'package:brunstadtv_app/components/search_episode_list.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'category_button.dart';
import 'horizontal_slider.dart';
import '../router/router.gr.dart';
import '../graphql/queries/page.graphql.dart';

class ListSection extends StatelessWidget {
  final Fragment$Section$$ListSection data;

  const ListSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final sectionItems = data.items.items.map((i) => i.item).whereType<Fragment$Section$$ListSection$items$items$item$$Episode>();
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.title != null)
            Container(
              child: Text(
                data.title!,
                style: BtvTextStyles.title2,
              ),
            ),
          EpisodeList(
            items: sectionItems
                .map(
                  (e) => EpisodeListEpisodeData(
                      id: e.id, showTitle: e.season?.$show.title, ageRating: e.ageRating, duration: e.duration, title: e.title, image: e.image),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
