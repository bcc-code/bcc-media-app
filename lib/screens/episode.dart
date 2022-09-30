//import 'dart:html';

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:brunstadtv_app/providers/fun.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:bccm_player/cast_button.dart';

import '../api/brunstadtv.dart';
import '../api/episodes.dart';
import '../components/mini_player.dart';

class EpisodePageArguments {
  int episodeId;
  EpisodePageArguments(this.episodeId);
}

class EpisodeScreen extends ConsumerStatefulWidget {
  final PlayerType playerType = PlayerType.native;
  final String episodeId;
  const EpisodeScreen({super.key, @PathParam() required this.episodeId});

  @override
  ConsumerState<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends ConsumerState<EpisodeScreen> {
  late Future<Episode?> episodeFuture;
  AnimationStatus? animationStatus;
  Animation? animation;
  StreamSubscription? chromecastSubscription;

  @override
  void initState() {
    super.initState();

    episodeFuture =
        ref.read(apiProvider).fetchEpisode(widget.episodeId.toString());

    chromecastSubscription = ref
        .read(chromecastListenerProvider)
        .on<CastSessionUnavailable>()
        .listen((event) async {
      var player = ref.read(primaryPlayerProvider);
      var episode = await episodeFuture;
      if (!mounted || episode == null) return;
      playEpisode(
          playerId: player!.playerId,
          episode: episode,
          playbackPositionMs: event.playbackPositionMs);
    });
  }

  Future setup() async {
    var castingNow = ref.read(isCasting);
    var player = castingNow
        ? ref.read(castPlayerProvider)
        : ref.read(primaryPlayerProvider);

    if (player!.currentMediaItem?.metadata?.extras?['id'] ==
        widget.episodeId.toString()) {
      return;
    }

    var episode = await episodeFuture;
    if (!mounted || episode == null) return;

    playEpisode(playerId: player.playerId, episode: episode);
  }

  @override
  void dispose() {
    //animation?.removeStatusListener(onAnimationStatus); // trying without it, possibly disposed automatically
    chromecastSubscription?.cancel();
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
    final player = ref.watch(primaryPlayerProvider);
    final primaryPlayerId = player!.playerId;
    final playerCurrentIsThisEpisode =
        player.currentMediaItem?.metadata?.extras?['id'] == widget.episodeId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SizedBox(width: 40, child: CastButton()),
          ),
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder<Episode?>(
              future: episodeFuture,
              builder: (context, snapshot) {
                var displayPlayer =
                    animationStatus == AnimationStatus.completed &&
                        snapshot.hasData;

                var episode = snapshot.data;

                var tempTitle = ref.watch(tempTitleProvider) ?? '';

                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                return Container(
                  color: const Color.fromARGB(255, 29, 40, 56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      player.currentMediaItem?.metadata?.extras?['id'] ==
                              widget.episodeId
                          ? _player(displayPlayer, casting, primaryPlayerId)
                          : AspectRatio(
                              aspectRatio: 16 / 9,
                              child: episode == null
                                  ? Center(
                                      child: const SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: CircularProgressIndicator()),
                                    )
                                  : Stack(
                                      children: [
                                        GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          //excludeFromSemantics: true,
                                          onTap: () {
                                            setup();
                                          },
                                          child: AspectRatio(
                                            aspectRatio: 16 / 9,
                                            child: Image.network(
                                              episode!.imageUrl!,
                                              fit: BoxFit.fill,
                                              width: 64,
                                              height: 36,
                                            ),
                                          ),
                                        ),
                                        Center(
                                            child: Image.asset(
                                                'assets/icons/Play.png')),
                                      ],
                                    )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            episode?.title != null ? episode!.title : tempTitle,
                            style: Theme.of(context).textTheme.titleLarge),
                      )
                    ],
                  ),
                );
              }),
          //const SizedBox(width: 100, height: 500)
        ],
      ),
    );
  }

  Widget _player(bool displayPlayer, bool casting, String primaryPlayerId) {
    if (displayPlayer) {
      return BccmPlayer(
          type: widget.playerType,
          id: casting ? 'chromecast' : primaryPlayerId);
    } else {
      return const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: SizedBox(
                  width: 40, height: 40, child: CircularProgressIndicator())));
    }
  }
}
