import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/components/option_list.dart';
import 'package:brunstadtv_app/components/season_episode_list.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/brunstadtv.dart';
import '../../providers/lesson_progress_provider.dart';
import '../dropdown_select.dart';

class EpisodeCollection extends HookConsumerWidget {
  const EpisodeCollection({
    super.key,
    required this.episodeId,
    required this.collection,
    required this.onEpisodeTap,
  });

  final String episodeId;
  final Query$FetchEpisode$episode$context$$ContextCollection collection;
  final void Function(String id) onEpisodeTap; // TODO: implement

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();

    final episodes = collection.items?.items.where((element) => element.item is Fragment$SeasonListEpisode).map((e) {
      final episode = e.item.as<Fragment$SeasonListEpisode>();
      return SeasonEpisodeListEpisodeData(
        episode: episode,
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (episodes != null)
          SeasonEpisodeList(
            onEpisodeTap: onEpisodeTap,
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
