import 'package:flutter/material.dart';
import 'package:my_app/components/player.dart';
import 'package:my_app/pages/episode.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/sections.dart';
import 'package:my_app/states/auth_state.dart';
import 'package:my_app/states/betterplayer_state.dart';
import 'package:my_app/states/videoplayer_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => VideoPlayerState()),
      ChangeNotifierProvider(create: (context) => AuthState()),
    ],
    child: MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const MyHomePage(title: 'Video App'),
      '/login': (context) => LoginPage(loginAction: () {
        print('TODO: show auth0 login now');
        Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
      }),
      '/betterplayer': (context) => const EpisodePage(playerType: PlayerType.betterPlayer),
      '/videoplayer': (context) => const EpisodePage(playerType: PlayerType.videoPlayer),
      '/native': (context) => const EpisodePage(playerType: PlayerType.native),
    },
  )));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String something = 'cool';

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
    });
  }

  void Function() _onItemTap(Item i) {
    return () {
      print('test ${i.url}');
      Navigator.pushNamed(context, i.url);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false),
              child: const Text('Login page'),
            ),
        ],
      ),
      body: ListView(
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemSection(title: 'Videoplayer', items: [
              Item(title: 'Hei1', url: '/native'),
              Item(title: 'Hei1', url: '/videoplayer'),
              Item(title: 'Hei1', url: '/videoplayer'),
              Item(title: 'Hei1', url: '/videoplayer'),
              Item(title: 'Hei1', url: '/videoplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i),)).toList()
            ),
            ItemSection(title: 'Betterplayer', items: [
              Item(title: 'Hei1', url: '/betterplayer'),
              Item(title: 'Hei1', url: '/betterplayer'),
              Item(title: 'Hei1', url: '/betterplayer'),
              Item(title: 'Hei1', url: '/betterplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i))).toList()),
            ItemSection(title: 'Third thing', items: [
              Item(title: 'Hei1', url: '/betterplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i))).toList()),
            ItemSection(title: 'Another one', items: [
              Item(title: 'Hei1', url: '/videoplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i))).toList()),
          ],
        ),]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
