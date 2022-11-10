import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/btv_colors.dart';
import 'horizontal_slider.dart';

class LabelSection extends StatelessWidget {
  final Fragment$Section$$LabelSection data;

  const LabelSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, left: 16),
      child: HorizontalSlider(
        height: 28,
        gap: 8,
        itemCount: data.items.items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data.items.items[index];
          return _LabelItem(item);
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
    return GestureDetector(
      onTap: () => handleSectionItemClick(context, sectionItem.item),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: BtvColors.seperatorOnLight,
          ),
          borderRadius: BorderRadius.circular(24),
          color: BtvColors.background2,
        ),
        child: Text(
          sectionItem.title,
          style: BtvTextStyles.body2.copyWith(color: BtvColors.label1),
        ),
      ),
    );
  }
}
