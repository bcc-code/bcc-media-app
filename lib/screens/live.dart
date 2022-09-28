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
  late Future playerFuture;
  bool audioOnly = false;

  @override
  void initState() {
    super.initState();
    print('initState');
    playerFuture = setupPlayer();
    final tabsRouter = context.tabsRouter;
    tabsRouter.addListener(() {
      if (tabsRouter.activeIndex == 2) {
        setState(() {
          playerFuture = setupPlayer();
        });
      }
    });
  }

  Future setupPlayer() async {
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

    playbackApi.replaceCurrentMediaItem(
        player.playerId,
        MediaItem(
            url: liveUrl.streamUrl,
            isLive: true,
            metadata: MediaMetadata(
                artist: 'BrunstadTV',
                title: 'Live',
                extras: {'id': 'livestream', 'npaw.content.isLive': 'true'},
                artworkUri:
                    'https://brunstad.tv/static/images/poster_placeholder.jpg')));
  }

  @override
  Widget build(BuildContext context) {
    var player = ref.watch(primaryPlayerProvider);
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
        audioOnly
            ? const MiniPlayer()
            : FutureBuilder(
                future: playerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return BccmPlayer(
                        type: PlayerType.native, id: player.playerId);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return const AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Center(child: CircularProgressIndicator()));
                }),
        const SizedBox(height: 20),
        const SizedBox(
            height: 20000,
            child: Align(
                alignment: Alignment.topCenter, child: Text('Calendar here'))),
        //
      ]),
    );
  }
}
