import 'package:flutter/material.dart';

import '../horizontal_slider.dart';
import '../inner_bordered_image.dart';

class ContinueWatching extends StatelessWidget {
  final dynamic data;
  final bool small;

  const ContinueWatching({super.key, required this.data, this.small = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 19, bottom: 12, left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Text(
              data['title'] as String,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          HorizontalSlider(
            items: (data['items'] as List<Map<String, dynamic>>)
                .map((item) => _Item(small: small, data: item))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool small;
  final double imageHeight;

  const _Item({super.key, required this.data, this.small = false})
      : imageHeight = small ? 80 : 208;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InnerBorderedImage(
            height: imageHeight,
            margin: const EdgeInsets.only(bottom: 4),
            image: NetworkImage(data['image']!),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    data['show'].replaceAll(' ', '\u{000A0}'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(110, 176, 230, 1),
                    ),
                  ),
                ),
                if (data['date'] != null)
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: Text(
                      data['date'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(112, 124, 142, 1),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Text(data['episode'],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
