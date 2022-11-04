//import 'dart:html';

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:extended_image/extended_image.dart';
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
import 'package:flutter_svg/svg.dart';

import '../api/brunstadtv.dart';
import '../components/mini_player.dart';
import '../helpers/btv_colors.dart';

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
  late Future<Query$FetchEpisode$episode?> episodeFuture;
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
          autoplay: false,
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

      var startPositionSeconds = (episode.progress ?? 0);
      if (startPositionSeconds > episode.duration * 0.9) {
        startPositionSeconds = 0;
      }
      await playEpisode(
          playerId: player.playerId,
          episode: episode,
          autoplay: true,
          playbackPositionMs: startPositionSeconds * 1000);
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
        if (isCorrectItem(ref.read(playerProvider)?.currentMediaItem)) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (error != null) Text(error ?? ''),
            FutureBuilder<Query$FetchEpisode$episode?>(
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
                    color: BtvColors.background2,
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
                                    : GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        //excludeFromSemantics: true,
                                        onTap: () {
                                          setState(() {
                                            settingUp = true;
                                          });
                                          Future.delayed(
                                              const Duration(milliseconds: 200),
                                              () {
                                            setup();
                                          });
                                        },
                                        child: Stack(
                                          children: [
                                            AspectRatio(
                                              aspectRatio: 16 / 9,
                                              child: ExtendedImage.network(
                                                episode.imageUrl!,
                                                fit: BoxFit.fill,
                                                width: 64,
                                                height: 36,
                                              ),
                                            ),
                                            Center(
                                                child: !settingUp
                                                    ? Image.asset(
                                                        'assets/icons/Play.png')
                                                    : const CircularProgressIndicator()),
                                          ],
                                        ))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              episode?.title != null
                                  ? episode!.title
                                  : tempTitle,
                              style: Theme.of(context).textTheme.titleLarge),
                        )
                      ],
                    ),
                  );
                }),
            SizedBox(
                height: 1500, child: SvgPicture.string(SvgIcons.chevronDown))
          ],
        ),
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
      return BccmPlayer(
          key: Key('test'), id: casting ? 'chromecast' : primaryPlayerId);
    } else {
      return const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: SizedBox(
                  width: 40, height: 40, child: CircularProgressIndicator())));
    }
  }
}
