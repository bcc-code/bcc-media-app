// import 'dart:async';

// import 'package:brunstadtv_app/components/loading_generic.dart';
// import 'package:brunstadtv_app/components/loading_indicator.dart';
// import 'package:brunstadtv_app/components/shorts/shorts_video_player.dart';
// import 'package:brunstadtv_app/graphql/client.dart';
// import 'package:brunstadtv_app/graphql/queries/calendar_episode_entries.graphql.dart';
// import 'package:brunstadtv_app/helpers/btv_typography.dart';
// import 'package:brunstadtv_app/helpers/btv_colors.dart';
// import 'package:brunstadtv_app/providers/playback_api.dart';

// import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
// import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:math' as math;

// class ShortsVideoStreamLoader extends StatelessWidget {
//   const ShortsVideoStreamLoader({Key? key, required this.id}) : super(key: key);
//   final String id;

//   @override
//   Widget build(BuildContext context) {
//     return Query$GetStreamsForEpisode$Widget(
//         options: Options$Query$GetStreamsForEpisode(
//           variables: Variables$Query$GetStreamsForEpisode(id: id),
//         ),
//         builder: (result, {refetch, fetchMore}) {
//           if (result.parsedData == null) return const LoadingGeneric();
//           final Duration durationStartUp = Duration(
//             seconds: ((result.parsedData?.episode.duration)! * 0.3).toInt(),
//           );
//           final utl = result.parsedData!.episode.streams.getBestStreamUrl();

//           return ShortsVideoStreamPlayer(url: utl, duration: durationStartUp, episodeId: id); //Original Video Player
//           // return ChewieVideoPlayer(testURL: testURL, bestURL: bestURL, duration: durationStartUp); //Chewie Video Player
//         });
//   }
// }

// //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// /* class FadingIcon extends StatelessWidget {
//   const FadingIcon({
//     Key? key,
//     required this.widget,
//   }) : super(key: key);

//   final _OneTimeAnimatedIcon widget;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SafeArea(
//         child: AnimatedOpacity(
//           opacity: widget.isVideoPlaying ? 0.0 : 1.0,
//           duration: const Duration(seconds: 2),
//           child: Material(
//             borderRadius: BorderRadius.circular(45),
//             color: Colors.grey,
//             child: Icon(
//               widget._controller.value.isPlaying ? Icons.pause_sharp : Icons.play_arrow,
//               size: 50,
//               color: Colors.amber,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// } */

// //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// /* 
// class ChewieVideoPlayer extends StatefulWidget {
//   const ChewieVideoPlayer({
//     Key? key,
//     required this.testURL,
//     required this.bestURL,
//     required this.duration,
//   }) : super(key: key);

//   final String testURL;
//   final String bestURL;
//   final Duration? duration;

//   @override
//   _ChewieVideoPlayerState createState() => _ChewieVideoPlayerState();
// }

// class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
//   late VideoPlayerController videoPlayerController;
//   late ChewieController chewieController;
//   Future<bool>? loadFuture;

//   @override
//   void initState() {
//     loadFuture = loadVideo();
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant ChewieVideoPlayer oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     loadFuture = loadVideo();
//   }

//   Future<bool> loadVideo() async {
//     setState(() {
//       videoPlayerController = VideoPlayerController.network(widget.bestURL, formatHint: VideoFormat.hls);
//     });

//     await videoPlayerController.initialize();

//     chewieController = ChewieController(
//       videoPlayerController: videoPlayerController,
//       autoPlay: true,
//       looping: true,
//       // aspectRatio: 16 / 9,
//       allowFullScreen: false,
//       autoInitialize: true,
//       startAt: widget.duration,

//       progressIndicatorDelay: Duration(seconds: 2),
//       placeholder: Image.asset('assets/icons/Seen.png'),
//     );
//     return true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: loadFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const LoadingGeneric();
//           }
//           return Column(
//             children: [
//               Expanded(
//                 child: Chewie(
//                   controller: chewieController,
//                 ),
//               ),
//               Text(
//                 'Duration:   ${widget.duration}',
//                 style: BtvTextStyles.body1.copyWith(color: BtvColors.tint3),
//                 textAlign: TextAlign.end,
//               ),
//             ],
//           );
//         });
//   }

//   @override
//   void dispose() {
//     videoPlayerController.dispose();
//     chewieController.dispose();
//     super.dispose();
//   }
// }
//  */
// //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
