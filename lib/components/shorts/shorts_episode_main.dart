import 'package:brunstadtv_app/components/shorts/shorts_video_player.dart';
import 'package:brunstadtv_app/components/shorts/shorts_video_description.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:flutter/material.dart';

class ShortsEpisode extends StatelessWidget {
  const ShortsEpisode({
    Key? key,
    required this.episode,
  }) : super(key: key);

  final Fragment$ShortsEpisode$$EpisodeItem$episode episode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ShortsVideo(episode: episode),
        VideoDescription(id: episode.id, title: episode.title),
      ],
    );
  }
}
