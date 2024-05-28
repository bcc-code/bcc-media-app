import 'package:brunstadtv_app/components/pages/sections/section_item_click_wrapper.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:bccm_core/platform.dart';
import '../../../../models/breakpoints.dart';
import '../../../misc/custom_grid_view.dart';
import '../icons/icon_section_button.dart';

const Map<Enum$GridSectionSize, int> _columnSize = {
  Enum$GridSectionSize.half: 2,
};

class IconGridSection extends StatelessWidget {
  final Fragment$Section$$IconGridSection data;

  const IconGridSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 12),
      child: _IconGridSectionList(
        size: data.gridSize,
        sectionItems: data.items.items,
        collectionId: data.metadata?.useContext == true && data.metadata?.collectionId != null ? data.metadata!.collectionId : null,
      ),
    );
  }
}

class _IconGridSectionList extends StatelessWidget {
  const _IconGridSectionList({
    required this.size,
    required this.sectionItems,
    this.collectionId,
  });

  final Enum$GridSectionSize size;
  final List<Fragment$ItemSectionItem> sectionItems;
  final String? collectionId;

  @override
  Widget build(BuildContext context) {
    final colSize = ResponsiveValue(
      context,
      conditionalValues: [
        const Condition.equals(name: BP.md, value: 3),
        const Condition.equals(name: BP.lg, value: 4),
        const Condition.equals(name: BP.xl, value: 5),
        const Condition.largerThan(name: BP.xl, value: 6),
      ],
      defaultValue: _columnSize[size] ?? _columnSize[Enum$GridSectionSize.half]!,
    ).value;

    return CustomGridView(
      verticalSpacing: 12,
      padding: null,
      columnCount: colSize,
      children: sectionItems
          .mapIndexed(
            (index, item) => SectionItemClickWrapper(
              item: item.item,
              collectionId: collectionId,
              analytics: SectionItemAnalyticsData(id: item.id, position: index, type: item.$__typename, name: item.title),
              child: IconSectionButton(
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
