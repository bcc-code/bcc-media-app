import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/router/custom_transitions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kids/router/router.gr.dart';

Route<T> settingsRouteBuilder<T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
  if (!kIsWeb) {
    return PageRouteBuilder(
      settings: page,
      pageBuilder: (context, a, b) => CustomTransitionsBuilders.slideUp()(context, a, b, child),
    );
  }
  return DialogRoute(
    context: context,
    settings: page,
    builder: (context) => child,
  );
}

@AutoRouterConfig(replaceInRouteName: 'Screen,ScreenRoute')
class AppRouter extends $AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
        CupertinoRoute(
          path: '/',
          page: HomeScreenRoute.page,
          initial: true,
        ),
        CustomRoute(
          path: '/show/:showId',
          page: ShowScreenRoute.page,
          transitionsBuilder: CustomTransitionsBuilders.slideUp(),
          durationInMilliseconds: 600,
          reverseDurationInMilliseconds: 600,
        ),
        CustomRoute(
          path: '/settings',
          opaque: false,
          durationInMilliseconds: 600,
          reverseDurationInMilliseconds: 600,
          customRouteBuilder: settingsRouteBuilder,
          page: SettingsScreenRoute.page,
          meta: const {RouteMetaConstants.analyticsName: 'settings'},
        ),
      ];
}
