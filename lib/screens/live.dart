import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/cast_button.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/api/livestream.dart';
import 'package:brunstadtv_app/components/mini_player.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:brunstadtv_app/providers/video_state.dart';

import '../components/codegen_test_1.dart';
import '../providers/chromecast.dart';
import '../services/auth_service.dart';

class LiveScreen extends ConsumerStatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends ConsumerState<LiveScreen> with AutoRouteAware {
  String name = AuthService.instance.user!.name!;
  final TextEditingController _idTokenDisplayController =
      TextEditingController(text: AuthService.instance.idToken);
  Future? playerFuture;
  bool audioOnly = false;
  bool settingUp = false;
  String? error;
  Completer? setupCompleter;

  @override
  void initState() {
    super.initState();
    print('initState');
    final tabsRouter = context.tabsRouter;
    tabsRouter.addListener(() {
      if (tabsRouter.activeIndex == 2) {}
    });
  }

  Future setup() async {
    setState(() {
      error = null;
      settingUp = true;
    });
    await () async {
      var castingNow = ref.read(isCasting);
      var player = castingNow
          ? ref.read(castPlayerProvider)
          : ref.read(primaryPlayerProvider);

      if (player == null) {
        throw ErrorDescription('player cant be null');
      }

      var playbackApi = ref.read(playbackApiProvider);
      var liveUrl = await fetchLiveUrl();

      if (player.currentMediaItem?.metadata?.extras?['id'] == 'livestream') {
        return;
      }

      await playbackApi.replaceCurrentMediaItem(
          player.playerId,
          autoplay: true,
          MediaItem(
              url: liveUrl.streamUrl,
              isLive: true,
              metadata: MediaMetadata(
                  artist: 'BrunstadTV',
                  title: 'Live',
                  extras: {'id': 'livestream', 'npaw.content.isLive': 'true'},
                  artworkUri:
                      'https://brunstad.tv/static/images/poster_placeholder.jpg')));
      await ensurePlayingWithinReasonableTime(
          castingNow ? castPlayerProvider : primaryPlayerProvider);
    }();
    setState(() {
      settingUp = false;
    });
  }

  void setStateIfMounted(void Function() fn) {
    if (!mounted) {
      return;
    }
    setState(fn);
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

  bool isCorrectItem(MediaItem? mediaItem) {
    return mediaItem?.metadata?.extras?['id'] == 'livestream';
  }

  @override
  Widget build(BuildContext context) {
    final casting = ref.watch(isCasting);
    var playerProvider = casting ? castPlayerProvider : primaryPlayerProvider;
    var player = ref.watch(playerProvider);

    debugPrint(
        'bccm: ran build method in "live.dart" ${DateTime.now()}. Casting: $casting, currentMediaItem: ${player?.currentMediaItem?.metadata?.extras?["id"]}');

    if (player == null) return const SizedBox.shrink();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(30.0 + MediaQuery.of(context).padding.top),
          child: SafeArea(
            child: Stack(children: [
              const Center(child: Text('Live')),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                          audioOnly = !audioOnly;
                        }),
                        child: const Text('Audio only'),
                      )),
                  const SizedBox(width: 40, child: CastButton()),
                ],
              ),
            ]),
          )),
      body: ListView(children: [
        if (audioOnly)
          const MiniPlayer()
        else if (playerFuture == null ||
            player.currentMediaItem?.metadata?.extras?['id'] != 'livestream')
          _playPoster(player)
        else
          _player(player),
        const SizedBox(height: 20),
        const SizedBox(
            height: 20000,
            child: Align(
                alignment: Alignment.topCenter, child: Text('Calendar here'))),
        //
      ]),
    );
  }

  FutureBuilder<dynamic> _player(Player player) {
    return FutureBuilder(
        future: playerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return BccmPlayer(id: player.playerId);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const AspectRatio(
              aspectRatio: 16 / 9,
              child: Center(child: CircularProgressIndicator()));
        });
  }

  Widget _playPoster(Player player) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          //excludeFromSemantics: true,
          onTap: () {
            setState(() {
              playerFuture = setup();
            });
          },
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              'https://brunstad.tv/static/images/placeholder.jpg',
              fit: BoxFit.fill,
              width: 64,
              height: 36,
            ),
          ),
        ),
        Column(
          children: [
            if (error != null && !isCorrectItem(player.currentMediaItem))
              Text(error ?? ''),
            Center(
                child: !settingUp
                    ? Image.asset('assets/icons/Play.png')
                    : const CircularProgressIndicator())
          ],
        ),
      ],
    );
  }
}
