import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/menus/option_list.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:bccm_core/platform.dart';

class EpisodeChapters extends HookWidget {
  const EpisodeChapters({
    super.key,
    required this.episode,
    required this.onChapterSelected,
  });

  final Query$FetchEpisode$episode episode;
  final Function(String id) onChapterSelected;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final currentTime = useListenableSelector(BccmPlayerController.primary, () => BccmPlayerController.primary.value.playbackPositionMs);

    bool isActive(Fragment$EpisodeChapter chapter) {
      final startMs = chapter.start * 1000;
      final isAfterStart = currentTime != null && currentTime + 100 > startMs;
      if (!isAfterStart) return false;
      final nextChapter = episode.chapters.elementAtOrNull(episode.chapters.indexOf(chapter) + 1);
      if (nextChapter == null) return true;
      return currentTime < nextChapter.start * 1000;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      child: OptionList<String>(
        optionData: episode.chapters
            .where((element) => element.start < episode.duration)
            .mapIndexed((index, c) => Option(
                  id: c.id,
                  title: c.title,
                  subTitle: c.description,
                  overlay: isActive(c)
                      ? Positioned.fill(
                          child:
                              Container(color: design.colors.onTint.withOpacity(0.1)).animate().fadeIn(curve: Curves.easeOutExpo, duration: 500.ms),
                        )
                      : null,
                  icon: Container(
                    width: 80,
                    alignment: Alignment.topLeft,
                    child: Text(
                      getFormattedDuration(c.start, padFirstSegment: true),
                      style: design.textStyles.title3.copyWith(color: design.colors.label3),
                    ),
                  ),
                ))
            .toList(),
        currentSelection: null,
        onSelectionChange: (id) {
          if (id != null) onChapterSelected(id);
        },
        enableDivider: true,
        showSelection: false,
      ),
    );
  }
}
