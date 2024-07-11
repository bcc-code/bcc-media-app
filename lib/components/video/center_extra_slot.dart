import 'dart:math';

import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/controls.dart';
import 'package:brunstadtv_app/components/video/skip_button.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CenterExtraSlot extends HookConsumerWidget {
  const CenterExtraSlot({super.key, required this.episode});

  final Query$FetchEpisode$episode episode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skipToChapterEnabled = ref.watch(featureFlagsProvider.select((flags) => flags.chapters && flags.skipToChapter));
    final controller = BccmPlayerViewController.of(context);

    if (skipToChapterEnabled) {
      final timeline = useTimeline(controller.playerController);
      final chapter = episode.skipToChapter;
      if (chapter != null && timeline.actualTimeMs < max(20000, (chapter.start * 1000) - 1000)) {
        return SkipButton(
          chapter: chapter,
          onTap: () async {
            await controller.playerController.seekTo(Duration(seconds: chapter.start));
            if (!context.mounted) return;
            return BccmPlayerController.primary.play();
          },
        );
      }
    }
    return const SizedBox.shrink();
  }
}
