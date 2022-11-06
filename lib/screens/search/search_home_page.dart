import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../graphql/queries/search.graphql.dart';
import '../../models/explore_category.dart';
import '../../router/router.gr.dart';

import 'package:brunstadtv_app/components/category_button.dart';
import '../../components/search_episode_list.dart';

class SearchHomePage extends StatelessWidget {
  final List<ExploreCategory> _categories = [
    ExploreCategory(
      label: 'Series',
      image: 'CollectionSeries.png',
    ),
    ExploreCategory(
      label: 'Kids',
      image: 'CollectionKids.png',
    ),
    ExploreCategory(
      label: 'Films',
      image: 'CollectionFilms.png',
    ),
    ExploreCategory(
      label: 'Events',
      image: 'CollectionEvents.png',
    ),
    ExploreCategory(
      label: 'Music',
      image: 'CollectionMusic.png',
    ),
    ExploreCategory(
      label: 'Worth watching',
      image: 'CollectionWorthWatching.png',
    ),
  ];

  final _episodeList = List.filled(
      10,
      Fragment$SearchResultItem$$EpisodeSearchItem(
        collection: 'episode',
        ageRating: 'A',
        duration: 100,
        id: '1',
        title: '25. august - PROMO: Høstcamp og Romjulscamp',
        legacyID: '1',
        description: 'Test Description',
        image:
            'https://brunstadtv.imgix.net/c7b34d9c-d961-4326-9686-d480d461b54c.jpg',
        showTitle: 'Fra Kåre til BUK',
        $__typename: 'EpisodeSearchItem',
      ));

  @override
  Widget build(BuildContext context) {
    var numCategoryRows = (_categories.length / 2).ceil();

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
                style: BtvTextStyles.title2,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(numCategoryRows, (index) {
                var itemIndex = index * 2;
                return Container(
                  margin: index + 1 == numCategoryRows
                      ? null
                      : const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: CategoryButton(
                          label: _categories[itemIndex].label,
                          assetImage: _categories[itemIndex].image,
                          margin: const EdgeInsets.only(right: 8),
                          aspectRatio: 16 / 9,
                          onTap: () {
                            context.router.navigate(
                              ExploreCategoryScreenRoute(
                                  category: _categories[itemIndex].label),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: itemIndex + 1 < _categories.length
                            ? CategoryButton(
                                label: _categories[itemIndex + 1].label,
                                assetImage: _categories[itemIndex + 1].image,
                                margin: const EdgeInsets.only(left: 8),
                                aspectRatio: 16 / 9,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                onTap: () {
                                  context.router.navigate(
                                    ExploreCategoryScreenRoute(
                                        category:
                                            _categories[itemIndex + 1].label),
                                  );
                                },
                              )
                            : Container(),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      SearchEpisodeList(title: 'Suggested', items: _episodeList),
    ]);
  }
}
