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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../screens/app_language.dart' as _i3;
import '../screens/episode.dart' as _i4;
import '../screens/home.dart' as _i6;
import '../screens/live.dart' as _i7;
import '../screens/login.dart' as _i1;
import '../screens/profile/profile.dart' as _i2;
import '../screens/root.dart' as _i5;
import '../screens/search.dart' as _i8;
import 'auth_guard.dart' as _i11;

class AppRouter extends _i9.RootStackRouter {
  AppRouter(
      {_i10.GlobalKey<_i10.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i11.AuthGuard authGuard;

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i9.MaterialPageX<void>(
          routeData: routeData,
          child: _i1.LoginScreen(
              key: args.key,
              loginError: args.loginError,
              onResult: args.onResult));
    },
    ProfileRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: _i2.Profile());
    },
    AppLanguageScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i3.AppLanguageScreen());
    },
    EpisodeScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EpisodeScreenRouteArgs>(
          orElse: () => EpisodeScreenRouteArgs(
              episodeId: pathParams.getInt('episodeId', 1789)));
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: _i4.EpisodeScreen(key: args.key, episodeId: args.episodeId),
          transitionsBuilder: _i9.TransitionsBuilders.slideBottom,
          opaque: true,
          barrierDismissible: false);
    },
    RootScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i5.RootScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i6.HomeScreen());
    },
    LiveScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i7.LiveScreen());
    },
    SearchScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i8.SearchScreen());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i9.RouteConfig(ProfileRoute.name, path: 'profile'),
        _i9.RouteConfig(AppLanguageScreenRoute.name, path: 'app-language'),
        _i9.RouteConfig(EpisodeScreenRoute.name, path: 'episode/:episodeId'),
        _i9.RouteConfig(RootScreenRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          _i9.RouteConfig(HomeScreenRoute.name,
              path: 'home', parent: RootScreenRoute.name),
          _i9.RouteConfig(LiveScreenRoute.name,
              path: 'live', parent: RootScreenRoute.name),
          _i9.RouteConfig(SearchScreenRoute.name,
              path: 'search', parent: RootScreenRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreenRoute extends _i9.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute(
      {_i10.Key? key, String? loginError, void Function(bool)? onResult})
      : super(LoginScreenRoute.name,
            path: '/login',
            args: LoginScreenRouteArgs(
                key: key, loginError: loginError, onResult: onResult));

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key, this.loginError, this.onResult});

  final _i10.Key? key;

  final String? loginError;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key, loginError: $loginError, onResult: $onResult}';
  }
}

/// generated route for
/// [_i2.Profile]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.AppLanguageScreen]
class AppLanguageScreenRoute extends _i9.PageRouteInfo<void> {
  const AppLanguageScreenRoute()
      : super(AppLanguageScreenRoute.name, path: 'app-language');

  static const String name = 'AppLanguageScreenRoute';
}

/// generated route for
/// [_i4.EpisodeScreen]
class EpisodeScreenRoute extends _i9.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({_i10.Key? key, int episodeId = 1789})
      : super(EpisodeScreenRoute.name,
            path: 'episode/:episodeId',
            args: EpisodeScreenRouteArgs(key: key, episodeId: episodeId),
            rawPathParams: {'episodeId': episodeId});

  static const String name = 'EpisodeScreenRoute';
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs({this.key, this.episodeId = 1789});

  final _i10.Key? key;

  final int episodeId;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, episodeId: $episodeId}';
  }
}

/// generated route for
/// [_i5.RootScreen]
class RootScreenRoute extends _i9.PageRouteInfo<void> {
  const RootScreenRoute({List<_i9.PageRouteInfo>? children})
      : super(RootScreenRoute.name, path: '/', initialChildren: children);

  static const String name = 'RootScreenRoute';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreenRoute extends _i9.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: 'home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i7.LiveScreen]
class LiveScreenRoute extends _i9.PageRouteInfo<void> {
  const LiveScreenRoute() : super(LiveScreenRoute.name, path: 'live');

  static const String name = 'LiveScreenRoute';
}

/// generated route for
/// [_i8.SearchScreen]
class SearchScreenRoute extends _i9.PageRouteInfo<void> {
  const SearchScreenRoute() : super(SearchScreenRoute.name, path: 'search');

  static const String name = 'SearchScreenRoute';
}
