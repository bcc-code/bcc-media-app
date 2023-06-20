import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/screens/auto_login.dart';
import 'package:brunstadtv_app/screens/calendar.dart';
import 'package:brunstadtv_app/screens/extra_usergroups.dart';
import 'package:brunstadtv_app/screens/games/game.dart';
import 'package:brunstadtv_app/screens/my_list.dart';
import 'package:brunstadtv_app/screens/profile/about.dart';
import 'package:brunstadtv_app/screens/profile/app_language.dart';
import 'package:brunstadtv_app/screens/profile/audio_language.dart';
import 'package:brunstadtv_app/screens/profile/privacy_policy.dart';
import 'package:brunstadtv_app/screens/profile/subtitle_language.dart';
import 'package:brunstadtv_app/screens/profile/video_quality.dart';
import 'package:brunstadtv_app/screens/profile/contact.dart';
import 'package:brunstadtv_app/screens/profile/faq.dart';
import 'package:brunstadtv_app/screens/home.dart';
import 'package:brunstadtv_app/screens/live.dart';
import 'package:brunstadtv_app/screens/profile/account_deletion.dart';
import 'package:brunstadtv_app/screens/onboarding/onboarding.dart';
import 'package:brunstadtv_app/screens/profile/profile.dart';
import 'package:brunstadtv_app/screens/search.dart';
import 'package:brunstadtv_app/screens/study.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../screens/profile/device_info.dart';
import '../helpers/navigation/custom_transitions.dart';
import '../screens/achievement_group.dart';
import '../screens/achievements.dart';
import '../screens/episode.dart';
import '../screens/games/games.dart';
import '../screens/page.dart';
import '../screens/onboarding/signup.dart';
import '../screens/profile/contact_public.dart';
import '../screens/tabs_root.dart';

const _collectionEpisodeScreenRoute = CustomRoute<void>(
  page: CollectionEpisodeScreen,
  path: 'episode/:collectionId/:episodeId',
  durationInMilliseconds: 300,
  reverseDurationInMilliseconds: 300,
  transitionsBuilder: CustomTransitionsBuilders.slideLeft,
  meta: {RouteMetaConstants.analyticsName: 'episode'},
);

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

const _gameScreenRoute = CupertinoRoute<void>(
  page: GameScreen,
  path: ':gameId',
  maintainState: false,
);

Route<T> modalSheetBuilder<T>(BuildContext context, Widget child, CustomPage<T> page) {
  return ModalSheetRoute(
    settings: page,
    builder: (context) => child,
    animationCurve: Curves.easeOutCirc,
    expanded: true,
  );
}

Route<T> profileRouteBuilder<T>(BuildContext context, Widget child, CustomPage<T> page) {
  if (!kIsWeb) return PageRouteBuilder(settings: page, pageBuilder: (context, a, b) => CustomTransitionsBuilders.slideUp(context, a, b, child));
  return DialogRoute(
    context: context,
    settings: page,
    builder: (context) => child,
  );
}

@MaterialAutoRouter(
  deferredLoading: false,
  routes: [
    AutoRoute<void>(page: AutoLoginScreen, path: '/auto-login'),
    CustomRoute<void>(
      page: OnboardingScreen,
      path: '/login',
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'login'},
    ),
    CustomRoute<void>(
      customRouteBuilder: modalSheetBuilder,
      page: SignupScreen,
      path: 'signup',
      meta: {RouteMetaConstants.analyticsName: 'signup'},
    ),
    CustomRoute<void>(
        opaque: false,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        customRouteBuilder: profileRouteBuilder,
        page: ProfileScreen,
        path: '/profile',
        meta: {RouteMetaConstants.analyticsName: 'profile'}),
    CustomRoute<void>(
      page: AppLanguageScreen,
      path: '/app-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'appLanguage'},
    ),
    CustomRoute<void>(
      page: AudioLanguageScreen,
      path: '/audio-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'audioLanguage'},
    ),
    CustomRoute<void>(
      page: SubtitleLanguageScreen,
      path: '/subtitle-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'subtitlesLanguage'},
    ),
    CustomRoute<void>(
      page: VideoQualityScreen,
      path: '/video-quality',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'videoQuality'},
    ),
    CustomRoute<void>(
      page: ContactScreen,
      path: '/contact-support',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'support'},
    ),
    CustomRoute<void>(
      page: ContactPublicScreen,
      path: '/contact-support-public',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'support'},
    ),
    CustomRoute<void>(
      page: DeviceInfoScreen,
      path: '/device-info',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'support'},
    ),
    CustomRoute<void>(
      page: AboutScreen,
      path: '/about',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'about'},
    ),
    CustomRoute<void>(
      page: FAQScreen,
      path: '/faq',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'faq'},
    ),
    CustomRoute<void>(
      page: PrivacyPolicyScreen,
      path: '/privacy-policy',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'privacy-policy'},
    ),
    CustomRoute<void>(
      page: AccountDeletionScreen,
      path: '/account-deletion',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'account-deletion'},
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
      page: ExtraUsergroupsScreen,
      name: 'ExtraUsergroupsScreen',
      path: '/extra-usergroups',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: profileRouteBuilder,
      meta: {RouteMetaConstants.analyticsName: 'extra-usergroups'},
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
      path: '/',
      children: [
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
            _collectionEpisodeScreenRoute,
            _pageScreenRoute,
            _gameScreenRoute,
          ],
        ),
        MaterialRoute<void>(
          page: CalendarPage,
          path: 'calendar',
          meta: {RouteMetaConstants.navTabRoute: true, RouteMetaConstants.analyticsName: 'calendar'},
        ),
        CustomRoute<void>(
          name: 'MyListScreenWrapperRoute',
          page: EmptyRouterPage,
          path: 'my-list',
          maintainState: false,
          children: [
            CustomRoute<void>(
              page: MyListScreen,
              path: '',
              maintainState: false,
              meta: {RouteMetaConstants.navTabRoute: true},
            ),
            _episodeScreenRoute,
            _collectionEpisodeScreenRoute
          ],
        ),
        CustomRoute<void>(
          name: 'GamesWrapperRoute',
          page: EmptyRouterPage,
          path: 'games',
          maintainState: true,
          children: [
            CupertinoRoute<void>(
              page: GamesScreen,
              path: '',
              maintainState: true,
              meta: {RouteMetaConstants.navTabRoute: true},
            ),
            _gameScreenRoute,
          ],
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
          _collectionEpisodeScreenRoute,
          _pageScreenRoute,
          _gameScreenRoute,
        ]),
      ],
    ),
  ],
)
class $AppRouter {}
