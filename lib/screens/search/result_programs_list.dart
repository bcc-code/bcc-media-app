import 'package:flutter/material.dart';

import '../../components/horizontal_slider.dart';

class ResultProgramsList extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;

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
  final Map<String, String>? itemDetails;
  final slideWidth = 140.0;

  const _Program(this.itemDetails);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16, bottom: 7),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(itemDetails!['imageUrl'] as String,
                width: slideWidth),
          ),
        ),
        SizedBox(
          width: slideWidth,
          child: Text(itemDetails!['programName']!),
        ),
      ],
    );
  }
}
