import 'package:flutter/material.dart';
import 'package:my_app/components/player.dart';
import 'package:my_app/providers/navigation_provider.dart';
import 'package:my_app/screens/episode.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/providers/auth_state.dart';
import 'package:my_app/providers/videoplayer_state.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.instance.init();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VideoPlayerState()),
        ChangeNotifierProvider(create: (context) => AuthState()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ],
      child: Builder(builder: (context) => MaterialApp(
        
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: NavigationProvider.of(context).onGenerateRoute,
        /* initialRoute: '/',
        routes: {
          '/': (context) => AuthService.instance.idToken != null
              ? const HomeScreen()
              : const LoginScreen(),
          '/login': (context) => const LoginScreen(),
          '/betterplayer': (context) =>
              const EpisodeScreen(playerType: PlayerType.betterPlayer),
          '/videoplayer': (context) =>
              const EpisodeScreen(playerType: PlayerType.videoPlayer),
          '/native': (context) =>
              const EpisodeScreen(playerType: PlayerType.native),
        }, */
      ))));
}
