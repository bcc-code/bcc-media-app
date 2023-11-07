// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:kids/screens/episode.dart' as _i7;
import 'package:kids/screens/home.dart' as _i10;
import 'package:kids/screens/playlist.dart' as _i11;
import 'package:kids/screens/search.dart' as _i13;
import 'package:kids/screens/settings/about.dart' as _i1;
import 'package:kids/screens/settings/addlanguage.dart' as _i2;
import 'package:kids/screens/settings/applanguage.dart' as _i3;
import 'package:kids/screens/settings/contact.dart' as _i4;
import 'package:kids/screens/settings/contentlanguage.dart' as _i5;
import 'package:kids/screens/settings/device_info.dart' as _i6;
import 'package:kids/screens/settings/extra_usergroups.dart' as _i8;
import 'package:kids/screens/settings/faq.dart' as _i9;
import 'package:kids/screens/settings/privacy_policy.dart' as _i12;
import 'package:kids/screens/settings/settings.dart' as _i14;
import 'package:kids/screens/settings/terms_of_use.dart' as _i16;
import 'package:kids/screens/show.dart' as _i15;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    AboutScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i1.AboutScreen(),
      );
    },
    AddLanguageScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i2.AddLanguageScreen(),
      );
    },
    AppLanguageScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i3.AppLanguageScreen(),
      );
    },
    ContactScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i4.ContactScreen(),
      );
    },
    ContentLanguageScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i5.ContentLanguageScreen(),
      );
    },
    DeviceInfoScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i6.DeviceInfoScreen(),
      );
    },
    EpisodeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodeScreenRouteArgs>();
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: _i7.EpisodeScreen(
          key: args.key,
          id: args.id,
          shuffle: args.shuffle,
          playlistId: args.playlistId,
          cursor: args.cursor,
        ),
      );
    },
    ExtraUsergroupsScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i8.ExtraUsergroupsScreen(),
      );
    },
    FAQScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i9.FAQScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i10.HomeScreen(),
      );
    },
    PlaylistScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PlaylistScreenRouteArgs>(
          orElse: () =>
              PlaylistScreenRouteArgs(id: pathParams.getString('id')));
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: _i11.PlaylistScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    PrivacyPolicyScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i12.PrivacyPolicyScreen(),
      );
    },
    SearchScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i13.SearchScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i14.SettingsScreen(),
      );
    },
    ShowScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ShowScreenRouteArgs>(
          orElse: () =>
              ShowScreenRouteArgs(showId: pathParams.getString('showId')));
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: _i15.ShowScreen(
          key: args.key,
          showId: args.showId,
        ),
      );
    },
    TermsOfUseScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i16.TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutScreen]
class AboutScreenRoute extends _i17.PageRouteInfo<void> {
  const AboutScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AboutScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddLanguageScreen]
class AddLanguageScreenRoute extends _i17.PageRouteInfo<void> {
  const AddLanguageScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AddLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddLanguageScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AppLanguageScreen]
class AppLanguageScreenRoute extends _i17.PageRouteInfo<void> {
  const AppLanguageScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AppLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppLanguageScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ContactScreen]
class ContactScreenRoute extends _i17.PageRouteInfo<void> {
  const ContactScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ContactScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ContentLanguageScreen]
class ContentLanguageScreenRoute extends _i17.PageRouteInfo<void> {
  const ContentLanguageScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ContentLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContentLanguageScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DeviceInfoScreen]
class DeviceInfoScreenRoute extends _i17.PageRouteInfo<void> {
  const DeviceInfoScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          DeviceInfoScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeviceInfoScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EpisodeScreen]
class EpisodeScreenRoute extends _i17.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({
    _i18.Key? key,
    required String id,
    bool? shuffle,
    String? playlistId,
    String? cursor,
    List<_i17.PageRouteInfo>? children,
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

  static const _i17.PageInfo<EpisodeScreenRouteArgs> page =
      _i17.PageInfo<EpisodeScreenRouteArgs>(name);
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs({
    this.key,
    required this.id,
    this.shuffle,
    this.playlistId,
    this.cursor,
  });

  final _i18.Key? key;

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
/// [_i8.ExtraUsergroupsScreen]
class ExtraUsergroupsScreenRoute extends _i17.PageRouteInfo<void> {
  const ExtraUsergroupsScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ExtraUsergroupsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExtraUsergroupsScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.FAQScreen]
class FAQScreenRoute extends _i17.PageRouteInfo<void> {
  const FAQScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          FAQScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HomeScreen]
class HomeScreenRoute extends _i17.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PlaylistScreen]
class PlaylistScreenRoute extends _i17.PageRouteInfo<PlaylistScreenRouteArgs> {
  PlaylistScreenRoute({
    _i18.Key? key,
    required String id,
    List<_i17.PageRouteInfo>? children,
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

  static const _i17.PageInfo<PlaylistScreenRouteArgs> page =
      _i17.PageInfo<PlaylistScreenRouteArgs>(name);
}

class PlaylistScreenRouteArgs {
  const PlaylistScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i18.Key? key;

  final String id;

  @override
  String toString() {
    return 'PlaylistScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i12.PrivacyPolicyScreen]
class PrivacyPolicyScreenRoute extends _i17.PageRouteInfo<void> {
  const PrivacyPolicyScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          PrivacyPolicyScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SearchScreen]
class SearchScreenRoute extends _i17.PageRouteInfo<void> {
  const SearchScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SearchScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SettingsScreen]
class SettingsScreenRoute extends _i17.PageRouteInfo<void> {
  const SettingsScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SettingsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ShowScreen]
class ShowScreenRoute extends _i17.PageRouteInfo<ShowScreenRouteArgs> {
  ShowScreenRoute({
    _i18.Key? key,
    required String showId,
    List<_i17.PageRouteInfo>? children,
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

  static const _i17.PageInfo<ShowScreenRouteArgs> page =
      _i17.PageInfo<ShowScreenRouteArgs>(name);
}

class ShowScreenRouteArgs {
  const ShowScreenRouteArgs({
    this.key,
    required this.showId,
  });

  final _i18.Key? key;

  final String showId;

  @override
  String toString() {
    return 'ShowScreenRouteArgs{key: $key, showId: $showId}';
  }
}

/// generated route for
/// [_i16.TermsOfUseScreen]
class TermsOfUseScreenRoute extends _i17.PageRouteInfo<void> {
  const TermsOfUseScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          TermsOfUseScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
