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
  late Future<LivestreamUrl> liveUrlFuture;
  bool audioOnly = false;

  @override
  void initState() {
    super.initState();
    liveUrlFuture = fetchLiveUrl();
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
          FutureBuilder<LivestreamUrl>(future: liveUrlFuture, builder: (context, snapshot) {
            if (snapshot.hasData) {
              /* return BccmPlayer(type: PlayerType.native, url: snapshot.data!.streamUrl,); */
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
