import 'package:flutter/material.dart';

import 'bordered_image_container.dart';

class CategoryEpisode extends StatelessWidget {
  EdgeInsetsGeometry margin;
  Map<String, String> episode;

  CategoryEpisode({
    required this.episode,
    this.margin = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return BorderedImageContainer(
                height: constraints.maxWidth * (9 / 16),
                margin: const EdgeInsets.only(bottom: 4),
                image: episode['image'] != null
                    ? NetworkImage(episode['image']!)
                    : null,
              );
            },
          ),
          Text(
            episode['title']!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
