// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:kids/screens/episode.dart' as _i6;
import 'package:kids/screens/home.dart' as _i9;
import 'package:kids/screens/init.dart' as _i10;
import 'package:kids/screens/playlist.dart' as _i11;
import 'package:kids/screens/search.dart' as _i13;
import 'package:kids/screens/settings/about.dart' as _i1;
import 'package:kids/screens/settings/app_language.dart' as _i2;
import 'package:kids/screens/settings/contact.dart' as _i3;
import 'package:kids/screens/settings/content_language.dart' as _i4;
import 'package:kids/screens/settings/device_info.dart' as _i5;
import 'package:kids/screens/settings/extra_usergroups.dart' as _i7;
import 'package:kids/screens/settings/faq.dart' as _i8;
import 'package:kids/screens/settings/privacy_policy.dart' as _i12;
import 'package:kids/screens/settings/settings.dart' as _i14;
import 'package:kids/screens/settings/terms_of_use.dart' as _i16;
import 'package:kids/screens/show.dart' as _i15;

/// generated route for
/// [_i1.AboutScreen]
class AboutScreenRoute extends _i17.PageRouteInfo<void> {
  const AboutScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AboutScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutScreenRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutScreen();
    },
  );
}

/// generated route for
/// [_i2.AppLanguageScreen]
class AppLanguageScreenRoute extends _i17.PageRouteInfo<void> {
  const AppLanguageScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AppLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppLanguageScreenRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i2.AppLanguageScreen();
    },
  );
}

/// generated route for
/// [_i3.ContactScreen]
class ContactScreenRoute extends _i17.PageRouteInfo<void> {
  const ContactScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ContactScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactScreenRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i3.ContactScreen();
    },
  );
}

/// generated route for
/// [_i4.ContentLanguageScreen]
class ContentLanguageScreenRoute extends _i17.PageRouteInfo<void> {
  const ContentLanguageScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ContentLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContentLanguageScreenRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i4.ContentLanguageScreen();
    },
  );
}

/// generated route for
/// [_i5.DeviceInfoScreen]
class DeviceInfoScreenRoute extends _i17.PageRouteInfo<void> {
  const DeviceInfoScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          DeviceInfoScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeviceInfoScreenRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i5.DeviceInfoScreen();
    },
  );
}

/// generated route for
/// [_i6.EpisodeScreen]
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
          rawPathParams: {'episodeId': id},
          rawQueryParams: {
            'shuffle': shuffle,
            'playlistId': playlistId,
            'cursor': cursor,
          },
          initialChildren: children,
        );

  static const String name = 'EpisodeScreenRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<EpisodeScreenRouteArgs>(
          orElse: () => EpisodeScreenRouteArgs(
                id: pathParams.getString('episodeId'),
                shuffle: queryParams.optBool('shuffle'),
                playlistId: queryParams.optString('playlistId'),
                cursor: queryParams.optString('cursor'),
              ));
      return _i6.EpisodeScreen(
        key: args.key,
        id: args.id,
        shuffle: args.shuffle,
        playlistId: args.playlistId,
        cursor: args.cursor,
      );
    },
  );
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
/// [_i7.ExtraUsergroupsScreen]
class ExtraUsergroupsScreenRoute extends _i17.PageRouteInfo<void> {
  const ExtraUsergroupsScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ExtraUsergroupsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExtraUsergroupsScreenRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i7.ExtraUsergroupsScreen();
    },
  );
}

/// generated route for
/// [_i8.FAQScreen]
class FAQScreenRoute extends _i17.PageRouteInfo<void> {
  const FAQScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          FAQScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQScreenRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i8.FAQScreen();
    },
  );
}

/// generated route for
/// [_i9.HomeScreen]
class HomeScreenRoute extends _i17.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i9.HomeScreen();
    },
  );
}

/// generated route for
/// [_i10.InitScreen]
class InitScreenRoute extends _i17.PageRouteInfo<void> {
  const InitScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          InitScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitScreenRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i10.InitScreen();
    },
  );
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

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PlaylistScreenRouteArgs>(
          orElse: () =>
              PlaylistScreenRouteArgs(id: pathParams.getString('id')));
      return _i11.PlaylistScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
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

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i12.PrivacyPolicyScreen();
    },
  );
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

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i13.SearchScreen();
    },
  );
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

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i14.SettingsScreen();
    },
  );
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

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ShowScreenRouteArgs>(
          orElse: () =>
              ShowScreenRouteArgs(showId: pathParams.getString('showId')));
      return _i15.ShowScreen(
        key: args.key,
        showId: args.showId,
      );
    },
  );
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

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i16.TermsOfUseScreen();
    },
  );
}
