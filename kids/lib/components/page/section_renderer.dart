import 'package:bccm_core/platform.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';
import 'package:kids/components/page/sections/poster_section.dart';

class SectionRenderer extends StatelessWidget {
  const SectionRenderer({
    super.key,
    required this.section,
    required this.index,
  });

  final Fragment$Section section;
  final int index;

  Widget? getWidget() {
    final posterSection = section.asOrNull<Fragment$Section$$PosterSection>();
    if (posterSection != null) {
      return PosterSection(posterSection);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final widget = getWidget();
    if (widget != null) {
      return SectionAnalytics(
        data: SectionAnalyticsData(id: section.id, position: index, type: section.$__typename, name: section.title),
        builder: (context) => widget,
      );
    }
    return const SizedBox.shrink();
  }
}
