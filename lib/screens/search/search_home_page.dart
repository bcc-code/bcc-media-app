import 'package:flutter/material.dart';
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

  final _episodeList = List.filled(10, {
    'programName': 'Fra Kåre til BUK',
    'episodeName': '25. august - PROMO: Høstcamp og Romjulscamp',
    'imageUrl':
        'https://brunstadtv.imgix.net/c7b34d9c-d961-4326-9686-d480d461b54c.jpg',
    'ageGroup': '12+',
    'duration': '43 min',
  });

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
            Center(
              child: Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: _categories.map((category) {
                  return CategoryButton(
                    label: category['label'] as String,
                    icon: Image.asset("assets/icons/${category['image']}",
                        width: 64, height: 64),
                    width: 163.5,
                    padding: 14,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      EpisodeList(title: 'Suggested', items: _episodeList),
    ]);
  }
}
