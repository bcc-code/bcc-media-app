import 'package:flutter/material.dart';
import 'package:my_app/screens/search/category_episode.dart';
import 'package:my_app/screens/search/explore_category_sort.dart';

import '../../components/icon_label_button.dart';
import '../../components/general_app_bar.dart';
import 'models/search_result_item.dart';

class ExploreCategoryScreen extends StatelessWidget {
  final String category;

  ExploreCategoryScreen({required this.category});

  final _episodeList = List.filled(
    11,
    {
      'image':
          'https://brunstadtv.imgix.net/c7b34d9c-d961-4326-9686-d480d461b54c.jpg',
      'title': '25. august - PROMO: Høstcamp og Romjulscamp',
    },
  );

  openSortOptions(context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return ExploreCategorySort();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> leftAppBarButtons = [
      IconLabelButton(
        imagePath: 'assets/icons/Left.png',
        labelText: 'Back',
        onPressed: () => Navigator.pop(context),
      ),
    ];

    List<Widget> rightAppBarButtons = [
      GestureDetector(
        onTap: () => openSortOptions(context),
        child: Image.asset(
          'assets/icons/ExploreCategorySort.png',
          width: 24,
          height: 24,
        ),
      )
    ];

    return Scaffold(
      appBar: GeneralAppBar(
        title: Text(
          category,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17,
            color: Color.fromRGBO(254, 254, 254, 1),
          ),
        ),
        leftActions: leftAppBarButtons,
        rightActions: rightAppBarButtons,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = (constraints.maxWidth - 16 * 3) / 2;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: (_episodeList.length / 2).ceil(),
            itemBuilder: (context, rowIndex) {
              final itemIndex = rowIndex * 2;
              return Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryEpisode(
                      episode: _episodeList[itemIndex],
                      itemWidth: itemWidth,
                    ),
                    if (itemIndex + 1 < _episodeList.length)
                      CategoryEpisode(
                        episode: _episodeList[itemIndex + 1],
                        itemWidth: itemWidth,
                      )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
