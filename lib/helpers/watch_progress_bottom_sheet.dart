import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/brunstadtv.dart';
import '../components/menus/bottom_sheet_select.dart';
import '../components/menus/option_list.dart';

void showWatchProgressBottomSheet(BuildContext context, WidgetRef ref, String episodeId, int? episodeProgress) {
  if (episodeProgress == null || episodeProgress == 0) {
    return;
  }
  HapticFeedback.heavyImpact();
  showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    builder: (ctx) => BottomSheetSelect(
      title: S.of(context).options,
      selectedId: 'fromStart',
      items: [
        Option(
          id: 'remove_progress',
          title: S.of(context).removeWatchProgress,
          icon: Image.asset(width: 24, height: 24, 'assets/icons/Close.png', gaplessPlayback: true),
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
