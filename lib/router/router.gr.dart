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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i18;

import '../helpers/custom_transitions.dart' as _i20;
import '../screens/calendar/calendar.dart' as _i12;
import '../screens/episode.dart' as _i14;
import '../screens/home.dart' as _i13;
import '../screens/live.dart' as _i11;
import '../screens/login.dart' as _i1;
import '../screens/page.dart' as _i15;
import '../screens/profile/app_language.dart' as _i3;
import '../screens/profile/audio_language.dart' as _i4;
import '../screens/profile/contact_support.dart' as _i7;
import '../screens/profile/faq.dart' as _i8;
import '../screens/profile/profile.dart' as _i2;
import '../screens/profile/subtitle_language.dart' as _i5;
import '../screens/profile/video_quality.dart' as _i6;
import '../screens/root.dart' as _i9;
import '../screens/search/explore_category_page.dart' as _i17;
import '../screens/search/search.dart' as _i16;
import 'auth_guard.dart' as _i19;

class AppRouter extends _i10.RootStackRouter {
  AppRouter({
    _i18.GlobalKey<_i18.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i19.AuthGuard authGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: _i1.LoginScreen(
          key: args.key,
          loginError: args.loginError,
          onResult: args.onResult,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: _i2.Profile(),
      );
    },
    AppLanguageScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: const _i3.AppLanguageScreen(),
      );
    },
    AppAudioLanguageRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: const _i4.AppAudioLanguage(),
      );
    },
    AppSubtitleLanguageRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: const _i5.AppSubtitleLanguage(),
      );
    },
    VideoQualityRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: const _i6.VideoQuality(),
      );
    },
    ContactSupportRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: const _i7.ContactSupport(),
      );
    },
    FAQRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: const _i8.FAQ(),
      );
    },
    RootScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: const _i9.RootScreen(),
      );
    },
    HomeScreenWrapperRoute.name: (routeData) {
      return _i10.CustomPage<void>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LiveScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: const _i11.LiveScreen(),
      );
    },
    SearchScreenWrapperRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    CalendarPageRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: const _i12.CalendarPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i10.CustomPage<void>(
        routeData: routeData,
        child: const _i13.HomeScreen(),
        maintainState: false,
        customRouteBuilder: _i20.CustomTransitionsBuilders.slideUpAndDown,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
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
              ));
      return _i10.CustomPage<void>(
        routeData: routeData,
        child: _i14.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
        ),
        customRouteBuilder: _i20.CustomTransitionsBuilders.slideUpAndDown,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PageScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PageScreenRouteArgs>(
          orElse: () =>
              PageScreenRouteArgs(pageCode: pathParams.getString('pageCode')));
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: _i15.PageScreen(
          key: args.key,
          pageCode: args.pageCode,
        ),
      );
    },
    SearchScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: const _i16.SearchScreen(),
      );
    },
    ExploreCategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ExploreCategoryScreenRouteArgs>();
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: _i17.ExploreCategoryScreen(category: args.category),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i10.RouteConfig(
          ProfileRoute.name,
          path: 'profile',
        ),
        _i10.RouteConfig(
          AppLanguageScreenRoute.name,
          path: 'app-language',
        ),
        _i10.RouteConfig(
          AppAudioLanguageRoute.name,
          path: 'audio-languga',
        ),
        _i10.RouteConfig(
          AppSubtitleLanguageRoute.name,
          path: 'subtitle-language',
        ),
        _i10.RouteConfig(
          VideoQualityRoute.name,
          path: 'video-quality',
        ),
        _i10.RouteConfig(
          ContactSupportRoute.name,
          path: 'contact-support',
        ),
        _i10.RouteConfig(
          FAQRoute.name,
          path: 'faq',
        ),
        _i10.RouteConfig(
          RootScreenRoute.name,
          path: '/',
          guards: [authGuard],
          children: [
            _i10.RouteConfig(
              HomeScreenWrapperRoute.name,
              path: '',
              parent: RootScreenRoute.name,
              children: [
                _i10.RouteConfig(
                  HomeScreenRoute.name,
                  path: '',
                  parent: HomeScreenWrapperRoute.name,
                ),
                _i10.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: HomeScreenWrapperRoute.name,
                ),
                _i10.RouteConfig(
                  PageScreenRoute.name,
                  path: 'page/:pageCode',
                  parent: HomeScreenWrapperRoute.name,
                ),
              ],
            ),
            _i10.RouteConfig(
              LiveScreenRoute.name,
              path: 'live',
              parent: RootScreenRoute.name,
              meta: <String, dynamic>{'hide_mini_player': true},
            ),
            _i10.RouteConfig(
              SearchScreenWrapperRoute.name,
              path: 'search',
              parent: RootScreenRoute.name,
              children: [
                _i10.RouteConfig(
                  SearchScreenRoute.name,
                  path: '',
                  parent: SearchScreenWrapperRoute.name,
                ),
                _i10.RouteConfig(
                  ExploreCategoryScreenRoute.name,
                  path: 'explore-category',
                  parent: SearchScreenWrapperRoute.name,
                ),
              ],
            ),
            _i10.RouteConfig(
              CalendarPageRoute.name,
              path: 'calendar',
              parent: RootScreenRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreenRoute extends _i10.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({
    _i18.Key? key,
    String? loginError,
    void Function(bool)? onResult,
  }) : super(
          LoginScreenRoute.name,
          path: '/login',
          args: LoginScreenRouteArgs(
            key: key,
            loginError: loginError,
            onResult: onResult,
          ),
        );

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({
    this.key,
    this.loginError,
    this.onResult,
  });

  final _i18.Key? key;

  final String? loginError;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key, loginError: $loginError, onResult: $onResult}';
  }
}

/// generated route for
/// [_i2.Profile]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.AppLanguageScreen]
class AppLanguageScreenRoute extends _i10.PageRouteInfo<void> {
  const AppLanguageScreenRoute()
      : super(
          AppLanguageScreenRoute.name,
          path: 'app-language',
        );

  static const String name = 'AppLanguageScreenRoute';
}

/// generated route for
/// [_i4.AppAudioLanguage]
class AppAudioLanguageRoute extends _i10.PageRouteInfo<void> {
  const AppAudioLanguageRoute()
      : super(
          AppAudioLanguageRoute.name,
          path: 'audio-languga',
        );

  static const String name = 'AppAudioLanguageRoute';
}

/// generated route for
/// [_i5.AppSubtitleLanguage]
class AppSubtitleLanguageRoute extends _i10.PageRouteInfo<void> {
  const AppSubtitleLanguageRoute()
      : super(
          AppSubtitleLanguageRoute.name,
          path: 'subtitle-language',
        );

  static const String name = 'AppSubtitleLanguageRoute';
}

/// generated route for
/// [_i6.VideoQuality]
class VideoQualityRoute extends _i10.PageRouteInfo<void> {
  const VideoQualityRoute()
      : super(
          VideoQualityRoute.name,
          path: 'video-quality',
        );

  static const String name = 'VideoQualityRoute';
}

/// generated route for
/// [_i7.ContactSupport]
class ContactSupportRoute extends _i10.PageRouteInfo<void> {
  const ContactSupportRoute()
      : super(
          ContactSupportRoute.name,
          path: 'contact-support',
        );

  static const String name = 'ContactSupportRoute';
}

/// generated route for
/// [_i8.FAQ]
class FAQRoute extends _i10.PageRouteInfo<void> {
  const FAQRoute()
      : super(
          FAQRoute.name,
          path: 'faq',
        );

  static const String name = 'FAQRoute';
}

/// generated route for
/// [_i9.RootScreen]
class RootScreenRoute extends _i10.PageRouteInfo<void> {
  const RootScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(
          RootScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootScreenRoute';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class HomeScreenWrapperRoute extends _i10.PageRouteInfo<void> {
  const HomeScreenWrapperRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeScreenWrapperRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'HomeScreenWrapperRoute';
}

/// generated route for
/// [_i11.LiveScreen]
class LiveScreenRoute extends _i10.PageRouteInfo<void> {
  const LiveScreenRoute()
      : super(
          LiveScreenRoute.name,
          path: 'live',
        );

  static const String name = 'LiveScreenRoute';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class SearchScreenWrapperRoute extends _i10.PageRouteInfo<void> {
  const SearchScreenWrapperRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SearchScreenWrapperRoute.name,
          path: 'search',
          initialChildren: children,
        );

  static const String name = 'SearchScreenWrapperRoute';
}

/// generated route for
/// [_i12.CalendarPage]
class CalendarPageRoute extends _i10.PageRouteInfo<void> {
  const CalendarPageRoute()
      : super(
          CalendarPageRoute.name,
          path: 'calendar',
        );

  static const String name = 'CalendarPageRoute';
}

/// generated route for
/// [_i13.HomeScreen]
class HomeScreenRoute extends _i10.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i14.EpisodeScreen]
class EpisodeScreenRoute extends _i10.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({
    _i18.Key? key,
    required String episodeId,
    bool autoplay = false,
  }) : super(
          EpisodeScreenRoute.name,
          path: 'episode/:episodeId',
          args: EpisodeScreenRouteArgs(
            key: key,
            episodeId: episodeId,
            autoplay: autoplay,
          ),
          rawPathParams: {'episodeId': episodeId},
          rawQueryParams: {'autoplay': autoplay},
        );

  static const String name = 'EpisodeScreenRoute';
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs({
    this.key,
    required this.episodeId,
    this.autoplay = false,
  });

  final _i18.Key? key;

  final String episodeId;

  final bool autoplay;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, episodeId: $episodeId, autoplay: $autoplay}';
  }
}

/// generated route for
/// [_i15.PageScreen]
class PageScreenRoute extends _i10.PageRouteInfo<PageScreenRouteArgs> {
  PageScreenRoute({
    _i18.Key? key,
    required String pageCode,
  }) : super(
          PageScreenRoute.name,
          path: 'page/:pageCode',
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

  final _i18.Key? key;

  final String pageCode;

  @override
  String toString() {
    return 'PageScreenRouteArgs{key: $key, pageCode: $pageCode}';
  }
}

/// generated route for
/// [_i16.SearchScreen]
class SearchScreenRoute extends _i10.PageRouteInfo<void> {
  const SearchScreenRoute()
      : super(
          SearchScreenRoute.name,
          path: '',
        );

  static const String name = 'SearchScreenRoute';
}

/// generated route for
/// [_i17.ExploreCategoryScreen]
class ExploreCategoryScreenRoute
    extends _i10.PageRouteInfo<ExploreCategoryScreenRouteArgs> {
  ExploreCategoryScreenRoute({required String category})
      : super(
          ExploreCategoryScreenRoute.name,
          path: 'explore-category',
          args: ExploreCategoryScreenRouteArgs(category: category),
        );

  static const String name = 'ExploreCategoryScreenRoute';
}

class ExploreCategoryScreenRouteArgs {
  const ExploreCategoryScreenRouteArgs({required this.category});

  final String category;

  @override
  String toString() {
    return 'ExploreCategoryScreenRouteArgs{category: $category}';
  }
}
