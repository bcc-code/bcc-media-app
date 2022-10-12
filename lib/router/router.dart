import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/router/auth_guard.dart';
import 'package:brunstadtv_app/screens/profile/app_language.dart';
import 'package:brunstadtv_app/screens/profile/audio_language.dart';
import 'package:brunstadtv_app/screens/profile/subtitle_language.dart';
import 'package:brunstadtv_app/screens/profile/video_quality.dart';
import 'package:brunstadtv_app/screens/profile/contact_support.dart';
import 'package:brunstadtv_app/screens/profile/faq.dart';
import 'package:brunstadtv_app/screens/home/home.dart';
import 'package:brunstadtv_app/screens/live.dart';
import 'package:brunstadtv_app/screens/login.dart';
import 'package:brunstadtv_app/screens/profile/profile.dart';
import 'package:brunstadtv_app/screens/search/search.dart';

import '../helpers/custom_transitions.dart';
import '../providers/fun.dart';
import '../screens/episode.dart';
import '../screens/home/explore_category_page.dart';
import '../screens/home/explore_sub_category_page.dart';
import '../screens/root.dart';
import '../screens/search/explore_category_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute<void>(page: LoginScreen, path: '/login'),
    MaterialRoute<void>(page: Profile, path: 'profile'),
    MaterialRoute<void>(page: AppLanguageScreen, path: 'app-language'),
    MaterialRoute<void>(page: AppAudioLanguage, path: 'audio-languga'),
    MaterialRoute<void>(page: AppSubtitleLanguage, path: 'subtitle-language'),
    MaterialRoute<void>(page: VideoQuality, path: 'video-quality'),
    MaterialRoute<void>(page: ContactSupport, path: 'contact-support'),
    MaterialRoute<void>(page: FAQ, path: 'faq'),
    MaterialRoute<void>(
      page: RootScreen,
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
                  durationInMilliseconds: 500,
                  reverseDurationInMilliseconds: 500,
                  customRouteBuilder: CustomTransitionsBuilders.slideUpAndDown),
              CustomRoute<void>(
                  page: EpisodeScreen,
                  path: 'episode/:episodeId',
                  customRouteBuilder: CustomTransitionsBuilders.slideUpAndDown),
              MaterialRoute<void>(
                  page: HomeExploreCategoryScreen, path: 'explore-category'),
              MaterialRoute<void>(
                  page: HomeExploreSubCategoryScreen,
                  path: 'explore-sub-category'),
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
            ]),
      ],
    ),
  ],
)
class $AppRouter {}
