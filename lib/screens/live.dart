import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/platform_interface.dart';
import 'package:bccm_player/playback_service.dart';
import 'package:flutter/material.dart';
import 'package:my_app/api/livestream.dart';

import '../components/b.dart';
import '../services/auth_service.dart';


class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  String name = AuthService.instance.parsedIdToken!.name;
  final TextEditingController _idTokenDisplayController = TextEditingController(text: AuthService.instance.idToken);
  late Future<String> playerFuture;
  bool audioOnly = false;

  @override
  void initState() {
    super.initState();
    playerFuture = setupPlayer();
  }

  Future<String> setupPlayer() async {
    var playerFuture = BccmPlayerPlatform.instance.newPlayer();
    var liveUrl = await fetchLiveUrl();
    playerFuture.then((playerId) {
      BccmPlayerPlatform.instance.setUrl(playerId: playerId, url: liveUrl.streamUrl, isLive: true);
      BccmPlayerPlatform.instance.setPrimary(playerId);
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
      body: ListView(
        children: [
          const ContactSupport(),
          Text('Hi $name'),
          TextFormField(controller: _idTokenDisplayController, readOnly: true,),
          FutureBuilder<String>(future: playerFuture, builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BccmPlayer(type: PlayerType.native, id: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          })
          //
        ]
      ),
    );
  }
}
