
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/components/player.dart';
import 'package:my_app/states/videoplayer_state.dart';
import 'package:provider/provider.dart';

import '../api/episodes.dart';

class EpisodePage extends StatefulWidget {
  final PlayerType playerType;
  final int episodeId;
  const EpisodePage({super.key, required this.playerType, this.episodeId = 1789});

  @override
  State<EpisodePage> createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
  late Future<Episode> episode;

  @override
  void initState() {
    super.initState();
    episode = fetchEpisode(widget.episodeId);
    if (widget.playerType == PlayerType.videoPlayer) {
      episode.then((value) => {
        Provider.of<VideoPlayerState>(context, listen: false).play(value.streamUrl)
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode'),
      ),
      body: Column(
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<Episode>(future: episode, builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return BccmPlayer(type: widget.playerType, url: snapshot.data!.streamUrl);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              }),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to first screen when tapped.
                  Navigator.of(context).pop();
                },
                child: const Text('Go back!'),
              ),
            ),
          ],
        ),]
      ),
    );
  }
}