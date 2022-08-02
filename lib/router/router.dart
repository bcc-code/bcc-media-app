import 'package:auto_route/auto_route.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/login.dart';

import '../screens/episode.dart';
import '../screens/root.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute<void>(page: RootScreen, path: 'root'),
    MaterialRoute<void>(page: LoginScreen, path: 'login'),
    MaterialRoute<void>(page: HomeScreen, path: 'home'),
    MaterialRoute<void>(page: EpisodeScreen, path: 'episode'),
  ],
)
class $AppRouter {}
