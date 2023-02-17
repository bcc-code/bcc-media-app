import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/components/option_list.dart';
import 'package:brunstadtv_app/components/season_episode_list.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../../graphql/queries/studies.graphql.dart';
import '../dropdown_select.dart';

class EpisodeSeason extends StatelessWidget {
  const EpisodeSeason({
    super.key,
    required this.episode,
    required this.selectedSeasonId,
    required this.onSeasonSelected,
    required this.seasons,
    required this.lessonProgress,
  });

  final Query$FetchEpisode$episode episode;
  final String? selectedSeasonId;
  final void Function(String id) onSeasonSelected;
  final Map<String, List<EpisodeListEpisodeData>?> seasons;
  final Map<String, Fragment$EpisodeLessonProgressOverview> lessonProgress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 28, top: 16, bottom: 20),
          child: DropDownSelect(
              title: S.of(context).selectSeason,
              onSelectionChanged: onSeasonSelected,
              items: episode.season!.$show.seasons.items.map((e) => Option(id: e.id, title: e.title)).toList(),
              selectedId: selectedSeasonId!),
        ),
        Builder(builder: (context) {
          if (seasons[selectedSeasonId] == null) {
            return const SizedBox(
                height: 1000,
                child: Align(alignment: Alignment.topCenter, child: Padding(padding: EdgeInsets.only(top: 16), child: LoadingIndicator())));
          } else {
            return SeasonEpisodeList(
              items: seasons[selectedSeasonId]!
                  .map((e) => e.copyWith(lessonProgressOverview: lessonProgress[e.episodeId]?.lessons.items.firstOrNull))
                  .map(
                    (e) => e.episodeId == episode.id ? e.copyWith(highlighted: true) : e,
                  )
                  .toList(),
            );
          }
        }),
      ],
    );
  }
}
