import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../category_button.dart';
import '../horizontal_slider.dart';
import '../../router/router.gr.dart';

class ExploreCategories extends StatelessWidget {
  final dynamic data;

  const ExploreCategories({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 12, left: 16),
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
            items: (data['items'] as List<Map<String, String>>)
                .map(
                  (item) => CategoryButton(
                    onTap: () {
                      context.router.navigate(
                        HomeExploreCategoryScreenRoute(
                            category: item['label']!),
                      );
                    },
                    label: item['label']!,
                    imagePath: "assets/icons/${item['image']!}",
                    width: 80,
                    margin: const EdgeInsets.only(right: 16),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
