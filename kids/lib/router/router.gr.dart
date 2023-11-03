// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:kids/screens/episode.dart' as _i5;
import 'package:kids/screens/home.dart' as _i8;
import 'package:kids/screens/playlist.dart' as _i9;
import 'package:kids/screens/search.dart' as _i11;
import 'package:kids/screens/settings/about.dart' as _i1;
import 'package:kids/screens/settings/applanguage.dart' as _i2;
import 'package:kids/screens/settings/contact.dart' as _i3;
import 'package:kids/screens/settings/device_info.dart' as _i4;
import 'package:kids/screens/settings/extra_usergroups.dart' as _i6;
import 'package:kids/screens/settings/faq.dart' as _i7;
import 'package:kids/screens/settings/privacy_policy.dart' as _i10;
import 'package:kids/screens/settings/settings.dart' as _i12;
import 'package:kids/screens/settings/terms_of_use.dart' as _i14;
import 'package:kids/screens/show.dart' as _i13;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AboutScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i1.AboutScreen(),
      );
    },
    AppLanguageScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i2.AppLanguageScreen(),
      );
    },
    ContactScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i3.ContactScreen(),
      );
    },
    DeviceInfoScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i4.DeviceInfoScreen(),
      );
    },
    EpisodeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodeScreenRouteArgs>();
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: _i5.EpisodeScreen(
          key: args.key,
          id: args.id,
          shuffle: args.shuffle,
          playlistId: args.playlistId,
          cursor: args.cursor,
        ),
      );
    },
    ExtraUsergroupsScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i6.ExtraUsergroupsScreen(),
      );
    },
    FAQScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i7.FAQScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i8.HomeScreen(),
      );
    },
    PlaylistScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PlaylistScreenRouteArgs>(
          orElse: () =>
              PlaylistScreenRouteArgs(id: pathParams.getString('id')));
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: _i9.PlaylistScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    PrivacyPolicyScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i10.PrivacyPolicyScreen(),
      );
    },
    SearchScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i11.SearchScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i12.SettingsScreen(),
      );
    },
    ShowScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ShowScreenRouteArgs>(
          orElse: () =>
              ShowScreenRouteArgs(showId: pathParams.getString('showId')));
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: _i13.ShowScreen(
          key: args.key,
          showId: args.showId,
        ),
      );
    },
    TermsOfUseScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i14.TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutScreen]
class AboutScreenRoute extends _i15.PageRouteInfo<void> {
  const AboutScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AboutScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AppLanguageScreen]
class AppLanguageScreenRoute extends _i15.PageRouteInfo<void> {
  const AppLanguageScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AppLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppLanguageScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ContactScreen]
class ContactScreenRoute extends _i15.PageRouteInfo<void> {
  const ContactScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ContactScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DeviceInfoScreen]
class DeviceInfoScreenRoute extends _i15.PageRouteInfo<void> {
  const DeviceInfoScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          DeviceInfoScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeviceInfoScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EpisodeScreen]
class EpisodeScreenRoute extends _i15.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({
    _i16.Key? key,
    required String id,
    bool? shuffle,
    String? playlistId,
    String? cursor,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          EpisodeScreenRoute.name,
          args: EpisodeScreenRouteArgs(
            key: key,
            id: id,
            shuffle: shuffle,
            playlistId: playlistId,
            cursor: cursor,
          ),
          rawQueryParams: {
            'shuffle': shuffle,
            'playlistId': playlistId,
            'cursor': cursor,
          },
          initialChildren: children,
        );

  static const String name = 'EpisodeScreenRoute';

  static const _i15.PageInfo<EpisodeScreenRouteArgs> page =
      _i15.PageInfo<EpisodeScreenRouteArgs>(name);
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs({
    this.key,
    required this.id,
    this.shuffle,
    this.playlistId,
    this.cursor,
  });

  final _i16.Key? key;

  final String id;

  final bool? shuffle;

  final String? playlistId;

  final String? cursor;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, id: $id, shuffle: $shuffle, playlistId: $playlistId, cursor: $cursor}';
  }
}

/// generated route for
/// [_i6.ExtraUsergroupsScreen]
class ExtraUsergroupsScreenRoute extends _i15.PageRouteInfo<void> {
  const ExtraUsergroupsScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ExtraUsergroupsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExtraUsergroupsScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.FAQScreen]
class FAQScreenRoute extends _i15.PageRouteInfo<void> {
  const FAQScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          FAQScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeScreen]
class HomeScreenRoute extends _i15.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PlaylistScreen]
class PlaylistScreenRoute extends _i15.PageRouteInfo<PlaylistScreenRouteArgs> {
  PlaylistScreenRoute({
    _i16.Key? key,
    required String id,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          PlaylistScreenRoute.name,
          args: PlaylistScreenRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'PlaylistScreenRoute';

  static const _i15.PageInfo<PlaylistScreenRouteArgs> page =
      _i15.PageInfo<PlaylistScreenRouteArgs>(name);
}

class PlaylistScreenRouteArgs {
  const PlaylistScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i16.Key? key;

  final String id;

  @override
  String toString() {
    return 'PlaylistScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i10.PrivacyPolicyScreen]
class PrivacyPolicyScreenRoute extends _i15.PageRouteInfo<void> {
  const PrivacyPolicyScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PrivacyPolicyScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SearchScreen]
class SearchScreenRoute extends _i15.PageRouteInfo<void> {
  const SearchScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SearchScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SettingsScreen]
class SettingsScreenRoute extends _i15.PageRouteInfo<void> {
  const SettingsScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SettingsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ShowScreen]
class ShowScreenRoute extends _i15.PageRouteInfo<ShowScreenRouteArgs> {
  ShowScreenRoute({
    _i16.Key? key,
    required String showId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ShowScreenRoute.name,
          args: ShowScreenRouteArgs(
            key: key,
            showId: showId,
          ),
          rawPathParams: {'showId': showId},
          initialChildren: children,
        );

  static const String name = 'ShowScreenRoute';

  static const _i15.PageInfo<ShowScreenRouteArgs> page =
      _i15.PageInfo<ShowScreenRouteArgs>(name);
}

class ShowScreenRouteArgs {
  const ShowScreenRouteArgs({
    this.key,
    required this.showId,
  });

  final _i16.Key? key;

  final String showId;

  @override
  String toString() {
    return 'ShowScreenRouteArgs{key: $key, showId: $showId}';
  }
}

/// generated route for
/// [_i14.TermsOfUseScreen]
class TermsOfUseScreenRoute extends _i15.PageRouteInfo<void> {
  const TermsOfUseScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TermsOfUseScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
