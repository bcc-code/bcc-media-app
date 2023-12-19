import 'package:brunstadtv_app/components/episode/list/season_episode_list.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_core/bccm_core.dart';
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
  final void Function(int index, String id) onEpisodeTap;

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
