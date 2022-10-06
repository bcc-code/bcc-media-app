import 'package:flutter/material.dart';
import 'package:brunstadtv_app/graphql/queries/search.graphql.dart';

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
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        HorizontalSlider(
          items: items.map((program) => _Program(program)).toList(),
          margin: const EdgeInsets.only(left: 16, bottom: 8),
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
            child: BorderedImageContainer(
              margin: const EdgeInsets.only(right: 16, bottom: 7),
              image: _item.image != null ? NetworkImage(_item.image!) : null,
            ),
          ),
          Text(_item.title),
        ],
      ),
    );
  }
}
