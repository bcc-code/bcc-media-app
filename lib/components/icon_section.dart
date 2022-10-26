import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'category_button.dart';
import 'horizontal_slider.dart';
import '../router/router.gr.dart';
import '../graphql/queries/page.graphql.dart';

class IconSection extends StatelessWidget {
  final Fragment$Section$$IconSection data;

  const IconSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final sectionItems = data.items.items;
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 12, left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.title != null)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                data.title!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          HorizontalSlider(
            items: sectionItems.map((item) {
              return CategoryButton(
                onTap: () {
                  if (item.item
                      is Fragment$Section$$IconSection$items$items$item$$Page) {
                    final pageItem = item.item
                        as Fragment$Section$$IconSection$items$items$item$$Page;
                    context.router.navigate(
                      PageScreenRoute(pageCode: pageItem.code),
                    );
                  }
                },
                label: item.title,
                networkImage: item.image,
                width: 80,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
