import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/helpers/event_bus.dart';
import 'package:brunstadtv_app/models/events/watch_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/utils.dart';
import '../models/analytics/sections.dart';
import '../providers/inherited_data.dart';
import 'bottom_sheet_select.dart';
import 'option_list.dart';

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
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onLongPress: () {
            var episode = item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
            if (episode?.progress == null || episode!.progress == 0) {
              return;
            }
            HapticFeedback.heavyImpact();
            showModalBottomSheet(
              useRootNavigator: true,
              context: context,
              builder: (ctx) => BottomSheetSelect(
                title: 'Options',
                selectedId: 'fromStart',
                items: [
                  Option(
                    id: 'remove_progress',
                    title: 'Remove watch progress',
                    disabled: episode.progress == null || episode.progress == 0,
                    icon: Image.asset(width: 24, height: 24, 'assets/icons/Close.png', gaplessPlayback: true),
                  )
                ],
                showSelection: false,
                onSelectionChanged: (id) {
                  if (id == 'remove_progress') {
                    ref.read(apiProvider).updateProgress(episodeId: episode.id, progress: null);
                    globalEventBus.fire(WatchProgressUpdatedEvent(episodeId: episode.id, progress: null));
                  } else {}
                },
              ),
            );
          },
          onTap: () {
            var episode = item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
            if (episode?.locked == true) {
              return;
            }
            handleSectionItemClick(context, item);
          },
          child: child,
        ),
      ),
    );
  }
}
