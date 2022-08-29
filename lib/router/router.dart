import 'package:auto_route/auto_route.dart';
import 'package:my_app/router/auth_guard.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/live.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/screens/search.dart';

import '../screens/episode.dart';
import '../screens/root.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute<void>(page: LoginScreen, path: '/login'),
    CustomRoute<void>(
        page: EpisodeScreen,
        path: 'episode/:episodeId',
        transitionsBuilder: TransitionsBuilders.zoomIn,
        durationInMilliseconds: 200),
    MaterialRoute<void>(page: RootScreen, path: '/', initial: true, guards: [
      AuthGuard
    ], children: [
      MaterialRoute<void>(page: HomeScreen, path: 'home'),
      MaterialRoute<void>(page: LiveScreen, path: 'live'),
      MaterialRoute<void>(page: SearchScreen, path: 'search'),
    ]),
  ],
)
class $AppRouter {}
