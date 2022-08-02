import 'package:auto_route/auto_route.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/screens/search.dart';

import '../screens/episode.dart';
import '../screens/root.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute<void>(page: LoginScreen, path: '/login'),
    MaterialRoute<void>(page: RootScreen, path: '/', initial: true, children: [
      MaterialRoute<void>(page: HomeScreen, path: 'home'),
      MaterialRoute<void>(page: EpisodeScreen, path: 'episode'),
      MaterialRoute<void>(page: SearchScreen, path: 'search'),
    ]),
  ],
)
class $AppRouter {}
