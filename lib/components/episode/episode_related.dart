import 'package:brunstadtv_app/components/thumbnails/grid/thumbnail_grid.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/router/navigation_override.dart';
import 'package:flutter/material.dart';

class EpisodeRelated extends StatelessWidget {
  const EpisodeRelated({
    super.key,
    required this.episode,
  });

  final Query$FetchEpisode$episode episode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: NavigationOverride(
            pushInsteadOfReplace: true,
            child: ThumbnailGrid(
              gridSize: Enum$GridSectionSize.half,
              sectionItems: episode.relatedItems?.items ?? [],
            ),
          ),
        )
      ],
    );
  }
}
