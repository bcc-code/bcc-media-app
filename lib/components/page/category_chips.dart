import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../horizontal_slider.dart';

class CategoryChips extends StatelessWidget {
  final dynamic data;
  final String parentPageName;

  const CategoryChips(
      {super.key, required this.data, required this.parentPageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, left: 16),
      child: HorizontalSlider(
        items: (data['items'] as List<String>)
            .map((item) => _Item(
                  item: item,
                  parentPageName: parentPageName,
                ))
            .toList(),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String item;
  final String parentPageName;

  const _Item({required this.item, required this.parentPageName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.navigate(
        HomeExploreSubCategoryScreenRoute(
          category: item,
          parentPageName: parentPageName,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color.fromRGBO(204, 221, 255, 0.1),
          ),
          borderRadius: BorderRadius.circular(24),
          color: const Color.fromRGBO(29, 40, 56, 1),
        ),
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
