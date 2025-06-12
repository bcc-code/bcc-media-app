import 'package:bccm_core/platform.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';
import 'package:kids/components/page/sections/default_grid_section.dart';
import 'package:kids/components/page/sections/poster_section.dart';

class SectionRenderer extends StatelessWidget {
  const SectionRenderer({
    super.key,
    required this.section,
    this.extraItems,
  });

  final Fragment$Section section;
  final List<Fragment$ItemSectionItem>? extraItems;

  @override
  Widget build(BuildContext context) {
    if (section.asOrNull<Fragment$ItemSection>()?.items.items.isEmpty == true) {
      return const SizedBox.shrink();
    }

    final posterSection = section.asOrNull<Fragment$Section$$PosterSection>();
    if (posterSection != null) {
      return PosterSection(posterSection);
    }

    var defaultGridSection = section.asOrNull<Fragment$Section$$DefaultGridSection>();
    if (defaultGridSection != null) {
      defaultGridSection = defaultGridSection.copyWith(
        items: defaultGridSection.items.copyWith(items: [
          ...defaultGridSection.items.items,
          ...(extraItems?.whereType<Fragment$Section$$DefaultGridSection$items$items>().toList() ?? [])
        ]),
      );
      return DefaultGridSection(defaultGridSection);
    }

    return const SizedBox.shrink();
  }
}
