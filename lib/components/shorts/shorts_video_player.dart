import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//video player

//API query call GetStreamsForEpisode here
// use the video player

// # Then, because we use the BasicStream fragment here, we can do:
// # final hlsUrl = result.parsedData.episode.streams.getBestStreamUrl();

class ShortsVideo extends StatefulWidget {
  const ShortsVideo({Key? key, required this.episode}) : super(key: key);
  final Fragment$ShortsEpisode$$EpisodeItem$episode episode;

  @override
  _ShortsVideoState createState() => _ShortsVideoState();
}

class _ShortsVideoState extends State<ShortsVideo> {
  late VideoPlayerController _controller;

  bool isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isVideoPlaying = !isVideoPlaying;
        });
        isVideoPlaying ? _controller.play() : _controller.pause();
      },
      child: Column(
        children: [
          Expanded(
            child: _controller.value.isInitialized ? VideoPlayer(_controller) : Container(),
          ),
          VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         setState(() {
          //           isVideoPlaying = !isVideoPlaying;
          //         });
          //         isVideoPlaying ? _controller.play() : _controller.pause();
          //       },
          //       child: isVideoPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
