import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/controls.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/permanent_cache_manager.dart';
import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';

@RoutePage<void>()
class PlayerScreen extends HookConsumerWidget {
  const PlayerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = BccmPlayerController.primary;

    return Scaffold(
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              player.queue.skipToPrevious();
            },
            icon: const Icon(Icons.skip_previous),
          ),
          PlayPauseButton(player: player),
          IconButton(
            onPressed: () {
              player.queue.skipToNext();
            },
            icon: const Icon(Icons.skip_next),
          ),
        ],
      ),
    );
  }
}
