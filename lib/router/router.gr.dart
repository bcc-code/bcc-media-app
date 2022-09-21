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
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../screens/episode.dart' as _i9;
import '../screens/home.dart' as _i11;
import '../screens/live.dart' as _i12;
import '../screens/login.dart' as _i1;
import '../screens/profile/app_language.dart' as _i3;
import '../screens/profile/audio_language.dart' as _i4;
import '../screens/profile/contact_support.dart' as _i7;
import '../screens/profile/faq.dart' as _i8;
import '../screens/profile/profile.dart' as _i2;
import '../screens/profile/subtitle_language.dart' as _i5;
import '../screens/profile/video_quality.dart' as _i6;
import '../screens/root.dart' as _i10;
import '../screens/search.dart' as _i13;
import 'auth_guard.dart' as _i16;

class AppRouter extends _i14.RootStackRouter {
  AppRouter(
      {_i15.GlobalKey<_i15.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i16.AuthGuard authGuard;

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i14.MaterialPageX<void>(
          routeData: routeData,
          child: _i1.LoginScreen(
              key: args.key,
              loginError: args.loginError,
              onResult: args.onResult));
    },
    ProfileRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
          routeData: routeData, child: _i2.Profile());
    },
    AppLanguageScreenRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
          routeData: routeData, child: const _i3.AppLanguageScreen());
    },
    AppAudioLanguageRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
          routeData: routeData, child: const _i4.AppAudioLanguage());
    },
    AppSubtitleLanguageRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
          routeData: routeData, child: const _i5.AppSubtitleLanguage());
    },
    VideoQualityRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
          routeData: routeData, child: const _i6.VideoQuality());
    },
    ContactSupportRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
          routeData: routeData, child: const _i7.ContactSupport());
    },
    FAQRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
          routeData: routeData, child: const _i8.FAQ());
    },
    EpisodeScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EpisodeScreenRouteArgs>(
          orElse: () => EpisodeScreenRouteArgs(
              episodeId: pathParams.getString('episodeId')));
      return _i14.CustomPage<void>(
          routeData: routeData,
          child: _i9.EpisodeScreen(key: args.key, episodeId: args.episodeId),
          transitionsBuilder: _i14.TransitionsBuilders.slideBottom,
          opaque: true,
          barrierDismissible: false);
    },
    RootScreenRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
          routeData: routeData, child: const _i10.RootScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
          routeData: routeData, child: const _i11.HomeScreen());
    },
    LiveScreenRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
          routeData: routeData,
          child: const _i12.LiveScreen(),
          maintainState: false);
    },
    SearchScreenRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
          routeData: routeData, child: const _i13.SearchScreen());
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i14.RouteConfig(ProfileRoute.name, path: 'profile'),
        _i14.RouteConfig(AppLanguageScreenRoute.name, path: 'app-language'),
        _i14.RouteConfig(AppAudioLanguageRoute.name, path: 'audio-languga'),
        _i14.RouteConfig(AppSubtitleLanguageRoute.name,
            path: 'subtitle-language'),
        _i14.RouteConfig(VideoQualityRoute.name, path: 'video-quality'),
        _i14.RouteConfig(ContactSupportRoute.name, path: 'contact-support'),
        _i14.RouteConfig(FAQRoute.name, path: 'faq'),
        _i14.RouteConfig(EpisodeScreenRoute.name, path: 'episode/:episodeId'),
        _i14.RouteConfig(RootScreenRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          _i14.RouteConfig(HomeScreenRoute.name,
              path: 'home', parent: RootScreenRoute.name),
          _i14.RouteConfig(LiveScreenRoute.name,
              path: 'live',
              parent: RootScreenRoute.name,
              meta: <String, dynamic>{'hide_mini_player': true}),
          _i14.RouteConfig(SearchScreenRoute.name,
              path: 'search', parent: RootScreenRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreenRoute extends _i14.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute(
      {_i15.Key? key, String? loginError, void Function(bool)? onResult})
      : super(LoginScreenRoute.name,
            path: '/login',
            args: LoginScreenRouteArgs(
                key: key, loginError: loginError, onResult: onResult));

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key, this.loginError, this.onResult});

  final _i15.Key? key;

  final String? loginError;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key, loginError: $loginError, onResult: $onResult}';
  }
}

/// generated route for
/// [_i2.Profile]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.AppLanguageScreen]
class AppLanguageScreenRoute extends _i14.PageRouteInfo<void> {
  const AppLanguageScreenRoute()
      : super(AppLanguageScreenRoute.name, path: 'app-language');

  static const String name = 'AppLanguageScreenRoute';
}

/// generated route for
/// [_i4.AppAudioLanguage]
class AppAudioLanguageRoute extends _i14.PageRouteInfo<void> {
  const AppAudioLanguageRoute()
      : super(AppAudioLanguageRoute.name, path: 'audio-languga');

  static const String name = 'AppAudioLanguageRoute';
}

/// generated route for
/// [_i5.AppSubtitleLanguage]
class AppSubtitleLanguageRoute extends _i14.PageRouteInfo<void> {
  const AppSubtitleLanguageRoute()
      : super(AppSubtitleLanguageRoute.name, path: 'subtitle-language');

  static const String name = 'AppSubtitleLanguageRoute';
}

/// generated route for
/// [_i6.VideoQuality]
class VideoQualityRoute extends _i14.PageRouteInfo<void> {
  const VideoQualityRoute()
      : super(VideoQualityRoute.name, path: 'video-quality');

  static const String name = 'VideoQualityRoute';
}

/// generated route for
/// [_i7.ContactSupport]
class ContactSupportRoute extends _i14.PageRouteInfo<void> {
  const ContactSupportRoute()
      : super(ContactSupportRoute.name, path: 'contact-support');

  static const String name = 'ContactSupportRoute';
}

/// generated route for
/// [_i8.FAQ]
class FAQRoute extends _i14.PageRouteInfo<void> {
  const FAQRoute() : super(FAQRoute.name, path: 'faq');

  static const String name = 'FAQRoute';
}

/// generated route for
/// [_i9.EpisodeScreen]
class EpisodeScreenRoute extends _i14.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({_i15.Key? key, required String episodeId})
      : super(EpisodeScreenRoute.name,
            path: 'episode/:episodeId',
            args: EpisodeScreenRouteArgs(key: key, episodeId: episodeId),
            rawPathParams: {'episodeId': episodeId});

  static const String name = 'EpisodeScreenRoute';
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs({this.key, required this.episodeId});

  final _i15.Key? key;

  final String episodeId;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, episodeId: $episodeId}';
  }
}

/// generated route for
/// [_i10.RootScreen]
class RootScreenRoute extends _i14.PageRouteInfo<void> {
  const RootScreenRoute({List<_i14.PageRouteInfo>? children})
      : super(RootScreenRoute.name, path: '/', initialChildren: children);

  static const String name = 'RootScreenRoute';
}

/// generated route for
/// [_i11.HomeScreen]
class HomeScreenRoute extends _i14.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: 'home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i12.LiveScreen]
class LiveScreenRoute extends _i14.PageRouteInfo<void> {
  const LiveScreenRoute() : super(LiveScreenRoute.name, path: 'live');

  static const String name = 'LiveScreenRoute';
}

/// generated route for
/// [_i13.SearchScreen]
class SearchScreenRoute extends _i14.PageRouteInfo<void> {
  const SearchScreenRoute() : super(SearchScreenRoute.name, path: 'search');

  static const String name = 'SearchScreenRoute';
}
