import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/router/custom_transitions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kids/helpers/transitions.dart';
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
          meta: const {RouteMetaConstants.analyticsName: 'home'},
        ),
        CustomRoute(
          path: '/show/:showId',
          page: ShowScreenRoute.page,
          durationInMilliseconds: 600,
          reverseDurationInMilliseconds: 600,
          transitionsBuilder: CustomTransitionsBuilders.slideUp(),
          meta: const {RouteMetaConstants.analyticsName: 'show'},
        ),
        CustomRoute(
          path: '/playlist/:id',
          page: PlaylistScreenRoute.page,
          transitionsBuilder: CustomTransitionsBuilders.scaleUp(),
          durationInMilliseconds: 600,
          reverseDurationInMilliseconds: 600,
          meta: const {RouteMetaConstants.analyticsName: 'playlist'},
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
        CustomRoute(
          page: FAQScreenRoute.page,
          path: '/faq',
          durationInMilliseconds: 800,
          reverseDurationInMilliseconds: 800,
          customRouteBuilder: settingsRouteBuilder,
          meta: const {RouteMetaConstants.analyticsName: 'faq'},
        ),
        CustomRoute(
          page: ContactScreenRoute.page,
          path: '/contact-support',
          durationInMilliseconds: 800,
          reverseDurationInMilliseconds: 800,
          customRouteBuilder: settingsRouteBuilder,
          meta: const {RouteMetaConstants.analyticsName: 'support'},
        ),
        CustomRoute(
          page: DeviceInfoScreenRoute.page,
          path: '/device-info',
          durationInMilliseconds: 800,
          reverseDurationInMilliseconds: 800,
          customRouteBuilder: settingsRouteBuilder,
          meta: const {RouteMetaConstants.analyticsName: 'device-info'},
        ),
        CustomRoute(
          page: AboutScreenRoute.page,
          path: '/about',
          durationInMilliseconds: 800,
          reverseDurationInMilliseconds: 800,
          customRouteBuilder: settingsRouteBuilder,
          meta: const {RouteMetaConstants.analyticsName: 'about'},
        ),
        CustomRoute(
          page: PrivacyPolicyScreenRoute.page,
          path: '/privacy-policy',
          durationInMilliseconds: 800,
          reverseDurationInMilliseconds: 800,
          customRouteBuilder: settingsRouteBuilder,
          meta: const {RouteMetaConstants.analyticsName: 'privacy-policy'},
        ),
        CustomRoute(
          page: TermsOfUseScreenRoute.page,
          path: '/terms-of-use',
          durationInMilliseconds: 800,
          reverseDurationInMilliseconds: 800,
          customRouteBuilder: settingsRouteBuilder,
          meta: const {RouteMetaConstants.analyticsName: 'terms-of-use'},
        ),
        CustomRoute(
          page: ExtraUsergroupsScreenRoute.page,
          path: '/extra-usergroups',
          durationInMilliseconds: 800,
          reverseDurationInMilliseconds: 800,
          customRouteBuilder: settingsRouteBuilder,
          meta: const {RouteMetaConstants.analyticsName: 'extra-usergroups'},
        ),
        CustomRoute(
          path: '/search',
          page: SearchScreenRoute.page,
          transitionsBuilder: CustomTransitionsBuilders.scaleUp(),
          durationInMilliseconds: 600,
          reverseDurationInMilliseconds: 600,
          meta: const {RouteMetaConstants.analyticsName: 'search'},
        ),
        CustomRoute(
          page: EpisodeScreenRoute.page,
          path: '/episode/:episodeId',
          meta: const {RouteMetaConstants.analyticsName: 'episode'},
          reverseDurationInMilliseconds: 400,
          durationInMilliseconds: 400,
          transitionsBuilder: (context, prim, second, child) {
            return MorphTransition(
              primary: prim,
              secondary: second,
              fallbackTransitionBuilder: CustomTransitionsBuilders.scaleUp(),
              duration: 400.ms,
              child: child,
            );
          },
        ),
        CustomRoute(
          page: AppLanguageScreenRoute.page,
          path: '/app-language',
          durationInMilliseconds: 800,
          reverseDurationInMilliseconds: 800,
          customRouteBuilder: settingsRouteBuilder,
          meta: const {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'appLanguage'},
        ),
      ];
}
