import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/shorts/shorts_video_description.dart';
import 'package:brunstadtv_app/components/shorts/shorts_video_player.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';

import 'package:flutter/material.dart';

class ShortsEpisode extends StatelessWidget {
  const ShortsEpisode({
    Key? key,
    required this.episode,
  }) : super(key: key);

  final Fragment$ShortsEpisode$$EpisodeItem$episode episode;

  @override
  Widget build(BuildContext context) {
    return Query$GetStreamsForEpisode$Widget(
        options: Options$Query$GetStreamsForEpisode(
          variables: Variables$Query$GetStreamsForEpisode(id: episode.id),
        ),
        builder: (result, {refetch, fetchMore}) {
          if (result.parsedData == null) return const LoadingGeneric();
          final Duration durationStartUp = Duration(
            seconds: ((result.parsedData?.episode.duration)! * 0.3).toInt(),
          );
          final utl = result.parsedData!.episode.streams.getBestStreamUrl();

          return Stack(
            children: <Widget>[
              ShortsVideoStreamPlayer(url: utl, episodeId: episode.id, duration: durationStartUp),
              VideoDescription(episodeId: episode.id, title: episode.title, duration: durationStartUp),
            ],
          );
        });
  }
}
