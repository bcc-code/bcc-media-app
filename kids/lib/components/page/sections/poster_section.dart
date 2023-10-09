import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/sections.graphql.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:brunstadtv_app/providers/inherited_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kids/components/page/sections/poster_large.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PosterSection extends StatelessWidget {
  final Fragment$Section$$PosterSection data;

  const PosterSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final bp = ResponsiveBreakpoints.of(context);
    final double sectionSpacing = bp.smallerThan(TABLET) ? 20 : 28;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: data.items.items.asMap().entries.map(
        (kv) {
          final cardSectionItem = kv.value;
          return SizedBox(
            child: Padding(
              padding: kv.key == data.items.items.length - 1 ? EdgeInsets.zero : EdgeInsets.only(right: sectionSpacing),
              child: InheritedData<SectionItemAnalytics>(
                inheritedData: SectionItemAnalytics(
                    position: kv.key, id: cardSectionItem.id, type: cardSectionItem.item.$__typename, name: cardSectionItem.title),
                child: (context) {
                  if (data.size == Enum$SectionSize.medium) {
                    return PosterLarge(item: cardSectionItem);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
