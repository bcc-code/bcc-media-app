import 'package:flutter/material.dart';

import 'inner_bordered_image.dart';

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
              return InnerBorderedImage(
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
