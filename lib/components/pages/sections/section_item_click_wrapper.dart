import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bccm_core/platform.dart';
import 'package:bccm_core/bccm_core.dart';
import '../../../helpers/router/router_utils.dart';
import '../../../helpers/watch_progress_bottom_sheet.dart';

class SectionItemClickWrapper extends ConsumerWidget {
  const SectionItemClickWrapper({super.key, required this.item, required this.child, required this.analytics, this.collectionId});

  final Fragment$ItemSectionItem$item item;
  final SectionItemAnalyticsData analytics;
  final Widget child;
  final String? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SectionItemAnalytics(
      data: analytics,
      builder: (context) {
        // Important that the inheriteddata is in the context
        void onPressed() => handleSectionItemClick(context, item, collectionId: collectionId);
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onLongPress: () {
            var episode = item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
            if (episode == null) {
              return;
            }
            context.router.push(TrackScreenRoute());
            //showWatchProgressBottomSheet(context, ref, episode.id, episode.progress);
          },
          onTap: onPressed,
          child: FocusableActionDetector(
            mouseCursor: WidgetStateMouseCursor.clickable,
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
