import 'package:brunstadtv_app/components/section_item_click_wrapper.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../graphql/queries/page.graphql.dart';
import '../graphql/schema/pages.graphql.dart';
import 'custom_grid_view.dart';
import 'category_button.dart';

const Map<Enum$GridSectionSize, int> _columnSize = {
  Enum$GridSectionSize.half: kIsWeb ? 8 : 2,
};

class IconGridSection extends StatelessWidget {
  final Fragment$Section$$IconGridSection data;

  const IconGridSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 12),
      child: _IconGridSectionList(size: data.gridSize, sectionItems: data.items.items),
    );
  }
}

class _IconGridSectionList extends StatelessWidget {
  const _IconGridSectionList({required this.size, required this.sectionItems});

  final Enum$GridSectionSize size;
  final List<Fragment$ItemSectionItem> sectionItems;

  @override
  Widget build(BuildContext context) {
    final colSize = _columnSize[size] ?? _columnSize[Enum$GridSectionSize.half]!;

    return CustomGridView(
      verticalSpacing: 12,
      padding: null,
      columnCount: colSize,
      children: sectionItems
          .mapIndexed(
            (index, item) => SectionItemClickWrapper(
              item: item.item,
              analytics: SectionItemAnalytics(id: item.id, position: index, type: item.$__typename, name: item.title),
              child: CategoryButton(
                label: item.title,
                networkImage: item.image,
                width: 80,
                aspectRatio: 16 / 9,
                padding: const EdgeInsets.all(8),
              ),
            ),
          )
          .toList(),
    );
  }
}
