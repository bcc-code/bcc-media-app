import 'package:brunstadtv_app/components/bordered_image_container.dart';
import 'package:flutter/material.dart';

import '../../components/icon_label_button.dart';
import '../../components/general_app_bar.dart';

class HomeExploreSubCategoryScreen extends StatelessWidget {
  final String category;
  final String parentPageName;

  HomeExploreSubCategoryScreen({
    super.key,
    required this.category,
    required this.parentPageName,
  });

  final _itemList = [
    {
      'image': 'https://brunstadtv.imgix.net/standars_animpask.jpg',
      'title': 'The Easter gospel',
      'type': 'episode',
      'showName': 'Jesus, the Saviour',
      'episodeId': 'S1:E6',
    },
    {
      'image': 'https://brunstadtv.imgix.net/SISA_serie_3.jpg',
      'title': 'Bible Stories With Sarah & Simon',
      'type': 'show',
      'episodeInfo': '6 Episodes'
    },
    {
      'image': 'https://brunstadtv.imgix.net/standars_animpask.jpg',
      'title': 'The Easter gospel',
      'type': 'episode',
      'showName': 'Jesus, the Saviour',
      'episodeId': 'S1:E6',
    },
    {
      'image': 'https://brunstadtv.imgix.net/SISA_serie_3.jpg',
      'title': 'Bible Stories With Sarah & Simon',
      'type': 'show',
      'episodeInfo': '6 Episodes'
    },
    {
      'image': 'https://brunstadtv.imgix.net/standars_animpask.jpg',
      'title': 'The Easter gospel',
      'type': 'episode',
      'showName': 'Jesus, the Saviour',
      'episodeId': 'S1:E6',
    },
    {
      'image': 'https://brunstadtv.imgix.net/SISA_serie_3.jpg',
      'title': 'Bible Stories With Sarah & Simon',
      'type': 'show',
      'episodeInfo': '6 Episodes'
    },
    {
      'image': 'https://brunstadtv.imgix.net/standars_animpask.jpg',
      'title': 'The Easter gospel',
      'type': 'episode',
      'showName': 'Jesus, the Saviour',
      'episodeId': 'S1:E6',
    },
    {
      'image': 'https://brunstadtv.imgix.net/SISA_serie_3.jpg',
      'title': 'Bible Stories With Sarah & Simon',
      'type': 'show',
      'episodeInfo': '6 Episodes'
    },
    {
      'image': 'https://brunstadtv.imgix.net/standars_animpask.jpg',
      'title': 'The Easter gospel',
      'type': 'episode',
      'showName': 'Jesus, the Saviour',
      'episodeId': 'S1:E6',
    },
    {
      'image': 'https://brunstadtv.imgix.net/SISA_serie_3.jpg',
      'title': 'Bible Stories With Sarah & Simon',
      'type': 'show',
      'episodeInfo': '6 Episodes'
    },
    {
      'image': 'https://brunstadtv.imgix.net/standars_animpask.jpg',
      'title': 'The Easter gospel',
      'type': 'episode',
      'showName': 'Jesus, the Saviour',
      'episodeId': 'S1:E6',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> leftAppBarButtons = [
      IconLabelButton(
        imagePath: 'assets/icons/Left.png',
        labelText: parentPageName,
        onPressed: () => Navigator.pop(context),
      ),
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
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: (_itemList.length / 2).ceil(),
        itemBuilder: (context, rowIndex) {
          final itemIndex = rowIndex * 2;
          return Container(
            margin: const EdgeInsets.only(top: 12, bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _itemList[itemIndex]['type'] == 'show'
                      ? _ShowItem(
                          item: _itemList[itemIndex],
                        )
                      : _EpisodeItem(item: _itemList[itemIndex]),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: itemIndex + 1 < _itemList.length
                      ? (_itemList[itemIndex + 1]['type'] == 'show'
                          ? _ShowItem(
                              item: _itemList[itemIndex + 1],
                            )
                          : _EpisodeItem(item: _itemList[itemIndex + 1]))
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

class _ShowItem extends StatelessWidget {
  final dynamic item;

  const _ShowItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BorderedImageContainer(
              image: NetworkImage(item['image']),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 2),
          child: Text(
            item['title'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          item['episodeInfo'],
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(112, 124, 142, 1),
          ),
        )
      ],
    );
  }
}

class _EpisodeItem extends StatelessWidget {
  final dynamic item;

  const _EpisodeItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BorderedImageContainer(
              image: NetworkImage(item['image']),
            ),
          ),
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                item['showName'].replaceAll(' ', '\u{000A0}'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(110, 176, 230, 1),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: Text(
                item['episodeId'],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(112, 124, 142, 1),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 2),
          child: Text(
            item['title'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
