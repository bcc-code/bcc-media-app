import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:my_app/screens/search/models/search_result_item.dart';
import '../../router/router.gr.dart';

import 'package:my_app/components/category_button.dart';
import 'episode_list.dart';

class SearchHomePage extends StatelessWidget {
  final List<Map<String, String>> _categories = [
    {
      'label': 'Series',
      'image': 'CollectionSeries.png',
    },
    {
      'label': 'Kids',
      'image': 'CollectionKids.png',
    },
    {
      'label': 'Films',
      'image': 'CollectionFilms.png',
    },
    {
      'label': 'Events',
      'image': 'CollectionEvents.png',
    },
    {
      'label': 'Music',
      'image': 'CollectionMusic.png',
    },
    {
      'label': 'Worth watching',
      'image': 'CollectionWorthWatching.png',
    },
  ];

  final _episodeList = List.filled(
      10,
      SearchResultItem(
        collection: 'episode',
        id: '1',
        title: '25. august - PROMO: Høstcamp og Romjulscamp',
        legacyID: '1',
        description: 'Test Description',
        image:
            'https://brunstadtv.imgix.net/c7b34d9c-d961-4326-9686-d480d461b54c.jpg',
        showTitle: 'Fra Kåre til BUK',
        type: ResultType.episode,
      ));

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Explore Categories',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                final buttonWidth = (constraints.maxWidth - 16) / 2;

                return Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  children: _categories.map((category) {
                    return CategoryButton(
                        width: buttonWidth,
                        label: category['label'] as String,
                        imagePath: "assets/icons/${category['image']}",
                        onTap: () {
                          context.router.navigate(
                            ExploreCategoryScreenRoute(
                                category: category['label']!),
                          );
                        });
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
      EpisodeList(title: 'Suggested', items: _episodeList),
    ]);
  }
}
