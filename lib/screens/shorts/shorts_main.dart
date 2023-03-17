import 'dart:developer';

import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/shorts/shorts_videos_stream_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/shorts_videos_service.dart';

class ShortsMain extends ConsumerStatefulWidget {
  const ShortsMain({Key? key}) : super(key: key);

  @override
  ConsumerState<ShortsMain> createState() => _ShortsMainState();
}

class _ShortsMainState extends ConsumerState<ShortsMain> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final episode = ref.watch(episodeForShortStateProvider);
    // final hlsurls = ref.watch(streamsForEpisodeStateProvider);
    if (episode != null) print('episode: ${episode[0].title}');
    if (episode != null) print('episode-length: ${episode.length}');
    // if (hlsurls != null) print('hlsurl: ${hlsurls[0].hlsUrl}');
    // if (hlsurls != null) print('hlsurl-length: ${hlsurls.length}');
    // final idList = episode.map((e) => e.episode.id,)

    log('🚀🚀🚀 GetEpisodesForShorts');

    return Scaffold(
        backgroundColor: Colors.black,
        body: (/* episode?.length == hlsurl?.length && hlsurls != null && */ episode != null)
            ? ShortsVideosStreamPlayer(
                episode: episode,
              )
            : const LoadingGeneric());
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
}
