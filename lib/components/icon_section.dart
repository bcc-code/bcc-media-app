import 'package:brunstadtv_app/components/section_item_click_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/analytics/sections.dart';
import 'category_button.dart';
import 'horizontal_slider.dart';
import '../graphql/queries/page.graphql.dart';

class IconSection extends StatelessWidget {
  final Fragment$Section$$IconSection data;

  const IconSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalSlider(
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 12),
      height: 140,
      itemCount: data.items.items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = data.items.items[index];
        return SectionItemClickWrapper(
          item: item.item,
          analytics: SectionItemAnalytics(id: item.id, position: index, type: item.$__typename, name: item.title),
          child: CategoryButton(
            label: item.title,
            networkImage: item.image,
            width: 80,
            padding: const EdgeInsets.all(8),
          ),
        );
      },
    );
  }
}
