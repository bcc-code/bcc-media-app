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
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:auto_route/empty_router_widgets.dart' as _i11;
import 'package:flutter/material.dart' as _i20;

import '../helpers/custom_transitions.dart' as _i23;
import '../screens/calendar/calendar.dart' as _i13;
import '../screens/episode.dart' as _i15;
import '../screens/home.dart' as _i14;
import '../screens/live.dart' as _i12;
import '../screens/login.dart' as _i1;
import '../screens/page.dart' as _i16;
import '../screens/profile/about.dart' as _i8;
import '../screens/profile/app_language.dart' as _i3;
import '../screens/profile/audio_language.dart' as _i4;
import '../screens/profile/contact_support.dart' as _i7;
import '../screens/profile/faq.dart' as _i9;
import '../screens/profile/profile.dart' as _i2;
import '../screens/profile/subtitle_language.dart' as _i5;
import '../screens/profile/video_quality.dart' as _i6;
import '../screens/search/explore_category_page.dart' as _i18;
import '../screens/search/search.dart' as _i17;
import '../screens/tabs_root.dart' as _i10;
import 'auth_guard.dart' as _i21;
import 'special_routes_guard.dart' as _i22;

class AppRouter extends _i19.RootStackRouter {
  AppRouter({
    _i20.GlobalKey<_i20.NavigatorState>? navigatorKey,
    required this.authGuard,
    required this.specialRoutesGuard,
  }) : super(navigatorKey);

  final _i21.AuthGuard authGuard;

  final _i22.SpecialRoutesGuard specialRoutesGuard;

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: _i1.LoginScreen(
          key: args.key,
          loginError: args.loginError,
          onResult: args.onResult,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: _i2.Profile(),
      );
    },
    AppLanguageScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i3.AppLanguageScreen(),
      );
    },
    AppAudioLanguageRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i4.AppAudioLanguage(),
      );
    },
    AppSubtitleLanguageRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i5.AppSubtitleLanguage(),
      );
    },
    VideoQualityRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i6.VideoQuality(),
      );
    },
    ContactSupportRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i7.ContactSupport(),
      );
    },
    AboutScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i8.AboutScreen(),
      );
    },
    FAQRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i9.FAQ(),
      );
    },
    TabsRootScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i10.TabsRootScreen(),
      );
    },
    EmptyRouterPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.EmptyRouterPage(),
      );
    },
    HomeScreenWrapperRoute.name: (routeData) {
      return _i19.CustomPage<void>(
        routeData: routeData,
        child: const _i11.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LiveScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i12.LiveScreen(),
      );
    },
    SearchScreenWrapperRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i11.EmptyRouterPage(),
      );
    },
    CalendarPageRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i13.CalendarPage(),
      );
    },
    Home.name: (routeData) {
      return _i19.CustomPage<void>(
        routeData: routeData,
        child: const _i14.HomeScreen(),
        maintainState: false,
        customRouteBuilder: _i23.CustomTransitionsBuilders.slideUpAndDown,
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
      return _i19.CustomPage<void>(
        routeData: routeData,
        child: _i15.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
        ),
        customRouteBuilder: _i23.CustomTransitionsBuilders.slideUpAndDown,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PageScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PageScreenRouteArgs>(
          orElse: () =>
              PageScreenRouteArgs(pageCode: pathParams.getString('pageCode')));
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: _i16.PageScreen(
          key: args.key,
          pageCode: args.pageCode,
        ),
      );
    },
    SearchScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<SearchScreenRouteArgs>(
          orElse: () =>
              SearchScreenRouteArgs(query: queryParams.optString('q')));
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: _i17.SearchScreen(
          key: args.key,
          query: args.query,
        ),
      );
    },
    ExploreCategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ExploreCategoryScreenRouteArgs>();
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: _i18.ExploreCategoryScreen(category: args.category),
      );
    },
    CustomActionRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i11.EmptyRouterPage(),
      );
    },
    LegacyEpisodeRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i11.EmptyRouterPage(),
      );
    },
    LegacyProgramRoute.name: (routeData) {
      return _i19.MaterialPageX<void>(
        routeData: routeData,
        child: const _i11.EmptyRouterPage(),
      );
    },
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i19.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i19.RouteConfig(
          AppLanguageScreenRoute.name,
          path: '/app-language',
        ),
        _i19.RouteConfig(
          AppAudioLanguageRoute.name,
          path: '/audio-language',
        ),
        _i19.RouteConfig(
          AppSubtitleLanguageRoute.name,
          path: '/subtitle-language',
        ),
        _i19.RouteConfig(
          VideoQualityRoute.name,
          path: '/video-quality',
        ),
        _i19.RouteConfig(
          ContactSupportRoute.name,
          path: '/contact-support',
        ),
        _i19.RouteConfig(
          AboutScreenRoute.name,
          path: '/about',
        ),
        _i19.RouteConfig(
          FAQRoute.name,
          path: '/faq',
        ),
        _i19.RouteConfig(
          TabsRootScreenRoute.name,
          path: '/',
          guards: [authGuard],
          children: [
            _i19.RouteConfig(
              HomeScreenWrapperRoute.name,
              path: '',
              parent: TabsRootScreenRoute.name,
              children: [
                _i19.RouteConfig(
                  Home.name,
                  path: '',
                  parent: HomeScreenWrapperRoute.name,
                ),
                _i19.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: HomeScreenWrapperRoute.name,
                ),
                _i19.RouteConfig(
                  PageScreenRoute.name,
                  path: 'page/:pageCode',
                  parent: HomeScreenWrapperRoute.name,
                ),
              ],
            ),
            _i19.RouteConfig(
              LiveScreenRoute.name,
              path: 'live',
              parent: TabsRootScreenRoute.name,
              meta: <String, dynamic>{'hide_mini_player': true},
            ),
            _i19.RouteConfig(
              SearchScreenWrapperRoute.name,
              path: 'search',
              parent: TabsRootScreenRoute.name,
              children: [
                _i19.RouteConfig(
                  SearchScreenRoute.name,
                  path: '',
                  parent: SearchScreenWrapperRoute.name,
                ),
                _i19.RouteConfig(
                  ExploreCategoryScreenRoute.name,
                  path: 'explore-category',
                  parent: SearchScreenWrapperRoute.name,
                ),
                _i19.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: SearchScreenWrapperRoute.name,
                ),
              ],
            ),
            _i19.RouteConfig(
              CalendarPageRoute.name,
              path: 'calendar',
              parent: TabsRootScreenRoute.name,
            ),
          ],
        ),
        _i19.RouteConfig(
          EmptyRouterPageRoute.name,
          path: '/',
          guards: [
            authGuard,
            specialRoutesGuard,
          ],
          children: [
            _i19.RouteConfig(
              CustomActionRoute.name,
              path: 'r/:code',
              parent: EmptyRouterPageRoute.name,
            ),
            _i19.RouteConfig(
              LegacyEpisodeRoute.name,
              path: 'series/:legacyEpisodeId',
              parent: EmptyRouterPageRoute.name,
            ),
            _i19.RouteConfig(
              LegacyProgramRoute.name,
              path: 'program/:legacyProgramId',
              parent: EmptyRouterPageRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreenRoute extends _i19.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({
    _i20.Key? key,
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

  final _i20.Key? key;

  final String? loginError;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key, loginError: $loginError, onResult: $onResult}';
  }
}

/// generated route for
/// [_i2.Profile]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.AppLanguageScreen]
class AppLanguageScreenRoute extends _i19.PageRouteInfo<void> {
  const AppLanguageScreenRoute()
      : super(
          AppLanguageScreenRoute.name,
          path: '/app-language',
        );

  static const String name = 'AppLanguageScreenRoute';
}

/// generated route for
/// [_i4.AppAudioLanguage]
class AppAudioLanguageRoute extends _i19.PageRouteInfo<void> {
  const AppAudioLanguageRoute()
      : super(
          AppAudioLanguageRoute.name,
          path: '/audio-language',
        );

  static const String name = 'AppAudioLanguageRoute';
}

/// generated route for
/// [_i5.AppSubtitleLanguage]
class AppSubtitleLanguageRoute extends _i19.PageRouteInfo<void> {
  const AppSubtitleLanguageRoute()
      : super(
          AppSubtitleLanguageRoute.name,
          path: '/subtitle-language',
        );

  static const String name = 'AppSubtitleLanguageRoute';
}

/// generated route for
/// [_i6.VideoQuality]
class VideoQualityRoute extends _i19.PageRouteInfo<void> {
  const VideoQualityRoute()
      : super(
          VideoQualityRoute.name,
          path: '/video-quality',
        );

  static const String name = 'VideoQualityRoute';
}

/// generated route for
/// [_i7.ContactSupport]
class ContactSupportRoute extends _i19.PageRouteInfo<void> {
  const ContactSupportRoute()
      : super(
          ContactSupportRoute.name,
          path: '/contact-support',
        );

  static const String name = 'ContactSupportRoute';
}

/// generated route for
/// [_i8.AboutScreen]
class AboutScreenRoute extends _i19.PageRouteInfo<void> {
  const AboutScreenRoute()
      : super(
          AboutScreenRoute.name,
          path: '/about',
        );

  static const String name = 'AboutScreenRoute';
}

/// generated route for
/// [_i9.FAQ]
class FAQRoute extends _i19.PageRouteInfo<void> {
  const FAQRoute()
      : super(
          FAQRoute.name,
          path: '/faq',
        );

  static const String name = 'FAQRoute';
}

/// generated route for
/// [_i10.TabsRootScreen]
class TabsRootScreenRoute extends _i19.PageRouteInfo<void> {
  const TabsRootScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          TabsRootScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'TabsRootScreenRoute';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class EmptyRouterPageRoute extends _i19.PageRouteInfo<void> {
  const EmptyRouterPageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          EmptyRouterPageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterPageRoute';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class HomeScreenWrapperRoute extends _i19.PageRouteInfo<void> {
  const HomeScreenWrapperRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomeScreenWrapperRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'HomeScreenWrapperRoute';
}

/// generated route for
/// [_i12.LiveScreen]
class LiveScreenRoute extends _i19.PageRouteInfo<void> {
  const LiveScreenRoute()
      : super(
          LiveScreenRoute.name,
          path: 'live',
        );

  static const String name = 'LiveScreenRoute';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class SearchScreenWrapperRoute extends _i19.PageRouteInfo<void> {
  const SearchScreenWrapperRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SearchScreenWrapperRoute.name,
          path: 'search',
          initialChildren: children,
        );

  static const String name = 'SearchScreenWrapperRoute';
}

/// generated route for
/// [_i13.CalendarPage]
class CalendarPageRoute extends _i19.PageRouteInfo<void> {
  const CalendarPageRoute()
      : super(
          CalendarPageRoute.name,
          path: 'calendar',
        );

  static const String name = 'CalendarPageRoute';
}

/// generated route for
/// [_i14.HomeScreen]
class Home extends _i19.PageRouteInfo<void> {
  const Home()
      : super(
          Home.name,
          path: '',
        );

  static const String name = 'Home';
}

/// generated route for
/// [_i15.EpisodeScreen]
class EpisodeScreenRoute extends _i19.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({
    _i20.Key? key,
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

  final _i20.Key? key;

  final String episodeId;

  final bool autoplay;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, episodeId: $episodeId, autoplay: $autoplay}';
  }
}

/// generated route for
/// [_i16.PageScreen]
class PageScreenRoute extends _i19.PageRouteInfo<PageScreenRouteArgs> {
  PageScreenRoute({
    _i20.Key? key,
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

  final _i20.Key? key;

  final String pageCode;

  @override
  String toString() {
    return 'PageScreenRouteArgs{key: $key, pageCode: $pageCode}';
  }
}

/// generated route for
/// [_i17.SearchScreen]
class SearchScreenRoute extends _i19.PageRouteInfo<SearchScreenRouteArgs> {
  SearchScreenRoute({
    _i20.Key? key,
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

  final _i20.Key? key;

  final String? query;

  @override
  String toString() {
    return 'SearchScreenRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i18.ExploreCategoryScreen]
class ExploreCategoryScreenRoute
    extends _i19.PageRouteInfo<ExploreCategoryScreenRouteArgs> {
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

/// generated route for
/// [_i11.EmptyRouterPage]
class CustomActionRoute extends _i19.PageRouteInfo<void> {
  const CustomActionRoute()
      : super(
          CustomActionRoute.name,
          path: 'r/:code',
        );

  static const String name = 'CustomActionRoute';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class LegacyEpisodeRoute extends _i19.PageRouteInfo<void> {
  const LegacyEpisodeRoute()
      : super(
          LegacyEpisodeRoute.name,
          path: 'series/:legacyEpisodeId',
        );

  static const String name = 'LegacyEpisodeRoute';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class LegacyProgramRoute extends _i19.PageRouteInfo<void> {
  const LegacyProgramRoute()
      : super(
          LegacyProgramRoute.name,
          path: 'program/:legacyProgramId',
        );

  static const String name = 'LegacyProgramRoute';
}
