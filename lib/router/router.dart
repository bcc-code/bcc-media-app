import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:brunstadtv_app/router/auth_guard.dart';
import 'package:brunstadtv_app/screens/calendar/calendar.dart';
import 'package:brunstadtv_app/screens/profile/about.dart';
import 'package:brunstadtv_app/screens/profile/app_language.dart';
import 'package:brunstadtv_app/screens/profile/audio_language.dart';
import 'package:brunstadtv_app/screens/profile/subtitle_language.dart';
import 'package:brunstadtv_app/screens/profile/video_quality.dart';
import 'package:brunstadtv_app/screens/profile/contact_support.dart';
import 'package:brunstadtv_app/screens/profile/faq.dart';
import 'package:brunstadtv_app/screens/home.dart';
import 'package:brunstadtv_app/screens/live.dart';
import 'package:brunstadtv_app/screens/login.dart';
import 'package:brunstadtv_app/screens/profile/profile.dart';
import 'package:brunstadtv_app/screens/search/search.dart';

import '../helpers/custom_transitions.dart';
import '../screens/episode.dart';
import '../screens/page.dart';
import 'special_routes_guard.dart';
import '../screens/tabs_root.dart';
import '../screens/search/explore_category_page.dart';

const _episodeScreenRoute = CustomRoute<void>(
    page: EpisodeScreen,
    path: 'episode/:episodeId',
    durationInMilliseconds: 300,
    reverseDurationInMilliseconds: 300,
    transitionsBuilder: CustomTransitionsBuilders.slideLeft
    //customRouteBuilder: CustomTransitionsBuilders.slideUpAndDown,
    );

const _specialRoutes = AutoRoute(
  page: EmptyRouterPage,
  path: '/',
  guards: [AuthGuard, SpecialRoutesGuard],
  children: [
    AutoRoute<void>(
      page: EmptyRouterPage,
      name: 'CustomActionRoute',
      path: 'r/:code',
    ),
    AutoRoute<void>(
      page: EmptyRouterPage,
      name: 'LegacyEpisodeRoute',
      path: 'series/:legacyEpisodeId',
    ),
    AutoRoute<void>(
      page: EmptyRouterPage,
      name: 'LegacyProgramRoute',
      path: 'program/:legacyProgramId',
    ),
  ],
);

@MaterialAutoRouter(
  routes: [
    MaterialRoute<void>(page: LoginScreen, path: '/login'),
    CustomRoute<void>(
        opaque: false,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        transitionsBuilder: CustomTransitionsBuilders.slideUp,
        page: Profile,
        path: '/profile'),
    CustomRoute<void>(
      page: AppLanguageScreen,
      path: '/app-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
    ),
    CustomRoute<void>(
      page: AppAudioLanguage,
      path: '/audio-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
    ),
    CustomRoute<void>(
      page: AppSubtitleLanguage,
      path: '/subtitle-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
    ),
    CustomRoute<void>(
      page: VideoQuality,
      path: '/video-quality',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
    ),
    CustomRoute<void>(
      page: ContactSupport,
      path: '/contact-support',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
    ),
    CustomRoute<void>(
      page: AboutScreen,
      path: '/about',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
    ),
    CustomRoute<void>(
      page: FAQ,
      path: '/faq',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideLeft,
    ),
    CustomRoute<void>(
      page: HomeScreen,
      name: 'PublicHomeRoute',
      path: '/public-home',
      maintainState: false,
      durationInMilliseconds: 500,
      reverseDurationInMilliseconds: 500,
    ),
    CustomRoute<void>(
      page: TabsRootScreen,
      path: '/',
      initial: true,
      guards: [AuthGuard],
      children: [
        CustomRoute<void>(
            name: 'HomeScreenWrapperRoute',
            page: EmptyRouterPage,
            path: '',
            initial: true,
            children: [
              CustomRoute<void>(
                page: HomeScreen,
                path: '',
                name: 'home',
                maintainState: true,
              ),
              _episodeScreenRoute,
              MaterialRoute<void>(page: PageScreen, path: 'page/:pageCode'),
            ]),
        MaterialRoute<void>(
            page: LiveScreen,
            path: 'live',
            meta: {'hide_mini_player': true},
            maintainState: true),
        MaterialRoute<void>(
            name: 'SearchScreenWrapperRoute',
            page: EmptyRouterPage,
            path: 'search',
            children: [
              MaterialRoute<void>(page: SearchScreen, path: ''),
              MaterialRoute<void>(
                  page: ExploreCategoryScreen, path: 'explore-category'),
              _episodeScreenRoute,
            ]),
        MaterialRoute<void>(
            name: 'CalendarPageRoute', page: CalendarPage, path: 'calendar'),
      ],
    ),
    _specialRoutes,
  ],
)
class $AppRouter {}
