import 'package:brunstadtv_app/components/episode/season_episode_list.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/lesson_progress_provider.dart';

class EpisodeCollection extends HookConsumerWidget {
  const EpisodeCollection({
    super.key,
    required this.episodeId,
    required this.collection,
    required this.onEpisodeTap,
  });

  final String episodeId;
  final Fragment$EpisodeContext$$ContextCollection collection;
  final void Function(String id) onEpisodeTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodes = collection.items?.items.where((element) => element.item is Fragment$SeasonListEpisode).map((e) {
      final episode = e.item.as<Fragment$SeasonListEpisode>();
      return SeasonEpisodeListEpisodeData(
        episode: episode,
        lessonProgressOverview: ref.watch(lessonProgressProvider(episode.id))?.lessons.items.firstOrNull,
        highlighted: episode.id == episodeId,
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (episodes != null)
          SeasonEpisodeList(
            onEpisodeTap: onEpisodeTap,
            items: episodes.toList(),
          )
      ],
    );
  }
}
