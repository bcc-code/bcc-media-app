import 'package:auto_route/auto_route.dart';
import 'package:my_app/router/auth_guard.dart';
import 'package:my_app/router/router.gr.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/live.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/screens/search.dart';
import 'package:my_app/services/auth_service.dart';

import '../screens/episode.dart';
import '../screens/root.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute<void>(page: LoginScreen, path: '/login'),
    MaterialRoute<void>(page: RootScreen, path: '/', initial: true, guards: [AuthGuard], children: [
      MaterialRoute<void>(page: HomeScreen, path: 'home'),
      MaterialRoute<void>(page: LiveScreen, path: 'live'),
      MaterialRoute<void>(page: EpisodeScreen, path: 'episode/:episodeId'),
      MaterialRoute<void>(page: SearchScreen, path: 'search'),
    ]),
  ],
)
class $AppRouter {}
