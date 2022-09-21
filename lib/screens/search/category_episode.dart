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
            height: itemWidth * (9 / 16),
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
