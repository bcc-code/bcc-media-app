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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../components/player.dart' as _i8;
import '../screens/episode.dart' as _i4;
import '../screens/home.dart' as _i3;
import '../screens/login.dart' as _i1;
import '../screens/root.dart' as _i2;
import '../screens/search.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i6.MaterialPageX<void>(
          routeData: routeData,
          child: _i1.LoginScreen(key: args.key, loginError: args.loginError));
    },
    RootScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i2.RootScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i3.HomeScreen());
    },
    EpisodeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodeScreenRouteArgs>();
      return _i6.MaterialPageX<void>(
          routeData: routeData,
          child: _i4.EpisodeScreen(
              key: args.key,
              playerType: args.playerType,
              episodeId: args.episodeId));
    },
    SearchScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i5.SearchScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i6.RouteConfig(RootScreenRoute.name, path: '/', children: [
          _i6.RouteConfig(HomeScreenRoute.name,
              path: 'home', parent: RootScreenRoute.name),
          _i6.RouteConfig(EpisodeScreenRoute.name,
              path: 'episode', parent: RootScreenRoute.name),
          _i6.RouteConfig(SearchScreenRoute.name,
              path: 'search', parent: RootScreenRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreenRoute extends _i6.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({_i7.Key? key, String? loginError})
      : super(LoginScreenRoute.name,
            path: '/login',
            args: LoginScreenRouteArgs(key: key, loginError: loginError));

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key, this.loginError});

  final _i7.Key? key;

  final String? loginError;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key, loginError: $loginError}';
  }
}

/// generated route for
/// [_i2.RootScreen]
class RootScreenRoute extends _i6.PageRouteInfo<void> {
  const RootScreenRoute({List<_i6.PageRouteInfo>? children})
      : super(RootScreenRoute.name, path: '/', initialChildren: children);

  static const String name = 'RootScreenRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i6.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: 'home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i4.EpisodeScreen]
class EpisodeScreenRoute extends _i6.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute(
      {_i7.Key? key, required _i8.PlayerType playerType, int episodeId = 1789})
      : super(EpisodeScreenRoute.name,
            path: 'episode',
            args: EpisodeScreenRouteArgs(
                key: key, playerType: playerType, episodeId: episodeId));

  static const String name = 'EpisodeScreenRoute';
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs(
      {this.key, required this.playerType, this.episodeId = 1789});

  final _i7.Key? key;

  final _i8.PlayerType playerType;

  final int episodeId;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, playerType: $playerType, episodeId: $episodeId}';
  }
}

/// generated route for
/// [_i5.SearchScreen]
class SearchScreenRoute extends _i6.PageRouteInfo<void> {
  const SearchScreenRoute() : super(SearchScreenRoute.name, path: 'search');

  static const String name = 'SearchScreenRoute';
}
