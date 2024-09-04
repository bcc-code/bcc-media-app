import 'dart:math';

import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/controls.dart';
import 'package:brunstadtv_app/components/video/skip_button.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CenterExtraSlot extends HookConsumerWidget {
  const CenterExtraSlot({super.key, required this.episode});

  final Query$FetchEpisode$episode episode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skipToChapterEnabled = ref.watch(featureFlagsProvider.select((flags) => flags.chapters && flags.skipToChapter));
    final viewController = BccmPlayerViewController.of(context);
    final hasShownSkipToChapter = useState(false);
    useValueChangedSimple(hasShownSkipToChapter.value, (old) {
      if (old == false && hasShownSkipToChapter.value) {
        ref.read(analyticsProvider).impression(ImpressionEvent(
              name: 'skip_to_first_relevant_chapter',
              pageCode: 'episode',
              contextElementId: episode.id,
              contextElementType: 'episode',
            ));
      }
    });

    if (skipToChapterEnabled) {
      final timeline = useTimeline(viewController.playerController);
      final chapter = episode.skipToChapter;
      if (chapter != null && timeline.actualTimeMs < min(20000, (chapter.start * 1000) - 1000)) {
        hasShownSkipToChapter.value = true;
        return SkipButton(
          controller: viewController.playerController,
          chapter: chapter,
        );
      }
    }
    return const SizedBox.shrink();
  }
}
