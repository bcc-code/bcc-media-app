import 'package:brunstadtv_app/components/shorts/shorts_video_loader.dart';
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
      children: [
        ShortsVideoStreamLoader(
          id: episode.id,
        ),
        VideoDescription(id: episode.id, title: episode.title),
      ],
    );
  }
}
