import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class CategoryEpisode extends StatelessWidget {
  final double itemWidth;
  Map<String, String> episode;

  CategoryEpisode({required this.episode, required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3.86),
              child: Image.network(episode['image']!),
            ),
          ),
          Container(
            // color: Colors.lightBlue,
            child: Text(
              episode['title']!,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
