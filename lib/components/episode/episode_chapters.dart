import 'package:brunstadtv_app/components/menus/option_list.dart';
import 'package:brunstadtv_app/helpers/time.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
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
      child: OptionList(
        optionData: episode.chapters
            .where((element) => element.start < episode.duration)
            .map((c) => Option(
                  id: c.id,
                  title: c.title,
                  subTitle: c.description,
                  icon: Container(
                    alignment: Alignment.topLeft,
                    child: Text(getFormattedDuration(c.start, padFirstSegment: true), style: design.textStyles.title3),
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
