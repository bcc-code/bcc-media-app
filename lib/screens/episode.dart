//import 'dart:html';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/bccm_castplayer.dart';
import 'package:my_app/providers/cast.dart';

import '../api/episodes.dart';
import '../components/cast_button.dart';

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
  late Future<List<String>> playerIdFuture;
  bool casting = false;

  @override
  void initState() {
    super.initState();
    ChromecastListener.instance.on<SessionStarted>().listen((event) {
      setState(() {
        casting = true;
      });
    });
    ChromecastListener.instance.on<SessionEnded>().listen((event) {
      setState(() {
        casting = false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    //EpisodePageArguments args = ModalRoute.of(context)!.settings.arguments as EpisodePageArguments;
    int episodeId = widget.episodeId;
    episodeFuture = fetchEpisode(episodeId);
    if (widget.playerType == PlayerType.native) {
      playerIdFuture = Future<List<String>>((() async {
        var episode = await episodeFuture;
        var playerId = await PlaybackPlatformInterface.instance
            .newPlayer(url: episode.streamUrl);
        var playerId2 = await PlaybackPlatformInterface.instance
            .newPlayer(url: episode.streamUrl);

        return [playerId];
      }));
      /* playerIdFuture.then((playerId) {
        PlaybackPlatformInterface.instance.setPrimary(playerId);
      }); */
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Column(
            children: [
              Text('Casting: $casting'),
              const SizedBox(width: 50, height: 50, child: CastButton()),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<List<String>>(
                future: playerIdFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        ...snapshot.data!.map(
                          (element) => casting
                              ? const BccmCastPlayer()
                              : BccmPlayer(
                                  type: widget.playerType, id: element),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              //PlaybackPlatformInterface.instance.setPrimary(snapshot.data!);
                            },
                            child: const Text("set primary"))
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
                context.router.pop();
              },
              child: const Text('Go back!'),
            ),
          ),
          const SizedBox(width: 100, height: 2000)
        ],
      ),
    );
  }
}
