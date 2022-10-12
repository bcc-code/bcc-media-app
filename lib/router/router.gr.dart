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
import '../screens/episode.dart' as _i13;
import '../screens/home/explore_category_page.dart' as _i14;
import '../screens/home/explore_sub_category_page.dart' as _i15;
import '../screens/home/home.dart' as _i12;
import '../screens/live.dart' as _i11;
import '../screens/login.dart' as _i1;
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
    HomeScreenRoute.name: (routeData) {
      return _i10.CustomPage<void>(
        routeData: routeData,
        child: const _i12.HomeScreen(),
        customRouteBuilder: _i20.CustomTransitionsBuilders.slideUpAndDown,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EpisodeScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EpisodeScreenRouteArgs>(
          orElse: () => EpisodeScreenRouteArgs(
              episodeId: pathParams.getString('episodeId')));
      return _i10.CustomPage<void>(
        routeData: routeData,
        child: _i13.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
        ),
        customRouteBuilder: _i20.CustomTransitionsBuilders.slideUpAndDown,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeExploreCategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeExploreCategoryScreenRouteArgs>();
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: _i14.HomeExploreCategoryScreen(
          key: args.key,
          category: args.category,
        ),
      );
    },
    HomeExploreSubCategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeExploreSubCategoryScreenRouteArgs>();
      return _i10.MaterialPageX<void>(
        routeData: routeData,
        child: _i15.HomeExploreSubCategoryScreen(
          key: args.key,
          category: args.category,
          parentPageName: args.parentPageName,
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
                  HomeExploreCategoryScreenRoute.name,
                  path: 'explore-category',
                  parent: HomeScreenWrapperRoute.name,
                ),
                _i10.RouteConfig(
                  HomeExploreSubCategoryScreenRoute.name,
                  path: 'explore-sub-category',
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
/// [_i12.HomeScreen]
class HomeScreenRoute extends _i10.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i13.EpisodeScreen]
class EpisodeScreenRoute extends _i10.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({
    _i18.Key? key,
    required String episodeId,
  }) : super(
          EpisodeScreenRoute.name,
          path: 'episode/:episodeId',
          args: EpisodeScreenRouteArgs(
            key: key,
            episodeId: episodeId,
          ),
          rawPathParams: {'episodeId': episodeId},
        );

  static const String name = 'EpisodeScreenRoute';
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs({
    this.key,
    required this.episodeId,
  });

  final _i18.Key? key;

  final String episodeId;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, episodeId: $episodeId}';
  }
}

/// generated route for
/// [_i14.HomeExploreCategoryScreen]
class HomeExploreCategoryScreenRoute
    extends _i10.PageRouteInfo<HomeExploreCategoryScreenRouteArgs> {
  HomeExploreCategoryScreenRoute({
    _i18.Key? key,
    required String category,
  }) : super(
          HomeExploreCategoryScreenRoute.name,
          path: 'explore-category',
          args: HomeExploreCategoryScreenRouteArgs(
            key: key,
            category: category,
          ),
        );

  static const String name = 'HomeExploreCategoryScreenRoute';
}

class HomeExploreCategoryScreenRouteArgs {
  const HomeExploreCategoryScreenRouteArgs({
    this.key,
    required this.category,
  });

  final _i18.Key? key;

  final String category;

  @override
  String toString() {
    return 'HomeExploreCategoryScreenRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i15.HomeExploreSubCategoryScreen]
class HomeExploreSubCategoryScreenRoute
    extends _i10.PageRouteInfo<HomeExploreSubCategoryScreenRouteArgs> {
  HomeExploreSubCategoryScreenRoute({
    _i18.Key? key,
    required String category,
    required String parentPageName,
  }) : super(
          HomeExploreSubCategoryScreenRoute.name,
          path: 'explore-sub-category',
          args: HomeExploreSubCategoryScreenRouteArgs(
            key: key,
            category: category,
            parentPageName: parentPageName,
          ),
        );

  static const String name = 'HomeExploreSubCategoryScreenRoute';
}

class HomeExploreSubCategoryScreenRouteArgs {
  const HomeExploreSubCategoryScreenRouteArgs({
    this.key,
    required this.category,
    required this.parentPageName,
  });

  final _i18.Key? key;

  final String category;

  final String parentPageName;

  @override
  String toString() {
    return 'HomeExploreSubCategoryScreenRouteArgs{key: $key, category: $category, parentPageName: $parentPageName}';
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
