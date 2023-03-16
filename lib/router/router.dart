import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/screens/auto_login.dart';
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
import 'package:brunstadtv_app/screens/study.dart';

import '../helpers/navigation/custom_transitions.dart';
import '../screens/achievement_group.dart';
import '../screens/achievements.dart';
import '../screens/episode.dart';
import '../screens/page.dart';
import 'special_routes_guard.dart';
import '../screens/tabs_root.dart';

const _episodeScreenRoute = CustomRoute<void>(
  page: EpisodeScreen,
  path: 'episode/:episodeId',
  durationInMilliseconds: 300,
  reverseDurationInMilliseconds: 300,
  transitionsBuilder: CustomTransitionsBuilders.slideLeft,
  meta: {RouteMetaConstants.analyticsName: 'episode'},
);

const _pageScreenRoute = CustomRoute<void>(
    page: PageScreen,
    path: ':pageCode',
    usesPathAsKey: true,
    durationInMilliseconds: 300,
    reverseDurationInMilliseconds: 300,
    transitionsBuilder: CustomTransitionsBuilders.slideLeft);

@MaterialAutoRouter(
  routes: [
    MaterialRoute<void>(page: LoginScreen, path: 'login', meta: {RouteMetaConstants.analyticsName: 'login'}),
    CustomRoute<void>(
        opaque: false,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        transitionsBuilder: CustomTransitionsBuilders.slideUp,
        page: Profile,
        path: '/profile',
        meta: {RouteMetaConstants.analyticsName: 'profile'}),
    CustomRoute<void>(
      page: AppLanguageScreen,
      path: '/app-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
      meta: {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'appLanguage'},
    ),
    CustomRoute<void>(
      page: AppAudioLanguage,
      path: '/audio-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
      meta: {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'audioLanguage'},
    ),
    CustomRoute<void>(
      page: AppSubtitleLanguage,
      path: '/subtitle-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
      meta: {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'subtitlesLanguage'},
    ),
    CustomRoute<void>(
      page: VideoQuality,
      path: '/video-quality',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
      meta: {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'videoQuality'},
    ),
    CustomRoute<void>(
      page: ContactSupport,
      path: '/contact-support',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
      meta: {RouteMetaConstants.analyticsName: 'support'},
    ),
    CustomRoute<void>(
      page: AboutScreen,
      path: '/about',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp,
      meta: {RouteMetaConstants.analyticsName: 'about'},
    ),
    CustomRoute<void>(
      page: FAQ,
      path: '/faq',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideLeft,
      meta: {RouteMetaConstants.analyticsName: 'faq'},
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
      page: EpisodeScreen,
      name: 'EmbedScreen',
      path: '/embed/:episodeId',
      durationInMilliseconds: 300,
      reverseDurationInMilliseconds: 300,
      transitionsBuilder: CustomTransitionsBuilders.slideLeft,
      meta: {RouteMetaConstants.analyticsName: 'episode'},
    ),
    CustomRoute<void>(
        page: StudyScreen,
        path: 'study-lesson',
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        transitionsBuilder: CustomTransitionsBuilders.slideUp,
        meta: {RouteMetaConstants.analyticsName: 'study-lesson'}),
    CustomRoute<void>(
        page: AchievementsScreen,
        path: '/achievements',
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        transitionsBuilder: CustomTransitionsBuilders.slideUp,
        meta: {RouteMetaConstants.analyticsName: 'achievements'}),
    CustomRoute<void>(
        page: AchievementGroupScreen,
        path: '/achievement-group/:groupId',
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        transitionsBuilder: CustomTransitionsBuilders.slideUp,
        meta: {
          RouteMetaConstants.analyticsName: 'achievement-group',
        }),
    CustomRoute<void>(
      page: TabsRootScreen,
      guards: [SpecialRoutesGuard],
      path: '/',
      children: [
        AutoRoute<void>(
          page: EmptyRouterPage,
          name: 'RedirectRoute',
          path: 'r/:code',
        ),
        AutoRoute<void>(
          page: EmptyRouterPage,
          name: 'TvLoginRoute',
          path: 'tvlogin/*',
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
        MaterialRoute<void>(
            page: LiveScreen,
            path: 'live',
            meta: {
              RouteMetaConstants.hideMiniPlayer: true,
              RouteMetaConstants.navTabRoute: true,
              RouteMetaConstants.analyticsName: 'livestream',
            },
            maintainState: true),
        MaterialRoute<void>(
          name: 'SearchScreenWrapperRoute',
          page: EmptyRouterPage,
          path: 'search',
          children: [
            MaterialRoute<void>(
              page: SearchScreen,
              path: '',
              meta: {RouteMetaConstants.navTabRoute: true},
            ),
            _episodeScreenRoute,
            _pageScreenRoute,
          ],
        ),
        MaterialRoute<void>(
          name: 'CalendarPageRoute',
          page: CalendarPage,
          path: 'calendar',
          meta: {RouteMetaConstants.navTabRoute: true, RouteMetaConstants.analyticsName: 'calendar'},
        ),
        CustomRoute<void>(name: 'HomeScreenWrapperRoute', page: EmptyRouterPage, path: '', children: [
          CustomRoute<void>(
            page: HomeScreen,
            path: '',
            name: 'home',
            initial: true,
            maintainState: true,
            meta: {RouteMetaConstants.navTabRoute: true},
          ),
          _episodeScreenRoute,
          _pageScreenRoute,
        ]),
      ],
    ),
  ],
)
class $AppRouter {}
