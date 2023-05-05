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
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:auto_route/empty_router_widgets.dart' as _i20;
import 'package:flutter/foundation.dart' as _i29;
import 'package:flutter/material.dart' as _i26;

import '../helpers/navigation/custom_transitions.dart' as _i28;
import '../screens/achievement_group.dart' as _i17;
import '../screens/achievements.dart' as _i16;
import '../screens/auto_login.dart' as _i1;
import '../screens/calendar/calendar.dart' as _i21;
import '../screens/episode.dart' as _i14;
import '../screens/home.dart' as _i13;
import '../screens/live.dart' as _i19;
import '../screens/my_list.dart' as _i24;
import '../screens/onboarding/onboarding.dart' as _i2;
import '../screens/onboarding/signup.dart' as _i3;
import '../screens/page.dart' as _i23;
import '../screens/profile/about.dart' as _i10;
import '../screens/profile/account_deletion.dart' as _i12;
import '../screens/profile/app_language.dart' as _i5;
import '../screens/profile/audio_language.dart' as _i6;
import '../screens/profile/contact_support.dart' as _i9;
import '../screens/profile/faq.dart' as _i11;
import '../screens/profile/profile.dart' as _i4;
import '../screens/profile/subtitle_language.dart' as _i7;
import '../screens/profile/video_quality.dart' as _i8;
import '../screens/search/search.dart' as _i22;
import '../screens/study.dart' as _i15;
import '../screens/tabs_root.dart' as _i18;
import 'router.dart' as _i27;

class AppRouter extends _i25.RootStackRouter {
  AppRouter([_i26.GlobalKey<_i26.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    AutoLoginScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<void>(
        routeData: routeData,
        child: const _i1.AutoLoginScreen(),
      );
    },
    OnboardingScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<OnboardingScreenRouteArgs>(
          orElse: () => OnboardingScreenRouteArgs(
                  auto: queryParams.getBool(
                'auto',
                false,
              )));
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: _i2.OnboardingScreen(
          key: args.key,
          loginError: args.loginError,
          onResult: args.onResult,
          auto: args.auto,
        ),
        customRouteBuilder: _i27.profileRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignupScreenRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i3.SignupScreen(),
        customRouteBuilder: _i27.modalSheetBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i4.Profile(),
        customRouteBuilder: _i27.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: false,
        barrierDismissible: false,
      );
    },
    AppLanguageScreenRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i5.AppLanguageScreen(),
        customRouteBuilder: _i27.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AppAudioLanguageRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i6.AppAudioLanguage(),
        customRouteBuilder: _i27.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AppSubtitleLanguageRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i7.AppSubtitleLanguage(),
        customRouteBuilder: _i27.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VideoQualityRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i8.VideoQuality(),
        customRouteBuilder: _i27.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactSupportRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i9.ContactSupport(),
        customRouteBuilder: _i27.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AboutScreenRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i10.AboutScreen(),
        customRouteBuilder: _i27.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FAQRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i11.FAQ(),
        customRouteBuilder: _i27.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AccountDeletionScreenRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i12.AccountDeletionScreen(),
        customRouteBuilder: _i27.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PublicHomeRoute.name: (routeData) {
      final args = routeData.argsAs<PublicHomeRouteArgs>(
          orElse: () => const PublicHomeRouteArgs());
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: _i13.HomeScreen(key: args.key),
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
                autoplay: queryParams.optBool('autoplay'),
                queryParamStartPosition: queryParams.optInt('t'),
                hideBottomSection: queryParams.optBool('hide_bottom_section'),
                collectionId: queryParams.optString('collectionId'),
              ));
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: _i14.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
          collectionId: args.collectionId,
        ),
        transitionsBuilder: _i28.CustomTransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    StudyScreenRoute.name: (routeData) {
      final args = routeData.argsAs<StudyScreenRouteArgs>();
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: _i15.StudyScreen(
          key: args.key,
          episodeId: args.episodeId,
          lessonId: args.lessonId,
        ),
        transitionsBuilder: _i28.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AchievementsScreenRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i16.AchievementsScreen(),
        transitionsBuilder: _i28.CustomTransitionsBuilders.slideUp,
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
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: _i17.AchievementGroupScreen(
          key: args.key,
          groupId: args.groupId,
        ),
        transitionsBuilder: _i28.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TabsRootScreenRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i18.TabsRootScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LiveScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<void>(
        routeData: routeData,
        child: const _i19.LiveScreen(),
      );
    },
    SearchScreenWrapperRoute.name: (routeData) {
      return _i25.MaterialPageX<void>(
        routeData: routeData,
        child: const _i20.EmptyRouterPage(),
      );
    },
    CalendarPageRoute.name: (routeData) {
      return _i25.MaterialPageX<void>(
        routeData: routeData,
        child: const _i21.CalendarPage(),
      );
    },
    MyListScreenWrapperRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i20.EmptyRouterPage(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeScreenWrapperRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i20.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SearchScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<SearchScreenRouteArgs>(
          orElse: () =>
              SearchScreenRouteArgs(query: queryParams.optString('q')));
      return _i25.MaterialPageX<void>(
        routeData: routeData,
        child: _i22.SearchScreen(
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
                autoplay: queryParams.optBool('autoplay'),
                queryParamStartPosition: queryParams.optInt('t'),
                hideBottomSection: queryParams.optBool('hide_bottom_section'),
                collectionId: queryParams.optString('collectionId'),
              ));
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: _i14.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
          collectionId: args.collectionId,
        ),
        transitionsBuilder: _i28.CustomTransitionsBuilders.slideLeft,
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
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: _i23.PageScreen(
          key: args.key,
          pageCode: args.pageCode,
        ),
        transitionsBuilder: _i28.CustomTransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MyListScreenRoute.name: (routeData) {
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: const _i24.MyListScreen(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    Home.name: (routeData) {
      final args = routeData.argsAs<HomeArgs>(orElse: () => const HomeArgs());
      return _i25.CustomPage<void>(
        routeData: routeData,
        child: _i13.HomeScreen(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i25.RouteConfig> get routes => [
        _i25.RouteConfig(
          AutoLoginScreenRoute.name,
          path: '/auto-login',
        ),
        _i25.RouteConfig(
          OnboardingScreenRoute.name,
          path: '/login',
          meta: <String, dynamic>{'analytics_name': 'login'},
        ),
        _i25.RouteConfig(
          SignupScreenRoute.name,
          path: 'signup',
          meta: <String, dynamic>{'analytics_name': 'signup'},
        ),
        _i25.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
          meta: <String, dynamic>{'analytics_name': 'profile'},
        ),
        _i25.RouteConfig(
          AppLanguageScreenRoute.name,
          path: '/app-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'appLanguage',
          },
        ),
        _i25.RouteConfig(
          AppAudioLanguageRoute.name,
          path: '/audio-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'audioLanguage',
          },
        ),
        _i25.RouteConfig(
          AppSubtitleLanguageRoute.name,
          path: '/subtitle-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'subtitlesLanguage',
          },
        ),
        _i25.RouteConfig(
          VideoQualityRoute.name,
          path: '/video-quality',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'videoQuality',
          },
        ),
        _i25.RouteConfig(
          ContactSupportRoute.name,
          path: '/contact-support',
          meta: <String, dynamic>{'analytics_name': 'support'},
        ),
        _i25.RouteConfig(
          AboutScreenRoute.name,
          path: '/about',
          meta: <String, dynamic>{'analytics_name': 'about'},
        ),
        _i25.RouteConfig(
          FAQRoute.name,
          path: '/faq',
          meta: <String, dynamic>{'analytics_name': 'faq'},
        ),
        _i25.RouteConfig(
          AccountDeletionScreenRoute.name,
          path: '/account-deletion',
          meta: <String, dynamic>{'analytics_name': 'account-deletion'},
        ),
        _i25.RouteConfig(
          PublicHomeRoute.name,
          path: '/public-home',
        ),
        _i25.RouteConfig(
          EmbedScreen.name,
          path: '/embed/:episodeId',
          meta: <String, dynamic>{'analytics_name': 'episode'},
        ),
        _i25.RouteConfig(
          StudyScreenRoute.name,
          path: 'study-lesson',
          meta: <String, dynamic>{'analytics_name': 'study-lesson'},
        ),
        _i25.RouteConfig(
          AchievementsScreenRoute.name,
          path: '/achievements',
          meta: <String, dynamic>{'analytics_name': 'achievements'},
        ),
        _i25.RouteConfig(
          AchievementGroupScreenRoute.name,
          path: '/achievement-group/:groupId',
          meta: <String, dynamic>{'analytics_name': 'achievement-group'},
        ),
        _i25.RouteConfig(
          TabsRootScreenRoute.name,
          path: '/',
          children: [
            _i25.RouteConfig(
              LiveScreenRoute.name,
              path: 'live',
              parent: TabsRootScreenRoute.name,
              meta: <String, dynamic>{
                'hide_mini_player': true,
                'nav_tab_route': true,
                'analytics_name': 'livestream',
              },
            ),
            _i25.RouteConfig(
              SearchScreenWrapperRoute.name,
              path: 'search',
              parent: TabsRootScreenRoute.name,
              children: [
                _i25.RouteConfig(
                  SearchScreenRoute.name,
                  path: '',
                  parent: SearchScreenWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i25.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: SearchScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i25.RouteConfig(
                  PageScreenRoute.name,
                  path: ':pageCode',
                  parent: SearchScreenWrapperRoute.name,
                  usesPathAsKey: true,
                ),
              ],
            ),
            _i25.RouteConfig(
              CalendarPageRoute.name,
              path: 'calendar',
              parent: TabsRootScreenRoute.name,
              meta: <String, dynamic>{
                'nav_tab_route': true,
                'analytics_name': 'calendar',
              },
            ),
            _i25.RouteConfig(
              MyListScreenWrapperRoute.name,
              path: 'my-list',
              parent: TabsRootScreenRoute.name,
              children: [
                _i25.RouteConfig(
                  MyListScreenRoute.name,
                  path: '',
                  parent: MyListScreenWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i25.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: MyListScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
              ],
            ),
            _i25.RouteConfig(
              HomeScreenWrapperRoute.name,
              path: '',
              parent: TabsRootScreenRoute.name,
              children: [
                _i25.RouteConfig(
                  Home.name,
                  path: '',
                  parent: HomeScreenWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i25.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: HomeScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i25.RouteConfig(
                  PageScreenRoute.name,
                  path: ':pageCode',
                  parent: HomeScreenWrapperRoute.name,
                  usesPathAsKey: true,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.AutoLoginScreen]
class AutoLoginScreenRoute extends _i25.PageRouteInfo<void> {
  const AutoLoginScreenRoute()
      : super(
          AutoLoginScreenRoute.name,
          path: '/auto-login',
        );

  static const String name = 'AutoLoginScreenRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingScreenRoute
    extends _i25.PageRouteInfo<OnboardingScreenRouteArgs> {
  OnboardingScreenRoute({
    _i29.Key? key,
    String? loginError,
    void Function(bool)? onResult,
    bool auto = false,
  }) : super(
          OnboardingScreenRoute.name,
          path: '/login',
          args: OnboardingScreenRouteArgs(
            key: key,
            loginError: loginError,
            onResult: onResult,
            auto: auto,
          ),
          rawQueryParams: {'auto': auto},
        );

  static const String name = 'OnboardingScreenRoute';
}

class OnboardingScreenRouteArgs {
  const OnboardingScreenRouteArgs({
    this.key,
    this.loginError,
    this.onResult,
    this.auto = false,
  });

  final _i29.Key? key;

  final String? loginError;

  final void Function(bool)? onResult;

  final bool auto;

  @override
  String toString() {
    return 'OnboardingScreenRouteArgs{key: $key, loginError: $loginError, onResult: $onResult, auto: $auto}';
  }
}

/// generated route for
/// [_i3.SignupScreen]
class SignupScreenRoute extends _i25.PageRouteInfo<void> {
  const SignupScreenRoute()
      : super(
          SignupScreenRoute.name,
          path: 'signup',
        );

  static const String name = 'SignupScreenRoute';
}

/// generated route for
/// [_i4.Profile]
class ProfileRoute extends _i25.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.AppLanguageScreen]
class AppLanguageScreenRoute extends _i25.PageRouteInfo<void> {
  const AppLanguageScreenRoute()
      : super(
          AppLanguageScreenRoute.name,
          path: '/app-language',
        );

  static const String name = 'AppLanguageScreenRoute';
}

/// generated route for
/// [_i6.AppAudioLanguage]
class AppAudioLanguageRoute extends _i25.PageRouteInfo<void> {
  const AppAudioLanguageRoute()
      : super(
          AppAudioLanguageRoute.name,
          path: '/audio-language',
        );

  static const String name = 'AppAudioLanguageRoute';
}

/// generated route for
/// [_i7.AppSubtitleLanguage]
class AppSubtitleLanguageRoute extends _i25.PageRouteInfo<void> {
  const AppSubtitleLanguageRoute()
      : super(
          AppSubtitleLanguageRoute.name,
          path: '/subtitle-language',
        );

  static const String name = 'AppSubtitleLanguageRoute';
}

/// generated route for
/// [_i8.VideoQuality]
class VideoQualityRoute extends _i25.PageRouteInfo<void> {
  const VideoQualityRoute()
      : super(
          VideoQualityRoute.name,
          path: '/video-quality',
        );

  static const String name = 'VideoQualityRoute';
}

/// generated route for
/// [_i9.ContactSupport]
class ContactSupportRoute extends _i25.PageRouteInfo<void> {
  const ContactSupportRoute()
      : super(
          ContactSupportRoute.name,
          path: '/contact-support',
        );

  static const String name = 'ContactSupportRoute';
}

/// generated route for
/// [_i10.AboutScreen]
class AboutScreenRoute extends _i25.PageRouteInfo<void> {
  const AboutScreenRoute()
      : super(
          AboutScreenRoute.name,
          path: '/about',
        );

  static const String name = 'AboutScreenRoute';
}

/// generated route for
/// [_i11.FAQ]
class FAQRoute extends _i25.PageRouteInfo<void> {
  const FAQRoute()
      : super(
          FAQRoute.name,
          path: '/faq',
        );

  static const String name = 'FAQRoute';
}

/// generated route for
/// [_i12.AccountDeletionScreen]
class AccountDeletionScreenRoute extends _i25.PageRouteInfo<void> {
  const AccountDeletionScreenRoute()
      : super(
          AccountDeletionScreenRoute.name,
          path: '/account-deletion',
        );

  static const String name = 'AccountDeletionScreenRoute';
}

/// generated route for
/// [_i13.HomeScreen]
class PublicHomeRoute extends _i25.PageRouteInfo<PublicHomeRouteArgs> {
  PublicHomeRoute({_i29.Key? key})
      : super(
          PublicHomeRoute.name,
          path: '/public-home',
          args: PublicHomeRouteArgs(key: key),
        );

  static const String name = 'PublicHomeRoute';
}

class PublicHomeRouteArgs {
  const PublicHomeRouteArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'PublicHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.EpisodeScreen]
class EmbedScreen extends _i25.PageRouteInfo<EmbedScreenArgs> {
  EmbedScreen({
    _i29.Key? key,
    required String episodeId,
    bool? autoplay,
    int? queryParamStartPosition,
    bool? hideBottomSection,
    String? collectionId,
  }) : super(
          EmbedScreen.name,
          path: '/embed/:episodeId',
          args: EmbedScreenArgs(
            key: key,
            episodeId: episodeId,
            autoplay: autoplay,
            queryParamStartPosition: queryParamStartPosition,
            hideBottomSection: hideBottomSection,
            collectionId: collectionId,
          ),
          rawPathParams: {'episodeId': episodeId},
          rawQueryParams: {
            'autoplay': autoplay,
            't': queryParamStartPosition,
            'hide_bottom_section': hideBottomSection,
            'collectionId': collectionId,
          },
        );

  static const String name = 'EmbedScreen';
}

class EmbedScreenArgs {
  const EmbedScreenArgs({
    this.key,
    required this.episodeId,
    this.autoplay,
    this.queryParamStartPosition,
    this.hideBottomSection,
    this.collectionId,
  });

  final _i29.Key? key;

  final String episodeId;

  final bool? autoplay;

  final int? queryParamStartPosition;

  final bool? hideBottomSection;

  final String? collectionId;

  @override
  String toString() {
    return 'EmbedScreenArgs{key: $key, episodeId: $episodeId, autoplay: $autoplay, queryParamStartPosition: $queryParamStartPosition, hideBottomSection: $hideBottomSection, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i15.StudyScreen]
class StudyScreenRoute extends _i25.PageRouteInfo<StudyScreenRouteArgs> {
  StudyScreenRoute({
    _i29.Key? key,
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

  final _i29.Key? key;

  final String episodeId;

  final String lessonId;

  @override
  String toString() {
    return 'StudyScreenRouteArgs{key: $key, episodeId: $episodeId, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i16.AchievementsScreen]
class AchievementsScreenRoute extends _i25.PageRouteInfo<void> {
  const AchievementsScreenRoute()
      : super(
          AchievementsScreenRoute.name,
          path: '/achievements',
        );

  static const String name = 'AchievementsScreenRoute';
}

/// generated route for
/// [_i17.AchievementGroupScreen]
class AchievementGroupScreenRoute
    extends _i25.PageRouteInfo<AchievementGroupScreenRouteArgs> {
  AchievementGroupScreenRoute({
    _i29.Key? key,
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

  final _i29.Key? key;

  final String groupId;

  @override
  String toString() {
    return 'AchievementGroupScreenRouteArgs{key: $key, groupId: $groupId}';
  }
}

/// generated route for
/// [_i18.TabsRootScreen]
class TabsRootScreenRoute extends _i25.PageRouteInfo<void> {
  const TabsRootScreenRoute({List<_i25.PageRouteInfo>? children})
      : super(
          TabsRootScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'TabsRootScreenRoute';
}

/// generated route for
/// [_i19.LiveScreen]
class LiveScreenRoute extends _i25.PageRouteInfo<void> {
  const LiveScreenRoute()
      : super(
          LiveScreenRoute.name,
          path: 'live',
        );

  static const String name = 'LiveScreenRoute';
}

/// generated route for
/// [_i20.EmptyRouterPage]
class SearchScreenWrapperRoute extends _i25.PageRouteInfo<void> {
  const SearchScreenWrapperRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SearchScreenWrapperRoute.name,
          path: 'search',
          initialChildren: children,
        );

  static const String name = 'SearchScreenWrapperRoute';
}

/// generated route for
/// [_i21.CalendarPage]
class CalendarPageRoute extends _i25.PageRouteInfo<void> {
  const CalendarPageRoute()
      : super(
          CalendarPageRoute.name,
          path: 'calendar',
        );

  static const String name = 'CalendarPageRoute';
}

/// generated route for
/// [_i20.EmptyRouterPage]
class MyListScreenWrapperRoute extends _i25.PageRouteInfo<void> {
  const MyListScreenWrapperRoute({List<_i25.PageRouteInfo>? children})
      : super(
          MyListScreenWrapperRoute.name,
          path: 'my-list',
          initialChildren: children,
        );

  static const String name = 'MyListScreenWrapperRoute';
}

/// generated route for
/// [_i20.EmptyRouterPage]
class HomeScreenWrapperRoute extends _i25.PageRouteInfo<void> {
  const HomeScreenWrapperRoute({List<_i25.PageRouteInfo>? children})
      : super(
          HomeScreenWrapperRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'HomeScreenWrapperRoute';
}

/// generated route for
/// [_i22.SearchScreen]
class SearchScreenRoute extends _i25.PageRouteInfo<SearchScreenRouteArgs> {
  SearchScreenRoute({
    _i29.Key? key,
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

  final _i29.Key? key;

  final String? query;

  @override
  String toString() {
    return 'SearchScreenRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i14.EpisodeScreen]
class EpisodeScreenRoute extends _i25.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({
    _i29.Key? key,
    required String episodeId,
    bool? autoplay,
    int? queryParamStartPosition,
    bool? hideBottomSection,
    String? collectionId,
  }) : super(
          EpisodeScreenRoute.name,
          path: 'episode/:episodeId',
          args: EpisodeScreenRouteArgs(
            key: key,
            episodeId: episodeId,
            autoplay: autoplay,
            queryParamStartPosition: queryParamStartPosition,
            hideBottomSection: hideBottomSection,
            collectionId: collectionId,
          ),
          rawPathParams: {'episodeId': episodeId},
          rawQueryParams: {
            'autoplay': autoplay,
            't': queryParamStartPosition,
            'hide_bottom_section': hideBottomSection,
            'collectionId': collectionId,
          },
        );

  static const String name = 'EpisodeScreenRoute';
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs({
    this.key,
    required this.episodeId,
    this.autoplay,
    this.queryParamStartPosition,
    this.hideBottomSection,
    this.collectionId,
  });

  final _i29.Key? key;

  final String episodeId;

  final bool? autoplay;

  final int? queryParamStartPosition;

  final bool? hideBottomSection;

  final String? collectionId;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, episodeId: $episodeId, autoplay: $autoplay, queryParamStartPosition: $queryParamStartPosition, hideBottomSection: $hideBottomSection, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i23.PageScreen]
class PageScreenRoute extends _i25.PageRouteInfo<PageScreenRouteArgs> {
  PageScreenRoute({
    _i29.Key? key,
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

  final _i29.Key? key;

  final String pageCode;

  @override
  String toString() {
    return 'PageScreenRouteArgs{key: $key, pageCode: $pageCode}';
  }
}

/// generated route for
/// [_i24.MyListScreen]
class MyListScreenRoute extends _i25.PageRouteInfo<void> {
  const MyListScreenRoute()
      : super(
          MyListScreenRoute.name,
          path: '',
        );

  static const String name = 'MyListScreenRoute';
}

/// generated route for
/// [_i13.HomeScreen]
class Home extends _i25.PageRouteInfo<HomeArgs> {
  Home({_i29.Key? key})
      : super(
          Home.name,
          path: '',
          args: HomeArgs(key: key),
        );

  static const String name = 'Home';
}

class HomeArgs {
  const HomeArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'HomeArgs{key: $key}';
  }
}
