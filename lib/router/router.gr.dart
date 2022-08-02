// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../components/player.dart' as _i7;
import '../screens/episode.dart' as _i4;
import '../screens/home.dart' as _i3;
import '../screens/login.dart' as _i2;
import '../screens/root.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    RootScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RootScreenRouteArgs>(
          orElse: () => const RootScreenRouteArgs());
      return _i5.MaterialPageX<void>(
          routeData: routeData, child: _i1.RootScreen(key: args.key));
    },
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i5.MaterialPageX<void>(
          routeData: routeData,
          child: _i2.LoginScreen(key: args.key, loginError: args.loginError));
    },
    HomeScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<void>(
          routeData: routeData, child: const _i3.HomeScreen());
    },
    EpisodeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodeScreenRouteArgs>();
      return _i5.MaterialPageX<void>(
          routeData: routeData,
          child: _i4.EpisodeScreen(
              key: args.key,
              playerType: args.playerType,
              episodeId: args.episodeId));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(RootScreenRoute.name, path: 'root'),
        _i5.RouteConfig(LoginScreenRoute.name, path: 'login'),
        _i5.RouteConfig(HomeScreenRoute.name, path: 'home'),
        _i5.RouteConfig(EpisodeScreenRoute.name, path: 'episode')
      ];
}

/// generated route for
/// [_i1.RootScreen]
class RootScreenRoute extends _i5.PageRouteInfo<RootScreenRouteArgs> {
  RootScreenRoute({dynamic key})
      : super(RootScreenRoute.name,
            path: 'root', args: RootScreenRouteArgs(key: key));

  static const String name = 'RootScreenRoute';
}

class RootScreenRouteArgs {
  const RootScreenRouteArgs({this.key});

  final dynamic key;

  @override
  String toString() {
    return 'RootScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i5.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({dynamic key, String? loginError})
      : super(LoginScreenRoute.name,
            path: 'login',
            args: LoginScreenRouteArgs(key: key, loginError: loginError));

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key, this.loginError});

  final dynamic key;

  final String? loginError;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key, loginError: $loginError}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: 'home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i4.EpisodeScreen]
class EpisodeScreenRoute extends _i5.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute(
      {dynamic key, required _i7.PlayerType playerType, int episodeId = 1789})
      : super(EpisodeScreenRoute.name,
            path: 'episode',
            args: EpisodeScreenRouteArgs(
                key: key, playerType: playerType, episodeId: episodeId));

  static const String name = 'EpisodeScreenRoute';
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs(
      {this.key, required this.playerType, this.episodeId = 1789});

  final dynamic key;

  final _i7.PlayerType playerType;

  final int episodeId;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, playerType: $playerType, episodeId: $episodeId}';
  }
}
