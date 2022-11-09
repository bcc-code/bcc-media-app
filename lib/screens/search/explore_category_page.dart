import 'package:brunstadtv_app/components/bottom_sheet_select.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:flutter/material.dart';

import '../../components/bordered_image_container.dart';
import '../../components/general_app_bar.dart';
import '../../components/option_list.dart';
import '../../helpers/btv_buttons.dart';
import '../../helpers/btv_colors.dart';
import '../../l10n/app_localizations.dart';

class ExploreCategoryScreen extends StatefulWidget {
  final String category;

  ExploreCategoryScreen({required this.category});

  @override
  State<ExploreCategoryScreen> createState() => _ExploreCategoryScreenState();
}

class _ExploreCategoryScreenState extends State<ExploreCategoryScreen> {
  final _episodeList = List.filled(
    11,
    {
      'image':
          'https://brunstadtv.imgix.net/c7b34d9c-d961-4326-9686-d480d461b54c.jpg',
      'title': '25. august - PROMO: Høstcamp og Romjulscamp',
    },
  );

  _openSortOptions(context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return BottomSheetSelect(
          title: S.of(context).sortBy,
          items: [
            Option(id: 'recently_published', title: 'Recently published'),
            Option(id: 'a_z', title: 'A - Z'),
          ],
          selectedId: 'recently_published',
          onSelectionChanged: (val) {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> leftAppBarButtons = [
      BtvButton(
        imagePath: 'assets/icons/Left.png',
        labelText: 'Back',
        onPressed: () => Navigator.pop(context),
      ),
    ];

    List<Widget> rightAppBarButtons = [
      GestureDetector(
        onTap: () => _openSortOptions(context),
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
          widget.category,
          style: BtvTextStyles.title3,
        ),
        leftActions: leftAppBarButtons,
        rightActions: rightAppBarButtons,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: (_episodeList.length / 2).ceil(),
        itemBuilder: (context, rowIndex) {
          final itemIndex = rowIndex * 2;
          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _CategoryEpisode(
                    episode: _episodeList[itemIndex],
                    margin: const EdgeInsets.only(right: 8),
                  ),
                ),
                Expanded(
                  child: itemIndex + 1 < _episodeList.length
                      ? _CategoryEpisode(
                          episode: _episodeList[itemIndex + 1],
                          margin: const EdgeInsets.only(left: 8),
                        )
                      : Container(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryEpisode extends StatelessWidget {
  EdgeInsetsGeometry margin;
  Map<String, String> episode;

  _CategoryEpisode({
    required this.episode,
    this.margin = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          BorderedImageContainer(height: 100, imageUrl: episode['image']),
          Text(
            episode['title']!,
            style: BtvTextStyles.caption1.copyWith(color: BtvColors.label1),
          ),
        ],
      ),
    );
  }
}
