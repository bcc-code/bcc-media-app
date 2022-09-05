//import 'dart:html';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/bccm_castplayer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/providers/chromecast.dart';
import 'package:my_app/providers/playback_api.dart';
import 'package:my_app/providers/video_state.dart';
import 'package:bccm_player/cast_button.dart';

import '../api/episodes.dart';

class EpisodePageArguments {
  int episodeId;
  EpisodePageArguments(this.episodeId);
}

class EpisodeScreen extends ConsumerStatefulWidget {
  final PlayerType playerType = PlayerType.native;
  final int episodeId;
  const EpisodeScreen({super.key, @PathParam() this.episodeId = 1789});

  @override
  ConsumerState<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends ConsumerState<EpisodeScreen> {
  late Future<Episode> episodeFuture;
  late Future<List<String>> playerIdFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //EpisodePageArguments args = ModalRoute.of(context)!.settings.arguments as EpisodePageArguments;
    final casting = ref.watch(isCasting);
    int episodeId = widget.episodeId;
    episodeFuture = fetchEpisode(episodeId);
    if (widget.playerType == PlayerType.native) {
      if (!casting) {
        var playerId = ref.read(playerStateProvider).primaryPlayerId!;
        playerIdFuture = Future.value([playerId]);

        episodeFuture.then((episode) {
          var playbackApi = ref.read(playbackApiProvider);
          playbackApi.replaceCurrentMediaItem(
              playerId,
              MediaItem(
                  url: episode.streamUrl, mimeType: 'application/x-mpegURL'));
        });
      } else {
        playChromecast();
      }
      /* playerIdFuture.then((playerId) {
        PlaybackPlatformInterface.instance.setPrimary(playerId);
      }); */
    }
    super.didChangeDependencies();
  }

  Future playChromecast() async {
    var episode = await episodeFuture;
    ref.read(playbackApiProvider).replaceCurrentMediaItem('chromecast',
        MediaItem(url: episode.streamUrl, mimeType: 'application/x-mpegURL'));
  }

  @override
  Widget build(BuildContext context) {
    final casting = ref.watch(isCasting);
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
            child: casting
                ? const BccmCastPlayer()
                : FutureBuilder<List<String>>(
                    future: playerIdFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            ...snapshot.data!.map(
                              (element) => BccmPlayer(
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
