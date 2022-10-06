import 'package:flutter/material.dart';

import '../horizontal_slider.dart';
import '../bordered_image_container.dart';

class KidsBibleStories extends StatelessWidget {
  final dynamic data;

  const KidsBibleStories({super.key, required this.data});

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
            clipBehaviour: Clip.none,
            items: (data['items'] as List<Map<String, String>>)
                .map((item) => _Item(data: item))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final Map<String, String> data;

  const _Item({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderedImageContainer(
            height: 208,
            margin: const EdgeInsets.only(bottom: 4),
            image: NetworkImage(data['image']!),
          ),
          Text(
            data['show']!,
            maxLines: 2,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
