/* import 'dart:async';
import 'dart:math';

import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/shorts/short_analytics.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

class ShortController {
  final WidgetRef ref;
  bool _disposed = false;
  final currentIndex = useState(0);

  ShortController(this.ref) {}

  preloadNextAndPreviousFor(int index) async {
    if (!isMounted()) return;
    if (playerCount == 1) {
      debugPrint('SHRT: Player count is 1, not preloading next+previous');
      return;
    }

    final ignorePrevious = playerCount == 2;
    final nextPlayers = ignorePrevious ? 2 : playerCount - 1;
    for (var i = 1; i < nextPlayers; i++) {
      final next = index == shorts.value.length - 1 ? null : shorts.value.elementAtOrNull(index + i);
      if (next != null) {
        final nextControllerIndex = (index + i) % playerCount;
        final controller = shortControllers[nextControllerIndex];
        controller.setupShort(next);
      }
    }

    if (ignorePrevious) {
      debugPrint('SHRT: Not preloading previous');
      return;
    }

    final previous = index == 0 ? null : shorts.value.elementAtOrNull(index - 1);
    if (previous != null) {
      final previousControllerIndex = (index - 1) % playerCount;
      final controller = shortControllers[previousControllerIndex];
      controller.setupShort(previous);
    }
  }

  void dispose() {
    _disposed = true;
  }
}
 */