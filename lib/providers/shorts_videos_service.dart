import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Episode {
  String id;
  String title;
  Episode({required this.id, required this.title});
}

class ShortsVideo {
  String hlsUrl;
  String title;
  Duration duration;
  ShortsVideo({required this.hlsUrl, required this.title, required this.duration});
}

final _episodesForShortsProvider = FutureProvider<List<Episode>?>((ref) async {
  final List<Episode> episodesList = [];
  final client = ref.read(gqlClientProvider);

  return await client
      .query$GetEpisodesForShorts(Options$Query$GetEpisodesForShorts(variables: Variables$Query$GetEpisodesForShorts(first: 10, offset: 0)))
      .then((result) {
    if (result.hasException) {
      throw result.exception!;
    }
    if (result.parsedData == null) {
      throw ErrorDescription('GetEpisodesForShorts is null.');
    }
    final episodes = result.parsedData?.collection.items?.items.whereType<Fragment$ShortsEpisode$$EpisodeItem>().toList();
    if (episodes != null) {
      episodesList.addAll(episodes.map((e) => Episode(id: e.episode.id, title: e.episode.title)).toList());
    }
    return episodesList;
  });
});

final _streamsForEpisodeProvider = FutureProvider<List<ShortsVideo>?>((ref) async {
  final client = ref.read(gqlClientProvider);
  final episodes = await ref.watch(_episodesForShortsProvider.future);
  final List<ShortsVideo> shortsVideos = [];
  if (episodes == null) {
    throw ErrorDescription('_episodesForShortsProvider is null.');
  }
  for (var item in episodes) {
    await client
        .query$GetStreamsForEpisode(
      Options$Query$GetStreamsForEpisode(
        variables: Variables$Query$GetStreamsForEpisode(
          id: item.id,
        ),
      ),
    )
        .then((value) {
      if (value.hasException) {
        throw value.exception!;
      }
      if (value.parsedData == null) {
        throw ErrorDescription('GetStreamsForEpisode is null.');
      }
      //video start from 0.2 of the video length
      final duration = (((value.parsedData?.episode.duration ?? 0).toDouble()) * 0.2).toInt();
      shortsVideos.add(ShortsVideo(
        hlsUrl: value.parsedData!.episode.streams.getBestStreamUrl(),
        title: item.title,
        duration: Duration(seconds: duration),
      ));
    });
  }
  return shortsVideos;
});

final episodeForShortStateProvider = StateProvider<List<Episode>?>((ref) {
  return ref.watch(_episodesForShortsProvider).valueOrNull;
});

final streamsForEpisodeStateProvider = StateProvider<List<ShortsVideo>?>((ref) {
  return ref.watch(_streamsForEpisodeProvider).valueOrNull;
});
