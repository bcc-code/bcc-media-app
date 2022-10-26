import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../graphql/queries/page.graphql.dart';
import 'horizontal_slider.dart';

class LabelSection extends StatelessWidget {
  final Fragment$Section$$LabelSection data;

  const LabelSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, left: 16),
      child: HorizontalSlider(
        gap: 8,
        items: data.items.items.map((item) => _LabelItem(item)).toList(),
      ),
    );
  }
}

class _LabelItem extends StatelessWidget {
  final Fragment$Section$$LabelSection$items$items sectionItem;

  const _LabelItem(this.sectionItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (sectionItem.item
            is Fragment$Section$$LabelSection$items$items$item$$Page) {
          final pageItem = sectionItem.item
              as Fragment$Section$$LabelSection$items$items$item$$Page;
          context.router.navigate(PageScreenRoute(pageCode: pageItem.code));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color.fromRGBO(204, 221, 255, 0.1),
          ),
          borderRadius: BorderRadius.circular(24),
          color: const Color.fromRGBO(29, 40, 56, 1),
        ),
        child: Text(
          sectionItem.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
