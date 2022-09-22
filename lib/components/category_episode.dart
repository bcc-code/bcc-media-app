import 'package:flutter/material.dart';

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
              return Container(
                height: constraints.maxWidth * (9 / 16),
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(episode['image']!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(3.86),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(255, 255, 255, 0.1),
                  ),
                ),
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
