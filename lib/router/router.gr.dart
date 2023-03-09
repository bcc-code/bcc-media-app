// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:auto_route/empty_router_widgets.dart' as _i18;
import 'package:flutter/material.dart' as _i24;

import '../helpers/navigation/custom_transitions.dart' as _i27;
import '../screens/achievement_group.dart' as _i16;
import '../screens/achievements.dart' as _i15;
import '../screens/auto_login.dart' as _i13;
import '../screens/calendar/calendar.dart' as _i20;
import '../screens/episode.dart' as _i12;
import '../screens/home.dart' as _i11;
import '../screens/live.dart' as _i19;
import '../screens/onboarding/onboarding.dart' as _i1;
import '../screens/onboarding/signup.dart' as _i2;
import '../screens/page.dart' as _i22;
import '../screens/profile/about.dart' as _i9;
import '../screens/profile/app_language.dart' as _i4;
import '../screens/profile/audio_language.dart' as _i5;
import '../screens/profile/contact_support.dart' as _i8;
import '../screens/profile/faq.dart' as _i10;
import '../screens/profile/profile.dart' as _i3;
import '../screens/profile/subtitle_language.dart' as _i6;
import '../screens/profile/video_quality.dart' as _i7;
import '../screens/search/search.dart' as _i21;
import '../screens/study.dart' as _i14;
import '../screens/tabs_root.dart' as _i17;
import 'router.dart' as _i26;
import 'special_routes_guard.dart' as _i25;

class AppRouter extends _i23.RootStackRouter {
  AppRouter({
    _i24.GlobalKey<_i24.NavigatorState>? navigatorKey,
    required this.specialRoutesGuard,
  }) : super(navigatorKey);

  final _i25.SpecialRoutesGuard specialRoutesGuard;

  @override
  final Map<String, _i23.PageFactory> pagesMap = {
    OnboardingScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingScreenRouteArgs>(
          orElse: () => const OnboardingScreenRouteArgs());
      return _i23.MaterialPageX<void>(
        routeData: routeData,
        child: _i1.OnboardingScreen(
          key: args.key,
          loginError: args.loginError,
          onResult: args.onResult,
        ),
      );
    },
    SignupScreenRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i2.SignupScreen(),
        customRouteBuilder: _i26.modalSheetBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i3.Profile(),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: false,
        barrierDismissible: false,
      );
    },
    AppLanguageScreenRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i4.AppLanguageScreen(),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AppAudioLanguageRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i5.AppAudioLanguage(),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AppSubtitleLanguageRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i6.AppSubtitleLanguage(),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VideoQualityRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i7.VideoQuality(),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactSupportRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i8.ContactSupport(),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AboutScreenRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i9.AboutScreen(),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FAQRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i10.FAQ(),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PublicHomeRoute.name: (routeData) {
      final args = routeData.argsAs<PublicHomeRouteArgs>(
          orElse: () => const PublicHomeRouteArgs());
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: _i11.HomeScreen(key: args.key),
        maintainState: false,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EmbedScreen.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<EmbedScreenArgs>(
          orElse: () => EmbedScreenArgs(
                episodeId: pathParams.getString('episodeId'),
                autoplay: queryParams.getBool(
                  'autoplay',
                  false,
                ),
                queryParamStartPosition: queryParams.optInt('t'),
                hideBottomSection: queryParams.getBool(
                  'hide_bottom_section',
                  false,
                ),
              ));
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: _i12.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
        ),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AutoLoginScreeenRoute.name: (routeData) {
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i13.AutoLoginScreeen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    StudyScreenRoute.name: (routeData) {
      final args = routeData.argsAs<StudyScreenRouteArgs>();
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: _i14.StudyScreen(
          key: args.key,
          episodeId: args.episodeId,
          lessonId: args.lessonId,
        ),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AchievementsScreenRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i15.AchievementsScreen(),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AchievementGroupScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AchievementGroupScreenRouteArgs>(
          orElse: () => AchievementGroupScreenRouteArgs(
              groupId: pathParams.getString('groupId')));
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: _i16.AchievementGroupScreen(
          key: args.key,
          groupId: args.groupId,
        ),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TabsRootScreenRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i17.TabsRootScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    EmptyRouterPageRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.EmptyRouterPage(),
      );
    },
    LiveScreenRoute.name: (routeData) {
      return _i23.MaterialPageX<void>(
        routeData: routeData,
        child: const _i19.LiveScreen(),
      );
    },
    SearchScreenWrapperRoute.name: (routeData) {
      return _i23.MaterialPageX<void>(
        routeData: routeData,
        child: const _i18.EmptyRouterPage(),
      );
    },
    CalendarPageRoute.name: (routeData) {
      return _i23.MaterialPageX<void>(
        routeData: routeData,
        child: const _i20.CalendarPage(),
      );
    },
    HomeScreenWrapperRoute.name: (routeData) {
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: const _i18.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SearchScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<SearchScreenRouteArgs>(
          orElse: () =>
              SearchScreenRouteArgs(query: queryParams.optString('q')));
      return _i23.MaterialPageX<void>(
        routeData: routeData,
        child: _i21.SearchScreen(
          key: args.key,
          query: args.query,
        ),
      );
    },
    EpisodeScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<EpisodeScreenRouteArgs>(
          orElse: () => EpisodeScreenRouteArgs(
                episodeId: pathParams.getString('episodeId'),
                autoplay: queryParams.getBool(
                  'autoplay',
                  false,
                ),
                queryParamStartPosition: queryParams.optInt('t'),
                hideBottomSection: queryParams.getBool(
                  'hide_bottom_section',
                  false,
                ),
              ));
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: _i12.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
        ),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PageScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PageScreenRouteArgs>(
          orElse: () =>
              PageScreenRouteArgs(pageCode: pathParams.getString('pageCode')));
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: _i22.PageScreen(
          key: args.key,
          pageCode: args.pageCode,
        ),
        transitionsBuilder: _i27.CustomTransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    Home.name: (routeData) {
      final args = routeData.argsAs<HomeArgs>(orElse: () => const HomeArgs());
      return _i23.CustomPage<void>(
        routeData: routeData,
        child: _i11.HomeScreen(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    RedirectRoute.name: (routeData) {
      return _i23.MaterialPageX<void>(
        routeData: routeData,
        child: const _i18.EmptyRouterPage(),
      );
    },
    TvLoginRoute.name: (routeData) {
      return _i23.MaterialPageX<void>(
        routeData: routeData,
        child: const _i18.EmptyRouterPage(),
      );
    },
    LegacyEpisodeRoute.name: (routeData) {
      return _i23.MaterialPageX<void>(
        routeData: routeData,
        child: const _i18.EmptyRouterPage(),
      );
    },
    LegacyProgramRoute.name: (routeData) {
      return _i23.MaterialPageX<void>(
        routeData: routeData,
        child: const _i18.EmptyRouterPage(),
      );
    },
  };

  @override
  List<_i23.RouteConfig> get routes => [
        _i23.RouteConfig(
          OnboardingScreenRoute.name,
          path: 'login',
          meta: <String, dynamic>{'analytics_name': 'login'},
        ),
        _i23.RouteConfig(
          SignupScreenRoute.name,
          path: 'signup',
          meta: <String, dynamic>{'analytics_name': 'signup'},
        ),
        _i23.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
          meta: <String, dynamic>{'analytics_name': 'profile'},
        ),
        _i23.RouteConfig(
          AppLanguageScreenRoute.name,
          path: '/app-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'appLanguage',
          },
        ),
        _i23.RouteConfig(
          AppAudioLanguageRoute.name,
          path: '/audio-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'audioLanguage',
          },
        ),
        _i23.RouteConfig(
          AppSubtitleLanguageRoute.name,
          path: '/subtitle-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'subtitlesLanguage',
          },
        ),
        _i23.RouteConfig(
          VideoQualityRoute.name,
          path: '/video-quality',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'videoQuality',
          },
        ),
        _i23.RouteConfig(
          ContactSupportRoute.name,
          path: '/contact-support',
          meta: <String, dynamic>{'analytics_name': 'support'},
        ),
        _i23.RouteConfig(
          AboutScreenRoute.name,
          path: '/about',
          meta: <String, dynamic>{'analytics_name': 'about'},
        ),
        _i23.RouteConfig(
          FAQRoute.name,
          path: '/faq',
          meta: <String, dynamic>{'analytics_name': 'faq'},
        ),
        _i23.RouteConfig(
          PublicHomeRoute.name,
          path: '/public-home',
        ),
        _i23.RouteConfig(
          EmbedScreen.name,
          path: '/embed/:episodeId',
          meta: <String, dynamic>{'analytics_name': 'episode'},
        ),
        _i23.RouteConfig(
          AutoLoginScreeenRoute.name,
          path: 'auto-login',
        ),
        _i23.RouteConfig(
          StudyScreenRoute.name,
          path: 'study-lesson',
          meta: <String, dynamic>{'analytics_name': 'study-lesson'},
        ),
        _i23.RouteConfig(
          AchievementsScreenRoute.name,
          path: '/achievements',
          meta: <String, dynamic>{'analytics_name': 'achievements'},
        ),
        _i23.RouteConfig(
          AchievementGroupScreenRoute.name,
          path: '/achievement-group/:groupId',
          meta: <String, dynamic>{'analytics_name': 'achievement-group'},
        ),
        _i23.RouteConfig(
          TabsRootScreenRoute.name,
          path: '/',
          children: [
            _i23.RouteConfig(
              LiveScreenRoute.name,
              path: 'live',
              parent: TabsRootScreenRoute.name,
              meta: <String, dynamic>{
                'hide_mini_player': true,
                'nav_tab_route': true,
                'analytics_name': 'livestream',
              },
            ),
            _i23.RouteConfig(
              SearchScreenWrapperRoute.name,
              path: 'search',
              parent: TabsRootScreenRoute.name,
              children: [
                _i23.RouteConfig(
                  SearchScreenRoute.name,
                  path: '',
                  parent: SearchScreenWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i23.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: SearchScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i23.RouteConfig(
                  PageScreenRoute.name,
                  path: ':pageCode',
                  parent: SearchScreenWrapperRoute.name,
                  usesPathAsKey: true,
                ),
              ],
            ),
            _i23.RouteConfig(
              CalendarPageRoute.name,
              path: 'calendar',
              parent: TabsRootScreenRoute.name,
              meta: <String, dynamic>{
                'nav_tab_route': true,
                'analytics_name': 'calendar',
              },
            ),
            _i23.RouteConfig(
              HomeScreenWrapperRoute.name,
              path: '',
              parent: TabsRootScreenRoute.name,
              children: [
                _i23.RouteConfig(
                  Home.name,
                  path: '',
                  parent: HomeScreenWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i23.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: HomeScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i23.RouteConfig(
                  PageScreenRoute.name,
                  path: ':pageCode',
                  parent: HomeScreenWrapperRoute.name,
                  usesPathAsKey: true,
                ),
              ],
            ),
          ],
        ),
        _i23.RouteConfig(
          EmptyRouterPageRoute.name,
          path: '/',
          guards: [specialRoutesGuard],
          children: [
            _i23.RouteConfig(
              RedirectRoute.name,
              path: 'r/:code',
              parent: EmptyRouterPageRoute.name,
            ),
            _i23.RouteConfig(
              TvLoginRoute.name,
              path: 'tvlogin/*',
              parent: EmptyRouterPageRoute.name,
            ),
            _i23.RouteConfig(
              LegacyEpisodeRoute.name,
              path: 'series/:legacyEpisodeId',
              parent: EmptyRouterPageRoute.name,
            ),
            _i23.RouteConfig(
              LegacyProgramRoute.name,
              path: 'program/:legacyProgramId',
              parent: EmptyRouterPageRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingScreenRoute
    extends _i23.PageRouteInfo<OnboardingScreenRouteArgs> {
  OnboardingScreenRoute({
    _i24.Key? key,
    String? loginError,
    void Function(bool)? onResult,
  }) : super(
          OnboardingScreenRoute.name,
          path: 'login',
          args: OnboardingScreenRouteArgs(
            key: key,
            loginError: loginError,
            onResult: onResult,
          ),
        );

  static const String name = 'OnboardingScreenRoute';
}

class OnboardingScreenRouteArgs {
  const OnboardingScreenRouteArgs({
    this.key,
    this.loginError,
    this.onResult,
  });

  final _i24.Key? key;

  final String? loginError;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'OnboardingScreenRouteArgs{key: $key, loginError: $loginError, onResult: $onResult}';
  }
}

/// generated route for
/// [_i2.SignupScreen]
class SignupScreenRoute extends _i23.PageRouteInfo<void> {
  const SignupScreenRoute()
      : super(
          SignupScreenRoute.name,
          path: 'signup',
        );

  static const String name = 'SignupScreenRoute';
}

/// generated route for
/// [_i3.Profile]
class ProfileRoute extends _i23.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i4.AppLanguageScreen]
class AppLanguageScreenRoute extends _i23.PageRouteInfo<void> {
  const AppLanguageScreenRoute()
      : super(
          AppLanguageScreenRoute.name,
          path: '/app-language',
        );

  static const String name = 'AppLanguageScreenRoute';
}

/// generated route for
/// [_i5.AppAudioLanguage]
class AppAudioLanguageRoute extends _i23.PageRouteInfo<void> {
  const AppAudioLanguageRoute()
      : super(
          AppAudioLanguageRoute.name,
          path: '/audio-language',
        );

  static const String name = 'AppAudioLanguageRoute';
}

/// generated route for
/// [_i6.AppSubtitleLanguage]
class AppSubtitleLanguageRoute extends _i23.PageRouteInfo<void> {
  const AppSubtitleLanguageRoute()
      : super(
          AppSubtitleLanguageRoute.name,
          path: '/subtitle-language',
        );

  static const String name = 'AppSubtitleLanguageRoute';
}

/// generated route for
/// [_i7.VideoQuality]
class VideoQualityRoute extends _i23.PageRouteInfo<void> {
  const VideoQualityRoute()
      : super(
          VideoQualityRoute.name,
          path: '/video-quality',
        );

  static const String name = 'VideoQualityRoute';
}

/// generated route for
/// [_i8.ContactSupport]
class ContactSupportRoute extends _i23.PageRouteInfo<void> {
  const ContactSupportRoute()
      : super(
          ContactSupportRoute.name,
          path: '/contact-support',
        );

  static const String name = 'ContactSupportRoute';
}

/// generated route for
/// [_i9.AboutScreen]
class AboutScreenRoute extends _i23.PageRouteInfo<void> {
  const AboutScreenRoute()
      : super(
          AboutScreenRoute.name,
          path: '/about',
        );

  static const String name = 'AboutScreenRoute';
}

/// generated route for
/// [_i10.FAQ]
class FAQRoute extends _i23.PageRouteInfo<void> {
  const FAQRoute()
      : super(
          FAQRoute.name,
          path: '/faq',
        );

  static const String name = 'FAQRoute';
}

/// generated route for
/// [_i11.HomeScreen]
class PublicHomeRoute extends _i23.PageRouteInfo<PublicHomeRouteArgs> {
  PublicHomeRoute({_i24.Key? key})
      : super(
          PublicHomeRoute.name,
          path: '/public-home',
          args: PublicHomeRouteArgs(key: key),
        );

  static const String name = 'PublicHomeRoute';
}

class PublicHomeRouteArgs {
  const PublicHomeRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'PublicHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.EpisodeScreen]
class EmbedScreen extends _i23.PageRouteInfo<EmbedScreenArgs> {
  EmbedScreen({
    _i24.Key? key,
    required String episodeId,
    bool autoplay = false,
    int? queryParamStartPosition,
    bool hideBottomSection = false,
  }) : super(
          EmbedScreen.name,
          path: '/embed/:episodeId',
          args: EmbedScreenArgs(
            key: key,
            episodeId: episodeId,
            autoplay: autoplay,
            queryParamStartPosition: queryParamStartPosition,
            hideBottomSection: hideBottomSection,
          ),
          rawPathParams: {'episodeId': episodeId},
          rawQueryParams: {
            'autoplay': autoplay,
            't': queryParamStartPosition,
            'hide_bottom_section': hideBottomSection,
          },
        );

  static const String name = 'EmbedScreen';
}

class EmbedScreenArgs {
  const EmbedScreenArgs({
    this.key,
    required this.episodeId,
    this.autoplay = false,
    this.queryParamStartPosition,
    this.hideBottomSection = false,
  });

  final _i24.Key? key;

  final String episodeId;

  final bool autoplay;

  final int? queryParamStartPosition;

  final bool hideBottomSection;

  @override
  String toString() {
    return 'EmbedScreenArgs{key: $key, episodeId: $episodeId, autoplay: $autoplay, queryParamStartPosition: $queryParamStartPosition, hideBottomSection: $hideBottomSection}';
  }
}

/// generated route for
/// [_i13.AutoLoginScreeen]
class AutoLoginScreeenRoute extends _i23.PageRouteInfo<void> {
  const AutoLoginScreeenRoute()
      : super(
          AutoLoginScreeenRoute.name,
          path: 'auto-login',
        );

  static const String name = 'AutoLoginScreeenRoute';
}

/// generated route for
/// [_i14.StudyScreen]
class StudyScreenRoute extends _i23.PageRouteInfo<StudyScreenRouteArgs> {
  StudyScreenRoute({
    _i24.Key? key,
    required String episodeId,
    required String lessonId,
  }) : super(
          StudyScreenRoute.name,
          path: 'study-lesson',
          args: StudyScreenRouteArgs(
            key: key,
            episodeId: episodeId,
            lessonId: lessonId,
          ),
        );

  static const String name = 'StudyScreenRoute';
}

class StudyScreenRouteArgs {
  const StudyScreenRouteArgs({
    this.key,
    required this.episodeId,
    required this.lessonId,
  });

  final _i24.Key? key;

  final String episodeId;

  final String lessonId;

  @override
  String toString() {
    return 'StudyScreenRouteArgs{key: $key, episodeId: $episodeId, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i15.AchievementsScreen]
class AchievementsScreenRoute extends _i23.PageRouteInfo<void> {
  const AchievementsScreenRoute()
      : super(
          AchievementsScreenRoute.name,
          path: '/achievements',
        );

  static const String name = 'AchievementsScreenRoute';
}

/// generated route for
/// [_i16.AchievementGroupScreen]
class AchievementGroupScreenRoute
    extends _i23.PageRouteInfo<AchievementGroupScreenRouteArgs> {
  AchievementGroupScreenRoute({
    _i24.Key? key,
    required String groupId,
  }) : super(
          AchievementGroupScreenRoute.name,
          path: '/achievement-group/:groupId',
          args: AchievementGroupScreenRouteArgs(
            key: key,
            groupId: groupId,
          ),
          rawPathParams: {'groupId': groupId},
        );

  static const String name = 'AchievementGroupScreenRoute';
}

class AchievementGroupScreenRouteArgs {
  const AchievementGroupScreenRouteArgs({
    this.key,
    required this.groupId,
  });

  final _i24.Key? key;

  final String groupId;

  @override
  String toString() {
    return 'AchievementGroupScreenRouteArgs{key: $key, groupId: $groupId}';
  }
}

/// generated route for
/// [_i17.TabsRootScreen]
class TabsRootScreenRoute extends _i23.PageRouteInfo<void> {
  const TabsRootScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          TabsRootScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'TabsRootScreenRoute';
}

/// generated route for
/// [_i18.EmptyRouterPage]
class EmptyRouterPageRoute extends _i23.PageRouteInfo<void> {
  const EmptyRouterPageRoute({List<_i23.PageRouteInfo>? children})
      : super(
          EmptyRouterPageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterPageRoute';
}

/// generated route for
/// [_i19.LiveScreen]
class LiveScreenRoute extends _i23.PageRouteInfo<void> {
  const LiveScreenRoute()
      : super(
          LiveScreenRoute.name,
          path: 'live',
        );

  static const String name = 'LiveScreenRoute';
}

/// generated route for
/// [_i18.EmptyRouterPage]
class SearchScreenWrapperRoute extends _i23.PageRouteInfo<void> {
  const SearchScreenWrapperRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SearchScreenWrapperRoute.name,
          path: 'search',
          initialChildren: children,
        );

  static const String name = 'SearchScreenWrapperRoute';
}

/// generated route for
/// [_i20.CalendarPage]
class CalendarPageRoute extends _i23.PageRouteInfo<void> {
  const CalendarPageRoute()
      : super(
          CalendarPageRoute.name,
          path: 'calendar',
        );

  static const String name = 'CalendarPageRoute';
}

/// generated route for
/// [_i18.EmptyRouterPage]
class HomeScreenWrapperRoute extends _i23.PageRouteInfo<void> {
  const HomeScreenWrapperRoute({List<_i23.PageRouteInfo>? children})
      : super(
          HomeScreenWrapperRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'HomeScreenWrapperRoute';
}

/// generated route for
/// [_i21.SearchScreen]
class SearchScreenRoute extends _i23.PageRouteInfo<SearchScreenRouteArgs> {
  SearchScreenRoute({
    _i24.Key? key,
    String? query,
  }) : super(
          SearchScreenRoute.name,
          path: '',
          args: SearchScreenRouteArgs(
            key: key,
            query: query,
          ),
          rawQueryParams: {'q': query},
        );

  static const String name = 'SearchScreenRoute';
}

class SearchScreenRouteArgs {
  const SearchScreenRouteArgs({
    this.key,
    this.query,
  });

  final _i24.Key? key;

  final String? query;

  @override
  String toString() {
    return 'SearchScreenRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i12.EpisodeScreen]
class EpisodeScreenRoute extends _i23.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({
    _i24.Key? key,
    required String episodeId,
    bool autoplay = false,
    int? queryParamStartPosition,
    bool hideBottomSection = false,
  }) : super(
          EpisodeScreenRoute.name,
          path: 'episode/:episodeId',
          args: EpisodeScreenRouteArgs(
            key: key,
            episodeId: episodeId,
            autoplay: autoplay,
            queryParamStartPosition: queryParamStartPosition,
            hideBottomSection: hideBottomSection,
          ),
          rawPathParams: {'episodeId': episodeId},
          rawQueryParams: {
            'autoplay': autoplay,
            't': queryParamStartPosition,
            'hide_bottom_section': hideBottomSection,
          },
        );

  static const String name = 'EpisodeScreenRoute';
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs({
    this.key,
    required this.episodeId,
    this.autoplay = false,
    this.queryParamStartPosition,
    this.hideBottomSection = false,
  });

  final _i24.Key? key;

  final String episodeId;

  final bool autoplay;

  final int? queryParamStartPosition;

  final bool hideBottomSection;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, episodeId: $episodeId, autoplay: $autoplay, queryParamStartPosition: $queryParamStartPosition, hideBottomSection: $hideBottomSection}';
  }
}

/// generated route for
/// [_i22.PageScreen]
class PageScreenRoute extends _i23.PageRouteInfo<PageScreenRouteArgs> {
  PageScreenRoute({
    _i24.Key? key,
    required String pageCode,
  }) : super(
          PageScreenRoute.name,
          path: ':pageCode',
          args: PageScreenRouteArgs(
            key: key,
            pageCode: pageCode,
          ),
          rawPathParams: {'pageCode': pageCode},
        );

  static const String name = 'PageScreenRoute';
}

class PageScreenRouteArgs {
  const PageScreenRouteArgs({
    this.key,
    required this.pageCode,
  });

  final _i24.Key? key;

  final String pageCode;

  @override
  String toString() {
    return 'PageScreenRouteArgs{key: $key, pageCode: $pageCode}';
  }
}

/// generated route for
/// [_i11.HomeScreen]
class Home extends _i23.PageRouteInfo<HomeArgs> {
  Home({_i24.Key? key})
      : super(
          Home.name,
          path: '',
          args: HomeArgs(key: key),
        );

  static const String name = 'Home';
}

class HomeArgs {
  const HomeArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'HomeArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.EmptyRouterPage]
class RedirectRoute extends _i23.PageRouteInfo<void> {
  const RedirectRoute()
      : super(
          RedirectRoute.name,
          path: 'r/:code',
        );

  static const String name = 'RedirectRoute';
}

/// generated route for
/// [_i18.EmptyRouterPage]
class TvLoginRoute extends _i23.PageRouteInfo<void> {
  const TvLoginRoute()
      : super(
          TvLoginRoute.name,
          path: 'tvlogin/*',
        );

  static const String name = 'TvLoginRoute';
}

/// generated route for
/// [_i18.EmptyRouterPage]
class LegacyEpisodeRoute extends _i23.PageRouteInfo<void> {
  const LegacyEpisodeRoute()
      : super(
          LegacyEpisodeRoute.name,
          path: 'series/:legacyEpisodeId',
        );

  static const String name = 'LegacyEpisodeRoute';
}

/// generated route for
/// [_i18.EmptyRouterPage]
class LegacyProgramRoute extends _i23.PageRouteInfo<void> {
  const LegacyProgramRoute()
      : super(
          LegacyProgramRoute.name,
          path: 'program/:legacyProgramId',
        );

  static const String name = 'LegacyProgramRoute';
}
