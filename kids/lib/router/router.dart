import 'package:auto_route/auto_route.dart';
import 'package:kids/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,ScreenRoute')
class AppRouter extends $AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
        CupertinoRoute(page: HomeScreenRoute.page, initial: true),
      ];
}
