import 'package:flutter/material.dart';
import 'package:my_app/components/player.dart';
import 'package:my_app/pages/episode.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/states/auth_state.dart';
import 'package:my_app/states/videoplayer_state.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.instance.init();
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
      '/': (context) => AuthService.instance.idToken != null ? const MyHomePage(title: 'Video App') : const LoginPage(),
      '/login': (context) => const LoginPage(),
      '/betterplayer': (context) => const EpisodePage(playerType: PlayerType.betterPlayer),
      '/videoplayer': (context) => const EpisodePage(playerType: PlayerType.videoPlayer),
      '/native': (context) => const EpisodePage(playerType: PlayerType.native),
    },
  )));
}
