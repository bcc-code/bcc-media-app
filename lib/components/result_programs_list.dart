import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:brunstadtv_app/graphql/queries/search.graphql.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import 'horizontal_slider.dart';
import 'bordered_image_container.dart';

class ResultProgramsList extends StatelessWidget {
  final String title;
  final List<Fragment$SearchResultItem$$ShowSearchItem> items;

  const ResultProgramsList({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 12, right: 16, bottom: 8, left: 16),
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: BtvTextStyles.title2,
          ),
        ),
        HorizontalSlider(
          height: 140,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            var item = items[index];
            return _Program(item);
          },
        ),
      ],
    );
  }
}

class _Program extends StatelessWidget {
  final Fragment$SearchResultItem$$ShowSearchItem _item;
  final _slideWidth = 140.0;

  const _Program(this._item);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _slideWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BorderedImageContainer(imageUrl: _item.image),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(_item.title,
                style:
                    BtvTextStyles.caption1.copyWith(color: BtvColors.label1)),
          ),
        ],
      ),
    );
  }
}
