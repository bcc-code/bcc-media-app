import 'package:brunstadtv_app/components/sections/section_item_click_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../graphql/queries/page.graphql.dart';
import '../../theme/design_system/design_system.dart';

import '../../models/analytics/sections.dart';
import '../horizontal_slider.dart';

class LabelSection extends StatelessWidget {
  final Fragment$Section$$LabelSection data;

  const LabelSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: HorizontalSlider(
        padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16),
        height: 28,
        gap: 8,
        itemCount: data.items.items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data.items.items[index];
          return SectionItemClickWrapper(
            item: item.item,
            analytics: SectionItemAnalytics(id: item.id, position: index, type: item.$__typename, name: item.title),
            child: _LabelItem(item),
          );
        },
      ),
    );
  }
}

class _LabelItem extends StatelessWidget {
  final Fragment$ItemSectionItem sectionItem;

  const _LabelItem(this.sectionItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: DesignSystem.of(context).colors.separatorOnLight,
        ),
        borderRadius: BorderRadius.circular(24),
        color: DesignSystem.of(context).colors.background2,
      ),
      child: Text(
        sectionItem.title,
        style: DesignSystem.of(context).textStyles.body2.copyWith(color: DesignSystem.of(context).colors.label1),
      ),
    );
  }
}
