import 'package:brunstadtv_app/components/menus/option_list.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../graphql/queries/episode.graphql.dart';

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
    return Container(
      padding: const EdgeInsets.all(16),
      child: OptionList<String>(
        optionData: episode.chapters
            .where((element) => element.start < episode.duration)
            .map((c) => Option(
                  id: c.id,
                  title: c.title,
                  subTitle: c.description,
                  icon: Container(
                    width: 48,
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
