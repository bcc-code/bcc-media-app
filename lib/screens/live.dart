import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/api/livestream.dart';
import 'package:my_app/components/mini_player.dart';
import 'package:my_app/providers/playback_api.dart';
import 'package:my_app/providers/video_state.dart';

import '../components/codegen_test_1.dart';
import '../providers/chromecast.dart';
import '../services/auth_service.dart';

class LiveScreen extends ConsumerStatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends ConsumerState<LiveScreen> with AutoRouteAware {
  String name = AuthService.instance.parsedIdToken!.name;
  final TextEditingController _idTokenDisplayController =
      TextEditingController(text: AuthService.instance.idToken);
  late Future playerFuture;
  bool audioOnly = false;

  @override
  void initState() {
    super.initState();
    playerFuture = setupPlayer();
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
                extras: {'id': 'livestream'},
                artworkUri:
                    'https://brunstad.tv/static/images/poster_placeholder.jpg')));
  }

  @override
  Widget build(BuildContext context) {
    var player = ref.watch(primaryPlayerProvider);
    if (player == null) return const SizedBox.shrink();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video app'),
        actions: [
          ElevatedButton(
            onPressed: () => setState(() {
              audioOnly = !audioOnly;
            }),
            child: const Text('Audio only'),
          ),
        ],
      ),
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
                  return const CircularProgressIndicator();
                }),
        const ContactSupport(),
        Text('Hi $name'),
        TextFormField(
          controller: _idTokenDisplayController,
          readOnly: true,
        ),
        //
      ]),
    );
  }
}
