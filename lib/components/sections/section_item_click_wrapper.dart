import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../graphql/queries/page.graphql.dart';
import '../../helpers/extensions.dart';
import '../../helpers/navigation/navigation_utils.dart';
import '../../models/analytics/sections.dart';
import '../../providers/inherited_data.dart';
import '../../helpers/watch_progress_bottom_sheet.dart';

class SectionItemClickWrapper extends ConsumerWidget {
  const SectionItemClickWrapper({super.key, required this.item, required this.child, required this.analytics, this.collectionId});

  final Fragment$ItemSectionItem$item item;
  final SectionItemAnalytics analytics;
  final Widget child;
  final String? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InheritedData<SectionItemAnalytics>(
      inheritedData: analytics,
      child: (context) {
        // Important that the inheriteddata is in the context
        void onPressed() => handleSectionItemClick(context, item, collectionId: collectionId);
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onLongPress: () {
            var episode = item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
            if (episode == null) {
              return;
            }
            showWatchProgressBottomSheet(context, ref, episode.id, episode.progress);
          },
          onTap: onPressed,
          child: FocusableActionDetector(
            mouseCursor: MaterialStateMouseCursor.clickable,
            actions: {
              ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) => onPressed()),
            },
            child: child,
          ),
        );
      },
    );
  }
}
