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
    ref.read(streamsForEpisodeProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ShortsVideo>? shortsVideos = ref.watch(streamsForEpisodeProvider).valueOrNull;

    return Scaffold(
      backgroundColor: Colors.black,
      body: (shortsVideos != null)
          ? ShortsVideosStreamPlayer(
              shortsVideos: shortsVideos,
            )
          : const LoadingGeneric(),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
}
