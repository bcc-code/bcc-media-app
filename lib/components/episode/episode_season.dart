import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/components/menus/option_list.dart';
import 'package:brunstadtv_app/components/episode/list/season_episode_list.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/brunstadtv.dart';
import '../../providers/lesson_progress_provider.dart';
import '../menus/dropdown_select.dart';

class EpisodeSeason extends HookConsumerWidget {
  const EpisodeSeason({
    super.key,
    required this.episodeId,
    required this.season,
    required this.onEpisodeTap,
  });

  final String episodeId;
  final Fragment$EpisodeContext$$Season season;
  final void Function(String id) onEpisodeTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSeasonId = useState(season.id);
    final episodesCache = useState<Map<String, List<SeasonEpisodeListEpisodeData>?>>({});
    final isMounted = useIsMounted();

    Future onSeasonSelected(String id) async {
      selectedSeasonId.value = id;
      var season = await ref.read(apiProvider).getSeasonEpisodes(id);
      if (!isMounted() || season == null) return;
      if (season.episodes.items.any((element) => element.lessons.total > 0)) {
        ref.read(lessonProgressCacheProvider.notifier).loadLessonProgressForSeason(season.id);
      }
      final cacheCopy = {...episodesCache.value};
      cacheCopy[season.id] = season.episodes.items
          .map(
            (ep) => SeasonEpisodeListEpisodeData(
              episode: ep,
              seasonNumber: season.number,
            ),
          )
          .toList();
      episodesCache.value = cacheCopy;
    }

    useEffect(() {
      selectedSeasonId.value = season.id;
      episodesCache.value = {
        season.id: season.episodes.items.map((ep) {
          return SeasonEpisodeListEpisodeData(
            seasonNumber: season.number,
            episode: ep,
          );
        }).toList()
      };
      if (true == season.episodes.items.any((element) => element.lessons.total > 0)) {
        ref.read(lessonProgressCacheProvider.notifier).loadLessonProgressForSeason(season.id);
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
          child: DropDownSelect<String>(
            title: S.of(context).selectSeason,
            onSelectionChanged: onSeasonSelected,
            items: season.$show.seasons.items.map((e) => Option(id: e.id, title: e.title)).toList(),
            selectedId: selectedSeasonId.value,
          ),
        ),
        if (episodes == null)
          const SizedBox(
            height: 1000,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 16),
                child: LoadingIndicator(),
              ),
            ),
          )
        else
          SeasonEpisodeList(
            onEpisodeTap: (index, e) {
              ref.read(analyticsProvider).sectionItemClicked(
                    context,
                    itemAnalyticsOverride: SectionItemAnalyticsData(position: index, type: 'Episode', id: e),
                    sectionAnalyticsOverride: SectionAnalyticsData(id: episodeId, position: 0, type: 'SeasonList'),
                  );
              onEpisodeTap(e);
            },
            items: episodes
                .map(
                  (e) => e.copyWith(
                    lessonProgressOverview: ref.watch(lessonProgressProvider(e.episode.id))?.lessons.items.firstOrNull,
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
