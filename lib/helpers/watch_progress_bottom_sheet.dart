import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/brunstadtv.dart';
import '../components/menus/bottom_sheet_select.dart';
import '../components/menus/option_list.dart';
import '../helpers/event_bus.dart';
import '../models/events/watch_progress.dart';

void showWatchProgressBottomSheet(BuildContext context, WidgetRef ref, String episodeId, int? episodeProgress) {
  if (episodeProgress == null || episodeProgress == 0) {
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
          title: S.of(context).removeWatchProgress,
          icon: Image.asset(width: 24, height: 24, 'assets/icons/Close.png', gaplessPlayback: true, package: 'brunstadtv_app'),
        )
      ],
      showSelection: false,
      onSelectionChanged: (id) {
        if (id == 'remove_progress') {
          ref.read(apiProvider).updateProgress(episodeId: episodeId, progress: null);
          globalEventBus.fire(WatchProgressUpdatedEvent(episodeId: episodeId, progress: null));
        }
      },
    ),
  );
}
