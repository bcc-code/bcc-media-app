import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/extensions.dart';
import '../helpers/navigation/navigation_utils.dart';
import '../models/analytics/sections.dart';
import '../providers/inherited_data.dart';
import '../helpers/watch_progress_bottom_sheet.dart';

class SectionItemClickWrapper extends ConsumerWidget {
  const SectionItemClickWrapper({super.key, required this.item, required this.child, required this.analytics});

  final Fragment$ItemSectionItem$item item;
  final SectionItemAnalytics analytics;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InheritedData<SectionItemAnalytics>(
      inheritedData: analytics,
      child: (context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onLongPress: () {
          var episode = item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
          if (episode == null) {
            return;
          }
          showWatchProgressBottomSheet(context, ref, episode.id, episode.progress);
        },
        onTap: () => handleSectionItemClick(context, item),
        child: FocusableActionDetector(
          mouseCursor: MaterialStateMouseCursor.clickable,
          child: child,
        ),
      ),
    );
  }
}
