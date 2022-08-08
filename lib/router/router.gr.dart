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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../screens/episode.dart' as _i2;
import '../screens/home.dart' as _i4;
import '../screens/live.dart' as _i5;
import '../screens/login.dart' as _i1;
import '../screens/root.dart' as _i3;
import '../screens/search.dart' as _i6;
import 'auth_guard.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter(
      {_i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i7.MaterialPageX<void>(
          routeData: routeData,
          child: _i1.LoginScreen(
              key: args.key,
              loginError: args.loginError,
              onResult: args.onResult));
    },
    EpisodeScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EpisodeScreenRouteArgs>(
          orElse: () => EpisodeScreenRouteArgs(
              episodeId: pathParams.getInt('episodeId', 1789)));
      return _i7.MaterialPageX<void>(
          routeData: routeData,
          child: _i2.EpisodeScreen(key: args.key, episodeId: args.episodeId));
    },
    RootScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<void>(
          routeData: routeData, child: const _i3.RootScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<void>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    LiveScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<void>(
          routeData: routeData, child: const _i5.LiveScreen());
    },
    SearchScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<void>(
          routeData: routeData, child: const _i6.SearchScreen());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i7.RouteConfig(EpisodeScreenRoute.name, path: 'episode/:episodeId'),
        _i7.RouteConfig(RootScreenRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          _i7.RouteConfig(HomeScreenRoute.name,
              path: 'home', parent: RootScreenRoute.name),
          _i7.RouteConfig(LiveScreenRoute.name,
              path: 'live', parent: RootScreenRoute.name),
          _i7.RouteConfig(SearchScreenRoute.name,
              path: 'search', parent: RootScreenRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreenRoute extends _i7.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute(
      {_i8.Key? key, String? loginError, void Function(bool)? onResult})
      : super(LoginScreenRoute.name,
            path: '/login',
            args: LoginScreenRouteArgs(
                key: key, loginError: loginError, onResult: onResult));

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key, this.loginError, this.onResult});

  final _i8.Key? key;

  final String? loginError;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key, loginError: $loginError, onResult: $onResult}';
  }
}

/// generated route for
/// [_i2.EpisodeScreen]
class EpisodeScreenRoute extends _i7.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({_i8.Key? key, int episodeId = 1789})
      : super(EpisodeScreenRoute.name,
            path: 'episode/:episodeId',
            args: EpisodeScreenRouteArgs(key: key, episodeId: episodeId),
            rawPathParams: {'episodeId': episodeId});

  static const String name = 'EpisodeScreenRoute';
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs({this.key, this.episodeId = 1789});

  final _i8.Key? key;

  final int episodeId;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, episodeId: $episodeId}';
  }
}

/// generated route for
/// [_i3.RootScreen]
class RootScreenRoute extends _i7.PageRouteInfo<void> {
  const RootScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(RootScreenRoute.name, path: '/', initialChildren: children);

  static const String name = 'RootScreenRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: 'home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i5.LiveScreen]
class LiveScreenRoute extends _i7.PageRouteInfo<void> {
  const LiveScreenRoute() : super(LiveScreenRoute.name, path: 'live');

  static const String name = 'LiveScreenRoute';
}

/// generated route for
/// [_i6.SearchScreen]
class SearchScreenRoute extends _i7.PageRouteInfo<void> {
  const SearchScreenRoute() : super(SearchScreenRoute.name, path: 'search');

  static const String name = 'SearchScreenRoute';
}
