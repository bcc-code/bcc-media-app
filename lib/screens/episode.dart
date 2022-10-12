//import 'dart:html';

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:flutter/scheduler.dart';
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
  final String episodeId;
  bool autoplay;
  EpisodeScreen(
      {super.key,
      @PathParam() required this.episodeId,
      @QueryParam() this.autoplay = false});

  @override
  ConsumerState<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends ConsumerState<EpisodeScreen> {
  late Future<Episode?> episodeFuture;
  bool settingUp = false;
  String? error;
  Completer? setupCompleter;
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
    var playerProvider =
        castingNow ? castPlayerProvider : primaryPlayerProvider;
    setState(() {
      settingUp = true;
    });
    await () async {
      var player = ref.read(playerProvider);
      if (player!.currentMediaItem?.metadata?.extras?['id'] ==
          widget.episodeId.toString()) {
        return;
      }

      var episode = await episodeFuture;
      if (!mounted || episode == null) return;

      await playEpisode(playerId: player.playerId, episode: episode);
      await ensurePlayingWithinReasonableTime(playerProvider);
    }();
  }

  void setStateIfMounted(void Function() fn) {
    if (!mounted) {
      return;
    }
    setState(fn);
  }

  bool isCorrectItem(MediaItem? mediaItem) {
    return mediaItem?.metadata?.extras?['id'] == widget.episodeId;
  }

  Future ensurePlayingWithinReasonableTime(
      StateNotifierProvider<PlayerNotifier, Player?> playerProvider) async {
    setStateIfMounted(() {
      setupCompleter = Completer();
    });

    () async {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 100));
        if (!mounted) return;
        debugPrint('bccm: setupCompleter watch loop ${DateTime.now()}');
        if (isCorrectItem(ref.read(playerProvider)?.currentMediaItem)) {
          debugPrint('bccm: isCorrectItem ${DateTime.now()} !!!!!!!!!!!!!!!!!');
          setupCompleter?.complete();
          setStateIfMounted(() {
            error = null;
            settingUp = false;
          });
          return;
        }
      }
    }();

    await setupCompleter?.future.timeout(const Duration(milliseconds: 10000),
        onTimeout: () {
      debugPrint("bccm: TIMEOUT ${DateTime.now()}");
      setStateIfMounted(() {
        error = 'Something might have gone wrong (timeout).';
      });
    }).catchError((err) {
      error = 'Something went wrong. Technical details: $err.';
    });
  }

  @override
  void dispose() {
    //animation?.removeStatusListener(onAnimationStatus); // trying without it, possibly disposed automatically
    chromecastSubscription?.cancel();
    super.dispose();
  }

  void onAnimationStatus(AnimationStatus status) {
    setStateIfMounted(() {
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
    var playerProvider = casting ? castPlayerProvider : primaryPlayerProvider;
    var player = ref.watch(playerProvider);
    final primaryPlayerId = player!.playerId;

    debugPrint(
        'bccm: ran build method in "live.dart" ${DateTime.now()}. Casting: $casting, currentMediaItem: ${player?.currentMediaItem?.metadata?.extras?["id"]}');

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
          if (error != null) Text(error ?? ''),
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
                      isCorrectItem(player.currentMediaItem)
                          ? _player(displayPlayer, casting, primaryPlayerId)
                          : AspectRatio(
                              aspectRatio: 16 / 9,
                              child: episode == null
                                  ? const Center(
                                      child: SizedBox(
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
                                            setState(() {
                                              settingUp = true;
                                            });
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
                                            child: !settingUp
                                                ? Image.asset(
                                                    'assets/icons/Play.png')
                                                : const CircularProgressIndicator()),
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
          Column(
            children: List.generate(
                100,
                (index) => SizedBox(
                    width: 200,
                    height: 400,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(color: Colors.red)))),
          )
        ],
      ),
    );
  }

  Widget _player(bool displayPlayer, bool casting, String primaryPlayerId) {
    if (displayPlayer) {
      /* if (casting) {
        return ElevatedButton(
            onPressed: () {
              PlaybackPlatformInterface.instance.openExpandedCastController();
            },
            child: const Text('open'));
      } */
      return BccmPlayer(id: casting ? 'chromecast' : primaryPlayerId);
    } else {
      return const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: SizedBox(
                  width: 40, height: 40, child: CircularProgressIndicator())));
    }
  }
}
