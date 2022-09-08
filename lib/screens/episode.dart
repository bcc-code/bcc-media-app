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
  AnimationStatus? animationStatus;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    episodeFuture = fetchEpisode(widget.episodeId);

    ref
        .read(chromecastListenerProvider)
        .on<CastSessionUnavailable>()
        .listen((event) {
      playLocal(playbackPositionMs: event.playbackPositionMs);
    });

    setup();
  }

  Future setup() async {
    /* var currentlyPlaying = await ref.read(playbackApiProvider).getPlatformVersion();
    if (currentlyPlaying.metadata.episodeId == widget.episodeId) {
      return;
    } */

    var castingNow = ref.read(isCasting);
    if (!castingNow) {
      playLocal();
    } else {
      playChromecast();
    }
  }

  Future playLocal({int? playbackPositionMs}) async {
    if (!mounted) return;
    var player = ref.read(primaryPlayerProvider);
    if (player.currentMediaItem?.metadata?.episodeId ==
        widget.episodeId.toString()) {
      return;
    }
    var episode = await episodeFuture;
    if (!mounted) return;

    var mediaItem = MediaItem(
        url: episode.streamUrl,
        mimeType: 'application/x-mpegURL',
        metadata: MediaMetadata(
            title: episode.title, episodeId: widget.episodeId.toString()),
        playbackStartPositionMs: playbackPositionMs);

    ref.read(primaryPlayerProvider.notifier).setMediaItem(mediaItem);
    ref
        .read(playbackApiProvider)
        .replaceCurrentMediaItem(player.playerId, mediaItem);
  }

  Future playChromecast({bool playbackPositionFromPrimary = false}) async {
    var episode = await episodeFuture;
    if (!mounted) return;
    ref.read(playbackApiProvider).replaceCurrentMediaItem('chromecast',
        MediaItem(url: episode.streamUrl, mimeType: 'application/x-mpegURL'),
        playbackPositionFromPrimary: playbackPositionFromPrimary);
  }

  @override
  void dispose() {
    //animation?.removeStatusListener(onAnimationStatus); // trying without it, possibly disposed automatically
    super.dispose();
  }

  void onAnimationStatus(AnimationStatus status) {
    setState(() {
      animationStatus = status;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animation = ModalRoute.of(context)?.animation;
    animation?.addStatusListener(onAnimationStatus);
  }

  @override
  Widget build(BuildContext context) {
    final casting = ref.watch(isCasting);
    final primaryPlayerId = ref.watch(primaryPlayerProvider).playerId;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode'),
      ),
      body: animationStatus != AnimationStatus.completed
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
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
                      : FutureBuilder<Episode>(
                          future: episodeFuture,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  BccmPlayer(
                                      type: widget.playerType,
                                      id: primaryPlayerId)
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
