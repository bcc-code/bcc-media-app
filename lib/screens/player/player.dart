import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/controls.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage<void>()
class PlayerScreen extends HookConsumerWidget {
  const PlayerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = BccmPlayerController.primary;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
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
        ),
      ),
    );
  }
}
