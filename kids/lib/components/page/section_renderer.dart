import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:brunstadtv_app/providers/inherited_data.dart';
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
      return InheritedData<SectionAnalytics>(
        inheritedData: SectionAnalytics(id: section.id, position: index, type: section.$__typename, name: section.title),
        child: (context) => widget,
      );
    }
    return const SizedBox.shrink();
  }
}
