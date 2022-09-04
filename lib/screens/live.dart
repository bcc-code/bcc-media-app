import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/api/livestream.dart';
import 'package:my_app/providers/playback_api.dart';

import '../components/codegen_test_1.dart';
import '../services/auth_service.dart';

class LiveScreen extends ConsumerStatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends ConsumerState<LiveScreen> {
  String name = AuthService.instance.parsedIdToken!.name;
  final TextEditingController _idTokenDisplayController =
      TextEditingController(text: AuthService.instance.idToken);
  late Future<String> playerFuture;
  bool audioOnly = false;

  @override
  void initState() {
    super.initState();
    playerFuture = setupPlayer();
  }

  Future<String> setupPlayer() async {
    var playbackApi = ref.read(playbackApiProvider);
    var playerFuture = playbackApi.newPlayer();
    var liveUrl = await fetchLiveUrl();
    playerFuture.then((playerId) {
      playbackApi.setUrl(
          playerId: playerId, url: liveUrl.streamUrl, isLive: true);
      playbackApi.setPrimary(playerId);
      return playerId;
    });
    return playerFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video app'),
        actions: [
          ElevatedButton(
            onPressed: () => setState(() {
              audioOnly = true;
            }),
            child: const Text('Audio only'),
          ),
        ],
      ),
      body: ListView(children: [
        const ContactSupport(),
        Text('Hi $name'),
        TextFormField(
          controller: _idTokenDisplayController,
          readOnly: true,
        ),
        FutureBuilder<String>(
            future: playerFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BccmPlayer(type: PlayerType.native, id: snapshot.data!);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const CircularProgressIndicator();
            })
        //
      ]),
    );
  }
}
