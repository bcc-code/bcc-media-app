// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i36;
import 'package:brunstadtv_app/router/router.dart' as _i9;
import 'package:brunstadtv_app/screens/audio/audio.dart' as _i8;
import 'package:brunstadtv_app/screens/audio/audio_playlist.dart' as _i7;
import 'package:brunstadtv_app/screens/contributors/contributor.dart' as _i13;
import 'package:brunstadtv_app/screens/episode.dart' as _i10;
import 'package:brunstadtv_app/screens/init.dart' as _i18;
import 'package:brunstadtv_app/screens/onboarding/onboarding.dart' as _i19;
import 'package:brunstadtv_app/screens/onboarding/signup.dart' as _i29;
import 'package:brunstadtv_app/screens/page.dart' as _i20;
import 'package:brunstadtv_app/screens/player/player.dart' as _i21;
import 'package:brunstadtv_app/screens/settings/about.dart' as _i1;
import 'package:brunstadtv_app/screens/settings/account_deletion.dart' as _i2;
import 'package:brunstadtv_app/screens/settings/app_language.dart' as _i5;
import 'package:brunstadtv_app/screens/settings/audio_language.dart' as _i6;
import 'package:brunstadtv_app/screens/settings/contact.dart' as _i12;
import 'package:brunstadtv_app/screens/settings/contact_public.dart' as _i11;
import 'package:brunstadtv_app/screens/settings/device_info.dart' as _i14;
import 'package:brunstadtv_app/screens/settings/extra_usergroups.dart' as _i15;
import 'package:brunstadtv_app/screens/settings/faq.dart' as _i16;
import 'package:brunstadtv_app/screens/settings/privacy_policy.dart' as _i22;
import 'package:brunstadtv_app/screens/settings/settings.dart' as _i25;
import 'package:brunstadtv_app/screens/settings/subtitle_language.dart' as _i31;
import 'package:brunstadtv_app/screens/settings/terms_of_use.dart' as _i33;
import 'package:brunstadtv_app/screens/settings/video_quality.dart' as _i34;
import 'package:brunstadtv_app/screens/shorts/short.dart' as _i26;
import 'package:brunstadtv_app/screens/shorts/shorts.dart' as _i27;
import 'package:brunstadtv_app/screens/show/show.dart' as _i28;
import 'package:brunstadtv_app/screens/study/achievement_group.dart' as _i3;
import 'package:brunstadtv_app/screens/study/achievements.dart' as _i4;
import 'package:brunstadtv_app/screens/study/study.dart' as _i30;
import 'package:brunstadtv_app/screens/tabs/home.dart' as _i17;
import 'package:brunstadtv_app/screens/tabs/profile.dart' as _i23;
import 'package:brunstadtv_app/screens/tabs/search.dart' as _i24;
import 'package:brunstadtv_app/screens/tabs/tabs_root.dart' as _i32;
import 'package:brunstadtv_app/screens/w/w.dart' as _i35;
import 'package:flutter/foundation.dart' as _i38;
import 'package:flutter/material.dart' as _i37;

/// generated route for
/// [_i1.AboutScreen]
class AboutScreenRoute extends _i36.PageRouteInfo<void> {
  const AboutScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          AboutScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutScreen();
    },
  );
}

/// generated route for
/// [_i2.AccountDeletionScreen]
class AccountDeletionScreenRoute extends _i36.PageRouteInfo<void> {
  const AccountDeletionScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          AccountDeletionScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountDeletionScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i2.AccountDeletionScreen();
    },
  );
}

/// generated route for
/// [_i3.AchievementGroupScreen]
class AchievementGroupScreenRoute
    extends _i36.PageRouteInfo<AchievementGroupScreenRouteArgs> {
  AchievementGroupScreenRoute({
    _i37.Key? key,
    required String groupId,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          AchievementGroupScreenRoute.name,
          args: AchievementGroupScreenRouteArgs(
            key: key,
            groupId: groupId,
          ),
          rawPathParams: {'groupId': groupId},
          initialChildren: children,
        );

  static const String name = 'AchievementGroupScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<AchievementGroupScreenRouteArgs>(
          orElse: () => AchievementGroupScreenRouteArgs(
              groupId: pathParams.getString('groupId')));
      return _i3.AchievementGroupScreen(
        key: args.key,
        groupId: args.groupId,
      );
    },
  );
}

class AchievementGroupScreenRouteArgs {
  const AchievementGroupScreenRouteArgs({
    this.key,
    required this.groupId,
  });

  final _i37.Key? key;

  final String groupId;

  @override
  String toString() {
    return 'AchievementGroupScreenRouteArgs{key: $key, groupId: $groupId}';
  }
}

/// generated route for
/// [_i4.AchievementsScreen]
class AchievementsScreenRoute extends _i36.PageRouteInfo<void> {
  const AchievementsScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          AchievementsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AchievementsScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i4.AchievementsScreen();
    },
  );
}

/// generated route for
/// [_i5.AppLanguageScreen]
class AppLanguageScreenRoute extends _i36.PageRouteInfo<void> {
  const AppLanguageScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          AppLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppLanguageScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i5.AppLanguageScreen();
    },
  );
}

/// generated route for
/// [_i6.AudioLanguageScreen]
class AudioLanguageScreenRoute extends _i36.PageRouteInfo<void> {
  const AudioLanguageScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          AudioLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AudioLanguageScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i6.AudioLanguageScreen();
    },
  );
}

/// generated route for
/// [_i7.AudioPlaylistScreen]
class AudioPlaylistScreenRoute
    extends _i36.PageRouteInfo<AudioPlaylistScreenRouteArgs> {
  AudioPlaylistScreenRoute({
    _i37.Key? key,
    required int playlistId,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          AudioPlaylistScreenRoute.name,
          args: AudioPlaylistScreenRouteArgs(
            key: key,
            playlistId: playlistId,
          ),
          rawPathParams: {'playlistId': playlistId},
          initialChildren: children,
        );

  static const String name = 'AudioPlaylistScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<AudioPlaylistScreenRouteArgs>(
          orElse: () => AudioPlaylistScreenRouteArgs(
              playlistId: pathParams.getInt('playlistId')));
      return _i7.AudioPlaylistScreen(
        key: args.key,
        playlistId: args.playlistId,
      );
    },
  );
}

class AudioPlaylistScreenRouteArgs {
  const AudioPlaylistScreenRouteArgs({
    this.key,
    required this.playlistId,
  });

  final _i37.Key? key;

  final int playlistId;

  @override
  String toString() {
    return 'AudioPlaylistScreenRouteArgs{key: $key, playlistId: $playlistId}';
  }
}

/// generated route for
/// [_i8.AudioScreen]
class AudioScreenRoute extends _i36.PageRouteInfo<void> {
  const AudioScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          AudioScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AudioScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i8.AudioScreen();
    },
  );
}

/// generated route for
/// [_i9.AudioWrapperScreen]
class AudioWrapperScreenRoute extends _i36.PageRouteInfo<void> {
  const AudioWrapperScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          AudioWrapperScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AudioWrapperScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i9.AudioWrapperScreen();
    },
  );
}

/// generated route for
/// [_i10.CollectionEpisodeScreen]
class CollectionEpisodeScreenRoute
    extends _i36.PageRouteInfo<CollectionEpisodeScreenRouteArgs> {
  CollectionEpisodeScreenRoute({
    _i38.Key? key,
    required String episodeId,
    bool? autoplay = true,
    int? queryParamStartPositionSeconds,
    bool? hideBottomSection,
    String? collectionId,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          CollectionEpisodeScreenRoute.name,
          args: CollectionEpisodeScreenRouteArgs(
            key: key,
            episodeId: episodeId,
            autoplay: autoplay,
            queryParamStartPositionSeconds: queryParamStartPositionSeconds,
            hideBottomSection: hideBottomSection,
            collectionId: collectionId,
          ),
          rawPathParams: {
            'episodeId': episodeId,
            'collectionId': collectionId,
          },
          rawQueryParams: {
            'autoplay': autoplay,
            't': queryParamStartPositionSeconds,
            'hide_bottom_section': hideBottomSection,
          },
          initialChildren: children,
        );

  static const String name = 'CollectionEpisodeScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<CollectionEpisodeScreenRouteArgs>(
          orElse: () => CollectionEpisodeScreenRouteArgs(
                episodeId: pathParams.getString('episodeId'),
                autoplay: queryParams.optBool(
                  'autoplay',
                  true,
                ),
                queryParamStartPositionSeconds: queryParams.optInt('t'),
                hideBottomSection: queryParams.optBool('hide_bottom_section'),
                collectionId: pathParams.optString('collectionId'),
              ));
      return _i10.CollectionEpisodeScreen(
        key: args.key,
        episodeId: args.episodeId,
        autoplay: args.autoplay,
        queryParamStartPositionSeconds: args.queryParamStartPositionSeconds,
        hideBottomSection: args.hideBottomSection,
        collectionId: args.collectionId,
      );
    },
  );
}

class CollectionEpisodeScreenRouteArgs {
  const CollectionEpisodeScreenRouteArgs({
    this.key,
    required this.episodeId,
    this.autoplay = true,
    this.queryParamStartPositionSeconds,
    this.hideBottomSection,
    this.collectionId,
  });

  final _i38.Key? key;

  final String episodeId;

  final bool? autoplay;

  final int? queryParamStartPositionSeconds;

  final bool? hideBottomSection;

  final String? collectionId;

  @override
  String toString() {
    return 'CollectionEpisodeScreenRouteArgs{key: $key, episodeId: $episodeId, autoplay: $autoplay, queryParamStartPositionSeconds: $queryParamStartPositionSeconds, hideBottomSection: $hideBottomSection, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i11.ContactPublicScreen]
class ContactPublicScreenRoute extends _i36.PageRouteInfo<void> {
  const ContactPublicScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          ContactPublicScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactPublicScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i11.ContactPublicScreen();
    },
  );
}

/// generated route for
/// [_i12.ContactScreen]
class ContactScreenRoute extends _i36.PageRouteInfo<void> {
  const ContactScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          ContactScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i12.ContactScreen();
    },
  );
}

/// generated route for
/// [_i13.ContributorScreen]
class ContributorScreenRoute
    extends _i36.PageRouteInfo<ContributorScreenRouteArgs> {
  ContributorScreenRoute({
    _i37.Key? key,
    required String personId,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          ContributorScreenRoute.name,
          args: ContributorScreenRouteArgs(
            key: key,
            personId: personId,
          ),
          rawPathParams: {'personId': personId},
          initialChildren: children,
        );

  static const String name = 'ContributorScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ContributorScreenRouteArgs>(
          orElse: () => ContributorScreenRouteArgs(
              personId: pathParams.getString('personId')));
      return _i13.ContributorScreen(
        key: args.key,
        personId: args.personId,
      );
    },
  );
}

class ContributorScreenRouteArgs {
  const ContributorScreenRouteArgs({
    this.key,
    required this.personId,
  });

  final _i37.Key? key;

  final String personId;

  @override
  String toString() {
    return 'ContributorScreenRouteArgs{key: $key, personId: $personId}';
  }
}

/// generated route for
/// [_i14.DeviceInfoScreen]
class DeviceInfoScreenRoute extends _i36.PageRouteInfo<void> {
  const DeviceInfoScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          DeviceInfoScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeviceInfoScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i14.DeviceInfoScreen();
    },
  );
}

/// generated route for
/// [_i10.EpisodeScreen]
class EpisodeScreenRoute extends _i36.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({
    _i38.Key? key,
    required String episodeId,
    bool? autoplay = true,
    int? queryParamStartPositionSeconds,
    bool? hideBottomSection,
    String? collectionId,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          EpisodeScreenRoute.name,
          args: EpisodeScreenRouteArgs(
            key: key,
            episodeId: episodeId,
            autoplay: autoplay,
            queryParamStartPositionSeconds: queryParamStartPositionSeconds,
            hideBottomSection: hideBottomSection,
            collectionId: collectionId,
          ),
          rawPathParams: {'episodeId': episodeId},
          rawQueryParams: {
            'autoplay': autoplay,
            't': queryParamStartPositionSeconds,
            'hide_bottom_section': hideBottomSection,
            'collectionId': collectionId,
          },
          initialChildren: children,
        );

  static const String name = 'EpisodeScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<EpisodeScreenRouteArgs>(
          orElse: () => EpisodeScreenRouteArgs(
                episodeId: pathParams.getString('episodeId'),
                autoplay: queryParams.optBool(
                  'autoplay',
                  true,
                ),
                queryParamStartPositionSeconds: queryParams.optInt('t'),
                hideBottomSection: queryParams.optBool('hide_bottom_section'),
                collectionId: queryParams.optString('collectionId'),
              ));
      return _i10.EpisodeScreen(
        key: args.key,
        episodeId: args.episodeId,
        autoplay: args.autoplay,
        queryParamStartPositionSeconds: args.queryParamStartPositionSeconds,
        hideBottomSection: args.hideBottomSection,
        collectionId: args.collectionId,
      );
    },
  );
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs({
    this.key,
    required this.episodeId,
    this.autoplay = true,
    this.queryParamStartPositionSeconds,
    this.hideBottomSection,
    this.collectionId,
  });

  final _i38.Key? key;

  final String episodeId;

  final bool? autoplay;

  final int? queryParamStartPositionSeconds;

  final bool? hideBottomSection;

  final String? collectionId;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, episodeId: $episodeId, autoplay: $autoplay, queryParamStartPositionSeconds: $queryParamStartPositionSeconds, hideBottomSection: $hideBottomSection, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i15.ExtraUsergroupsScreen]
class ExtraUsergroupsScreenRoute extends _i36.PageRouteInfo<void> {
  const ExtraUsergroupsScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          ExtraUsergroupsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExtraUsergroupsScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i15.ExtraUsergroupsScreen();
    },
  );
}

/// generated route for
/// [_i16.FAQScreen]
class FAQScreenRoute extends _i36.PageRouteInfo<void> {
  const FAQScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          FAQScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i16.FAQScreen();
    },
  );
}

/// generated route for
/// [_i17.HomeScreen]
class HomeScreenRoute extends _i36.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i38.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i17.HomeScreen(key: args.key);
    },
  );
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i38.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.HomeWrapperScreen]
class HomeWrapperScreenRoute extends _i36.PageRouteInfo<void> {
  const HomeWrapperScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          HomeWrapperScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeWrapperScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i9.HomeWrapperScreen();
    },
  );
}

/// generated route for
/// [_i18.InitScreen]
class InitScreenRoute extends _i36.PageRouteInfo<void> {
  const InitScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          InitScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i18.InitScreen();
    },
  );
}

/// generated route for
/// [_i19.OnboardingScreen]
class OnboardingScreenRoute
    extends _i36.PageRouteInfo<OnboardingScreenRouteArgs> {
  OnboardingScreenRoute({
    _i38.Key? key,
    String? loginError,
    bool auto = false,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          OnboardingScreenRoute.name,
          args: OnboardingScreenRouteArgs(
            key: key,
            loginError: loginError,
            auto: auto,
          ),
          rawQueryParams: {'auto': auto},
          initialChildren: children,
        );

  static const String name = 'OnboardingScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<OnboardingScreenRouteArgs>(
          orElse: () => OnboardingScreenRouteArgs(
                  auto: queryParams.getBool(
                'auto',
                false,
              )));
      return _i19.OnboardingScreen(
        key: args.key,
        loginError: args.loginError,
        auto: args.auto,
      );
    },
  );
}

class OnboardingScreenRouteArgs {
  const OnboardingScreenRouteArgs({
    this.key,
    this.loginError,
    this.auto = false,
  });

  final _i38.Key? key;

  final String? loginError;

  final bool auto;

  @override
  String toString() {
    return 'OnboardingScreenRouteArgs{key: $key, loginError: $loginError, auto: $auto}';
  }
}

/// generated route for
/// [_i20.PageScreen]
class PageScreenRoute extends _i36.PageRouteInfo<PageScreenRouteArgs> {
  PageScreenRoute({
    _i38.Key? key,
    required String pageCode,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          PageScreenRoute.name,
          args: PageScreenRouteArgs(
            key: key,
            pageCode: pageCode,
          ),
          rawPathParams: {'pageCode': pageCode},
          initialChildren: children,
        );

  static const String name = 'PageScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PageScreenRouteArgs>(
          orElse: () =>
              PageScreenRouteArgs(pageCode: pathParams.getString('pageCode')));
      return _i20.PageScreen(
        key: args.key,
        pageCode: args.pageCode,
      );
    },
  );
}

class PageScreenRouteArgs {
  const PageScreenRouteArgs({
    this.key,
    required this.pageCode,
  });

  final _i38.Key? key;

  final String pageCode;

  @override
  String toString() {
    return 'PageScreenRouteArgs{key: $key, pageCode: $pageCode}';
  }
}

/// generated route for
/// [_i21.PlayerScreen]
class PlayerScreenRoute extends _i36.PageRouteInfo<void> {
  const PlayerScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          PlayerScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayerScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i21.PlayerScreen();
    },
  );
}

/// generated route for
/// [_i22.PrivacyPolicyScreen]
class PrivacyPolicyScreenRoute extends _i36.PageRouteInfo<void> {
  const PrivacyPolicyScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          PrivacyPolicyScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i22.PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [_i23.ProfileScreen]
class ProfileScreenRoute extends _i36.PageRouteInfo<ProfileScreenRouteArgs> {
  ProfileScreenRoute({
    _i37.Key? key,
    String? scroll,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          ProfileScreenRoute.name,
          args: ProfileScreenRouteArgs(
            key: key,
            scroll: scroll,
          ),
          rawQueryParams: {'scroll': scroll},
          initialChildren: children,
        );

  static const String name = 'ProfileScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<ProfileScreenRouteArgs>(
          orElse: () =>
              ProfileScreenRouteArgs(scroll: queryParams.optString('scroll')));
      return _i23.ProfileScreen(
        key: args.key,
        scroll: args.scroll,
      );
    },
  );
}

class ProfileScreenRouteArgs {
  const ProfileScreenRouteArgs({
    this.key,
    this.scroll,
  });

  final _i37.Key? key;

  final String? scroll;

  @override
  String toString() {
    return 'ProfileScreenRouteArgs{key: $key, scroll: $scroll}';
  }
}

/// generated route for
/// [_i9.ProfileWrapperScreen]
class ProfileWrapperScreenRoute extends _i36.PageRouteInfo<void> {
  const ProfileWrapperScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          ProfileWrapperScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileWrapperScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileWrapperScreen();
    },
  );
}

/// generated route for
/// [_i24.SearchScreen]
class SearchScreenRoute extends _i36.PageRouteInfo<SearchScreenRouteArgs> {
  SearchScreenRoute({
    _i38.Key? key,
    String? queryParam,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          SearchScreenRoute.name,
          args: SearchScreenRouteArgs(
            key: key,
            queryParam: queryParam,
          ),
          rawQueryParams: {'q': queryParam},
          initialChildren: children,
        );

  static const String name = 'SearchScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<SearchScreenRouteArgs>(
          orElse: () =>
              SearchScreenRouteArgs(queryParam: queryParams.optString('q')));
      return _i24.SearchScreen(
        key: args.key,
        queryParam: args.queryParam,
      );
    },
  );
}

class SearchScreenRouteArgs {
  const SearchScreenRouteArgs({
    this.key,
    this.queryParam,
  });

  final _i38.Key? key;

  final String? queryParam;

  @override
  String toString() {
    return 'SearchScreenRouteArgs{key: $key, queryParam: $queryParam}';
  }
}

/// generated route for
/// [_i9.SearchWrapperScreen]
class SearchWrapperScreenRoute extends _i36.PageRouteInfo<void> {
  const SearchWrapperScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          SearchWrapperScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchWrapperScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i9.SearchWrapperScreen();
    },
  );
}

/// generated route for
/// [_i25.SettingsScreen]
class SettingsScreenRoute extends _i36.PageRouteInfo<void> {
  const SettingsScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          SettingsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i25.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i26.ShortScreen]
class ShortScreenRoute extends _i36.PageRouteInfo<ShortScreenRouteArgs> {
  ShortScreenRoute({
    _i37.Key? key,
    required String id,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          ShortScreenRoute.name,
          args: ShortScreenRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ShortScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ShortScreenRouteArgs>(
          orElse: () => ShortScreenRouteArgs(id: pathParams.getString('id')));
      return _i26.ShortScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class ShortScreenRouteArgs {
  const ShortScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i37.Key? key;

  final String id;

  @override
  String toString() {
    return 'ShortScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i27.ShortsScreen]
class ShortsScreenRoute extends _i36.PageRouteInfo<void> {
  const ShortsScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          ShortsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShortsScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i27.ShortsScreen();
    },
  );
}

/// generated route for
/// [_i9.ShortsWrapperScreen]
class ShortsWrapperScreenRoute extends _i36.PageRouteInfo<void> {
  const ShortsWrapperScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          ShortsWrapperScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShortsWrapperScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i9.ShortsWrapperScreen();
    },
  );
}

/// generated route for
/// [_i28.ShowScreen]
class ShowScreenRoute extends _i36.PageRouteInfo<ShowScreenRouteArgs> {
  ShowScreenRoute({
    _i37.Key? key,
    required String showId,
    List<_i36.PageRouteInfo>? children,
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

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ShowScreenRouteArgs>(
          orElse: () =>
              ShowScreenRouteArgs(showId: pathParams.getString('showId')));
      return _i28.ShowScreen(
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

  final _i37.Key? key;

  final String showId;

  @override
  String toString() {
    return 'ShowScreenRouteArgs{key: $key, showId: $showId}';
  }
}

/// generated route for
/// [_i29.SignupScreen]
class SignupScreenRoute extends _i36.PageRouteInfo<void> {
  const SignupScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          SignupScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i29.SignupScreen();
    },
  );
}

/// generated route for
/// [_i30.StudyScreen]
class StudyScreenRoute extends _i36.PageRouteInfo<StudyScreenRouteArgs> {
  StudyScreenRoute({
    _i38.Key? key,
    required String episodeId,
    required String lessonId,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          StudyScreenRoute.name,
          args: StudyScreenRouteArgs(
            key: key,
            episodeId: episodeId,
            lessonId: lessonId,
          ),
          initialChildren: children,
        );

  static const String name = 'StudyScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StudyScreenRouteArgs>();
      return _i30.StudyScreen(
        key: args.key,
        episodeId: args.episodeId,
        lessonId: args.lessonId,
      );
    },
  );
}

class StudyScreenRouteArgs {
  const StudyScreenRouteArgs({
    this.key,
    required this.episodeId,
    required this.lessonId,
  });

  final _i38.Key? key;

  final String episodeId;

  final String lessonId;

  @override
  String toString() {
    return 'StudyScreenRouteArgs{key: $key, episodeId: $episodeId, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i31.SubtitleLanguageScreen]
class SubtitleLanguageScreenRoute extends _i36.PageRouteInfo<void> {
  const SubtitleLanguageScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          SubtitleLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubtitleLanguageScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i31.SubtitleLanguageScreen();
    },
  );
}

/// generated route for
/// [_i32.TabsRootScreen]
class TabsRootScreenRoute extends _i36.PageRouteInfo<void> {
  const TabsRootScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          TabsRootScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabsRootScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i32.TabsRootScreen();
    },
  );
}

/// generated route for
/// [_i9.TabsWrapperScreen]
class TabsWrapperScreenRoute extends _i36.PageRouteInfo<void> {
  const TabsWrapperScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          TabsWrapperScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabsWrapperScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i9.TabsWrapperScreen();
    },
  );
}

/// generated route for
/// [_i33.TermsOfUseScreen]
class TermsOfUseScreenRoute extends _i36.PageRouteInfo<void> {
  const TermsOfUseScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          TermsOfUseScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i33.TermsOfUseScreen();
    },
  );
}

/// generated route for
/// [_i34.VideoQualityScreen]
class VideoQualityScreenRoute extends _i36.PageRouteInfo<void> {
  const VideoQualityScreenRoute({List<_i36.PageRouteInfo>? children})
      : super(
          VideoQualityScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'VideoQualityScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      return const _i34.VideoQualityScreen();
    },
  );
}

/// generated route for
/// [_i35.WebviewScreen]
class WebviewScreenRoute extends _i36.PageRouteInfo<WebviewScreenRouteArgs> {
  WebviewScreenRoute({
    _i38.Key? key,
    required String redirectCode,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          WebviewScreenRoute.name,
          args: WebviewScreenRouteArgs(
            key: key,
            redirectCode: redirectCode,
          ),
          rawPathParams: {'redirectCode': redirectCode},
          initialChildren: children,
        );

  static const String name = 'WebviewScreenRoute';

  static _i36.PageInfo page = _i36.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<WebviewScreenRouteArgs>(
          orElse: () => WebviewScreenRouteArgs(
              redirectCode: pathParams.getString('redirectCode')));
      return _i35.WebviewScreen(
        key: args.key,
        redirectCode: args.redirectCode,
      );
    },
  );
}

class WebviewScreenRouteArgs {
  const WebviewScreenRouteArgs({
    this.key,
    required this.redirectCode,
  });

  final _i38.Key? key;

  final String redirectCode;

  @override
  String toString() {
    return 'WebviewScreenRouteArgs{key: $key, redirectCode: $redirectCode}';
  }
}
