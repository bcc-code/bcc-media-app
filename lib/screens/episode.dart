
//import 'dart:html';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/playback_service.dart';
import 'package:provider/provider.dart';

import '../api/episodes.dart';

final playbackService = PlaybackService();

class EpisodePageArguments {
  int episodeId;
  EpisodePageArguments(this.episodeId);
}

class EpisodeScreen extends StatefulWidget {
  final PlayerType playerType = PlayerType.native;
  final int episodeId;
  const EpisodeScreen({super.key, @PathParam() this.episodeId = 1789});

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  late Future<Episode> episodeFuture;
  late Future<String> playerIdFuture;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
    ]);
  }


  @override
  void didChangeDependencies() {
    //EpisodePageArguments args = ModalRoute.of(context)!.settings.arguments as EpisodePageArguments;
    int episodeId = widget.episodeId;
    episodeFuture = fetchEpisode(episodeId);
    if (widget.playerType == PlayerType.native) {
      playerIdFuture = Future<String>((() async {
        var episode = await episodeFuture;
        var playerId = await BccmPlayerPlatform.instance.newPlayer(episode.streamUrl);
        
        return playerId!;
      }));
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode'),
      ),
      body: Container(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<String>(future: playerIdFuture, builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      BccmPlayer(type: widget.playerType, id: snapshot.data!),
                      ElevatedButton(onPressed: () {
                        BccmPlayerPlatform.instance.setPrimary(snapshot.data!);
                      }, child: Text("set primary"))
                    ],
                  );
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
            SizedBox(
              width: 100,
              height: 2000
            )
          ],
        ),
      ),
    );
  }
}