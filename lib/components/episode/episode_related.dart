import 'package:brunstadtv_app/components/default_grid_section.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/pages.graphql.dart';
import 'package:brunstadtv_app/helpers/navigation_override.dart';
import 'package:flutter/material.dart';

class EpisodeRelated extends StatelessWidget {
  const EpisodeRelated({
    super.key,
    required this.episode,
  });

  final Query$FetchEpisode$episode episode;

  @override
  Widget build(BuildContext context) {
    if (episode.relatedItems == null) const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: NavigationOverride(
            pushInsteadOfReplace: true,
            child: GridSectionList(size: Enum$GridSectionSize.half, sectionItems: episode.relatedItems!.items),
          ),
        )
      ],
    );
  }
}
