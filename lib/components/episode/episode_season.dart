import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/components/option_list.dart';
import 'package:brunstadtv_app/components/season_episode_list.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../graphql/queries/studies.graphql.dart';
import '../../api/brunstadtv.dart';
import '../../graphql/client.dart';
import '../dropdown_select.dart';

class EpisodeSeason extends HookConsumerWidget {
  const EpisodeSeason({
    super.key,
    required this.episodeId,
    required this.season,
    required this.onEpisodeTap,
  });

  final String episodeId;
  final Query$FetchEpisode$episode$season season;
  final void Function() onEpisodeTap; // TODO: implement

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSeasonId = useState(season.id);
    final episodesCache = useState<Map<String, List<SeasonEpisodeListEpisodeData>?>>({});
    final lessonProgressCache = useState<Map<String, Fragment$EpisodeLessonProgressOverview>>({});
    final isMounted = useIsMounted();

    Future<void> loadLessonProgressForSeason(String id) async {
      final value = await ref
          .read(gqlClientProvider)
          .query$GetSeasonLessonProgress(Options$Query$GetSeasonLessonProgress(variables: Variables$Query$GetSeasonLessonProgress(id: id)));
      final season = value.parsedData?.season;
      if (!isMounted() || season == null) return;
      var cacheCopy = {...lessonProgressCache.value};
      for (var element in season.episodes.items) {
        cacheCopy[element.id] = element;
      }
      lessonProgressCache.value = cacheCopy;
    }

    Future onSeasonSelected(String id) async {
      selectedSeasonId.value = id;
      var season = await ref.read(apiProvider).getSeasonEpisodes(id);
      if (!isMounted() || season == null) return;
      if (season.episodes.items.any((element) => element.lessons.total > 0)) {
        loadLessonProgressForSeason(season.id);
      }
      final cacheCopy = {...episodesCache.value};
      cacheCopy[season.id] = season.episodes.items
          .map(
            (ep) => SeasonEpisodeListEpisodeData(
              //TODO: fromEpisodeSeason
              episode: ep,
              lessonProgressOverview: lessonProgressCache.value[ep.id]?.lessons.items.firstOrNull,
              seasonNumber: season.number,
            ),
          )
          .toList();
      episodesCache.value = cacheCopy;
    }

    useEffect(() {
      episodesCache.value = {
        season.id: season.episodes.items.map((ep) {
          return SeasonEpisodeListEpisodeData(
            seasonNumber: season.number,
            episode: ep,
          );
        }).toList()
      };
      if (true == season.episodes.items.any((element) => element.lessons.total > 0)) {
        loadLessonProgressForSeason(season.id);
      }
      return null;
      // ignore: exhaustive_keys
    }, [season]);

    final episodes = episodesCache.value[selectedSeasonId.value];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 28, top: 16, bottom: 20),
          child: DropDownSelect(
            title: S.of(context).selectSeason,
            onSelectionChanged: onSeasonSelected,
            items: season.$show.seasons.items.map((e) => Option(id: e.id, title: e.title)).toList(),
            selectedId: selectedSeasonId.value,
          ),
        ),
        if (episodes == null)
          const SizedBox(
              height: 1000,
              child: Align(alignment: Alignment.topCenter, child: Padding(padding: EdgeInsets.only(top: 16), child: LoadingIndicator())))
        else
          SeasonEpisodeList(
            items: episodes
                .map(
                  (e) => e.copyWith(
                    lessonProgressOverview: lessonProgressCache.value[e.episode.id]?.lessons.items.firstOrNull,
                    highlighted: e.episode.id == episodeId,
                  ),
                )
                .toList(),
          )
      ],
    );
  }
}

extension MapExtension<K, V> on Map<K, V> {
  Map<K, V> copyWith(key, value) {
    this[key] = value;
    return this;
  }
}
