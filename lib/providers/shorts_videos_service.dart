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
  String id;
  String title;
  String hlsUrl;
  Duration startPosition;
  ShortsVideo({required this.id, required this.title, required this.hlsUrl, required this.startPosition});
}

final streamsForEpisodeProvider = FutureProvider<List<ShortsVideo>?>((ref) async {
  final List<Episode> episodesList = [];
  final List<ShortsVideo> shortsVideos = [];
  final client = ref.read(gqlClientProvider);

  final episodes = await client
      .query$GetEpisodesForShorts(Options$Query$GetEpisodesForShorts(variables: Variables$Query$GetEpisodesForShorts(first: 19, offset: 0)))
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
        id: item.id,
        title: item.title,
        hlsUrl: value.parsedData!.episode.streams.getBestStreamUrl(),
        startPosition: Duration(seconds: duration),
      ));
    });
  }
  return shortsVideos;
});
