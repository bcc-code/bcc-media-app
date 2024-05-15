// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i34;
import 'package:brunstadtv_app/router/router.dart' as _i17;
import 'package:brunstadtv_app/screens/auto_login.dart' as _i7;
import 'package:brunstadtv_app/screens/contributors/contributor.dart' as _i12;
import 'package:brunstadtv_app/screens/episode.dart' as _i9;
import 'package:brunstadtv_app/screens/onboarding/onboarding.dart' as _i19;
import 'package:brunstadtv_app/screens/onboarding/signup.dart' as _i27;
import 'package:brunstadtv_app/screens/page.dart' as _i20;
import 'package:brunstadtv_app/screens/settings/about.dart' as _i1;
import 'package:brunstadtv_app/screens/settings/account_deletion.dart' as _i2;
import 'package:brunstadtv_app/screens/settings/app_language.dart' as _i5;
import 'package:brunstadtv_app/screens/settings/audio_language.dart' as _i6;
import 'package:brunstadtv_app/screens/settings/contact.dart' as _i11;
import 'package:brunstadtv_app/screens/settings/contact_public.dart' as _i10;
import 'package:brunstadtv_app/screens/settings/device_info.dart' as _i13;
import 'package:brunstadtv_app/screens/settings/extra_usergroups.dart' as _i14;
import 'package:brunstadtv_app/screens/settings/faq.dart' as _i15;
import 'package:brunstadtv_app/screens/settings/privacy_policy.dart' as _i21;
import 'package:brunstadtv_app/screens/settings/settings.dart' as _i24;
import 'package:brunstadtv_app/screens/settings/subtitle_language.dart' as _i29;
import 'package:brunstadtv_app/screens/settings/terms_of_use.dart' as _i31;
import 'package:brunstadtv_app/screens/settings/video_quality.dart' as _i32;
import 'package:brunstadtv_app/screens/shorts/short.dart' as _i25;
import 'package:brunstadtv_app/screens/shorts/shorts.dart' as _i26;
import 'package:brunstadtv_app/screens/study/achievement_group.dart' as _i3;
import 'package:brunstadtv_app/screens/study/achievements.dart' as _i4;
import 'package:brunstadtv_app/screens/study/study.dart' as _i28;
import 'package:brunstadtv_app/screens/tabs/calendar.dart' as _i8;
import 'package:brunstadtv_app/screens/tabs/home.dart' as _i16;
import 'package:brunstadtv_app/screens/tabs/live.dart' as _i18;
import 'package:brunstadtv_app/screens/tabs/profile.dart' as _i22;
import 'package:brunstadtv_app/screens/tabs/search.dart' as _i23;
import 'package:brunstadtv_app/screens/tabs/tabs_root.dart' as _i30;
import 'package:brunstadtv_app/screens/w/w.dart' as _i33;
import 'package:flutter/foundation.dart' as _i36;
import 'package:flutter/material.dart' as _i35;

abstract class $AppRouter extends _i34.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i34.PageFactory> pagesMap = {
    AboutScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i1.AboutScreen(),
      );
    },
    AccountDeletionScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i2.AccountDeletionScreen(),
      );
    },
    AchievementGroupScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AchievementGroupScreenRouteArgs>(
          orElse: () => AchievementGroupScreenRouteArgs(
              groupId: pathParams.getString('groupId')));
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i3.AchievementGroupScreen(
          key: args.key,
          groupId: args.groupId,
        ),
      );
    },
    AchievementsScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i4.AchievementsScreen(),
      );
    },
    AppLanguageScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i5.AppLanguageScreen(),
      );
    },
    AudioLanguageScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i6.AudioLanguageScreen(),
      );
    },
    AutoLoginScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i7.AutoLoginScreen(),
      );
    },
    CalendarScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i8.CalendarScreen(),
      );
    },
    CollectionEpisodeScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<CollectionEpisodeScreenRouteArgs>(
          orElse: () => CollectionEpisodeScreenRouteArgs(
                episodeId: pathParams.getString('episodeId'),
                autoplay: queryParams.optBool('autoplay'),
                queryParamStartPosition: queryParams.optInt('t'),
                hideBottomSection: queryParams.optBool('hide_bottom_section'),
                collectionId: pathParams.optString('collectionId'),
              ));
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i9.CollectionEpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
          collectionId: args.collectionId,
        ),
      );
    },
    ContactPublicScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i10.ContactPublicScreen(),
      );
    },
    ContactScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i11.ContactScreen(),
      );
    },
    ContributorScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ContributorScreenRouteArgs>(
          orElse: () =>
              ContributorScreenRouteArgs(id: pathParams.getString('id')));
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i12.ContributorScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    DeviceInfoScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i13.DeviceInfoScreen(),
      );
    },
    EpisodeScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<EpisodeScreenRouteArgs>(
          orElse: () => EpisodeScreenRouteArgs(
                episodeId: pathParams.getString('episodeId'),
                autoplay: queryParams.optBool('autoplay'),
                queryParamStartPosition: queryParams.optInt('t'),
                hideBottomSection: queryParams.optBool('hide_bottom_section'),
                collectionId: queryParams.optString('collectionId'),
              ));
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i9.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
          collectionId: args.collectionId,
        ),
      );
    },
    ExtraUsergroupsScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i14.ExtraUsergroupsScreen(),
      );
    },
    FAQScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i15.FAQScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i16.HomeScreen(key: args.key),
      );
    },
    HomeWrapperScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i17.HomeWrapperScreen(),
      );
    },
    LiveScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i18.LiveScreen(),
      );
    },
    OnboardingScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<OnboardingScreenRouteArgs>(
          orElse: () => OnboardingScreenRouteArgs(
                  auto: queryParams.getBool(
                'auto',
                false,
              )));
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i19.OnboardingScreen(
          key: args.key,
          loginError: args.loginError,
          auto: args.auto,
        ),
      );
    },
    PageScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PageScreenRouteArgs>(
          orElse: () =>
              PageScreenRouteArgs(pageCode: pathParams.getString('pageCode')));
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i20.PageScreen(
          key: args.key,
          pageCode: args.pageCode,
        ),
      );
    },
    PrivacyPolicyScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i21.PrivacyPolicyScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<ProfileScreenRouteArgs>(
          orElse: () =>
              ProfileScreenRouteArgs(scroll: queryParams.optString('scroll')));
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i22.ProfileScreen(
          key: args.key,
          scroll: args.scroll,
        ),
      );
    },
    ProfileWrapperScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i17.ProfileWrapperScreen(),
      );
    },
    SearchScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<SearchScreenRouteArgs>(
          orElse: () =>
              SearchScreenRouteArgs(query: queryParams.optString('q')));
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i23.SearchScreen(
          key: args.key,
          query: args.query,
        ),
      );
    },
    SearchWrapperScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i17.SearchWrapperScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i24.SettingsScreen(),
      );
    },
    ShortScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ShortScreenRouteArgs>(
          orElse: () => ShortScreenRouteArgs(id: pathParams.getString('id')));
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i25.ShortScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ShortsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ShortsScreenRouteArgs>(
          orElse: () => const ShortsScreenRouteArgs());
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i26.ShortsScreen(
          key: args.key,
          preventScroll: args.preventScroll,
        ),
      );
    },
    ShortsWrapperScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i17.ShortsWrapperScreen(),
      );
    },
    SignupScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i27.SignupScreen(),
      );
    },
    StudyScreenRoute.name: (routeData) {
      final args = routeData.argsAs<StudyScreenRouteArgs>();
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i28.StudyScreen(
          key: args.key,
          episodeId: args.episodeId,
          lessonId: args.lessonId,
        ),
      );
    },
    SubtitleLanguageScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i29.SubtitleLanguageScreen(),
      );
    },
    TabsRootScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i30.TabsRootScreen(),
      );
    },
    TabsWrapperScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i17.TabsWrapperScreen(),
      );
    },
    TermsOfUseScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i31.TermsOfUseScreen(),
      );
    },
    VideoQualityScreenRoute.name: (routeData) {
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i32.VideoQualityScreen(),
      );
    },
    WebviewScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebviewScreenRouteArgs>(
          orElse: () => WebviewScreenRouteArgs(
              redirectCode: pathParams.getString('redirectCode')));
      return _i34.AutoRoutePage<void>(
        routeData: routeData,
        child: _i33.WebviewScreen(
          key: args.key,
          redirectCode: args.redirectCode,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutScreen]
class AboutScreenRoute extends _i34.PageRouteInfo<void> {
  const AboutScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AboutScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AccountDeletionScreen]
class AccountDeletionScreenRoute extends _i34.PageRouteInfo<void> {
  const AccountDeletionScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AccountDeletionScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountDeletionScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AchievementGroupScreen]
class AchievementGroupScreenRoute
    extends _i34.PageRouteInfo<AchievementGroupScreenRouteArgs> {
  AchievementGroupScreenRoute({
    _i35.Key? key,
    required String groupId,
    List<_i34.PageRouteInfo>? children,
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

  static const _i34.PageInfo<AchievementGroupScreenRouteArgs> page =
      _i34.PageInfo<AchievementGroupScreenRouteArgs>(name);
}

class AchievementGroupScreenRouteArgs {
  const AchievementGroupScreenRouteArgs({
    this.key,
    required this.groupId,
  });

  final _i35.Key? key;

  final String groupId;

  @override
  String toString() {
    return 'AchievementGroupScreenRouteArgs{key: $key, groupId: $groupId}';
  }
}

/// generated route for
/// [_i4.AchievementsScreen]
class AchievementsScreenRoute extends _i34.PageRouteInfo<void> {
  const AchievementsScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AchievementsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AchievementsScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AppLanguageScreen]
class AppLanguageScreenRoute extends _i34.PageRouteInfo<void> {
  const AppLanguageScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AppLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppLanguageScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AudioLanguageScreen]
class AudioLanguageScreenRoute extends _i34.PageRouteInfo<void> {
  const AudioLanguageScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AudioLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AudioLanguageScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AutoLoginScreen]
class AutoLoginScreenRoute extends _i34.PageRouteInfo<void> {
  const AutoLoginScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AutoLoginScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AutoLoginScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CalendarScreen]
class CalendarScreenRoute extends _i34.PageRouteInfo<void> {
  const CalendarScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          CalendarScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CollectionEpisodeScreen]
class CollectionEpisodeScreenRoute
    extends _i34.PageRouteInfo<CollectionEpisodeScreenRouteArgs> {
  CollectionEpisodeScreenRoute({
    _i36.Key? key,
    required String episodeId,
    bool? autoplay,
    int? queryParamStartPosition,
    bool? hideBottomSection,
    String? collectionId,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          CollectionEpisodeScreenRoute.name,
          args: CollectionEpisodeScreenRouteArgs(
            key: key,
            episodeId: episodeId,
            autoplay: autoplay,
            queryParamStartPosition: queryParamStartPosition,
            hideBottomSection: hideBottomSection,
            collectionId: collectionId,
          ),
          rawPathParams: {
            'episodeId': episodeId,
            'collectionId': collectionId,
          },
          rawQueryParams: {
            'autoplay': autoplay,
            't': queryParamStartPosition,
            'hide_bottom_section': hideBottomSection,
          },
          initialChildren: children,
        );

  static const String name = 'CollectionEpisodeScreenRoute';

  static const _i34.PageInfo<CollectionEpisodeScreenRouteArgs> page =
      _i34.PageInfo<CollectionEpisodeScreenRouteArgs>(name);
}

class CollectionEpisodeScreenRouteArgs {
  const CollectionEpisodeScreenRouteArgs({
    this.key,
    required this.episodeId,
    this.autoplay,
    this.queryParamStartPosition,
    this.hideBottomSection,
    this.collectionId,
  });

  final _i36.Key? key;

  final String episodeId;

  final bool? autoplay;

  final int? queryParamStartPosition;

  final bool? hideBottomSection;

  final String? collectionId;

  @override
  String toString() {
    return 'CollectionEpisodeScreenRouteArgs{key: $key, episodeId: $episodeId, autoplay: $autoplay, queryParamStartPosition: $queryParamStartPosition, hideBottomSection: $hideBottomSection, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i10.ContactPublicScreen]
class ContactPublicScreenRoute extends _i34.PageRouteInfo<void> {
  const ContactPublicScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ContactPublicScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactPublicScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ContactScreen]
class ContactScreenRoute extends _i34.PageRouteInfo<void> {
  const ContactScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ContactScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ContributorScreen]
class ContributorScreenRoute
    extends _i34.PageRouteInfo<ContributorScreenRouteArgs> {
  ContributorScreenRoute({
    _i35.Key? key,
    required String id,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          ContributorScreenRoute.name,
          args: ContributorScreenRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ContributorScreenRoute';

  static const _i34.PageInfo<ContributorScreenRouteArgs> page =
      _i34.PageInfo<ContributorScreenRouteArgs>(name);
}

class ContributorScreenRouteArgs {
  const ContributorScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i35.Key? key;

  final String id;

  @override
  String toString() {
    return 'ContributorScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i13.DeviceInfoScreen]
class DeviceInfoScreenRoute extends _i34.PageRouteInfo<void> {
  const DeviceInfoScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          DeviceInfoScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeviceInfoScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i9.EpisodeScreen]
class EpisodeScreenRoute extends _i34.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({
    _i36.Key? key,
    required String episodeId,
    bool? autoplay,
    int? queryParamStartPosition,
    bool? hideBottomSection,
    String? collectionId,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          EpisodeScreenRoute.name,
          args: EpisodeScreenRouteArgs(
            key: key,
            episodeId: episodeId,
            autoplay: autoplay,
            queryParamStartPosition: queryParamStartPosition,
            hideBottomSection: hideBottomSection,
            collectionId: collectionId,
          ),
          rawPathParams: {'episodeId': episodeId},
          rawQueryParams: {
            'autoplay': autoplay,
            't': queryParamStartPosition,
            'hide_bottom_section': hideBottomSection,
            'collectionId': collectionId,
          },
          initialChildren: children,
        );

  static const String name = 'EpisodeScreenRoute';

  static const _i34.PageInfo<EpisodeScreenRouteArgs> page =
      _i34.PageInfo<EpisodeScreenRouteArgs>(name);
}

class EpisodeScreenRouteArgs {
  const EpisodeScreenRouteArgs({
    this.key,
    required this.episodeId,
    this.autoplay,
    this.queryParamStartPosition,
    this.hideBottomSection,
    this.collectionId,
  });

  final _i36.Key? key;

  final String episodeId;

  final bool? autoplay;

  final int? queryParamStartPosition;

  final bool? hideBottomSection;

  final String? collectionId;

  @override
  String toString() {
    return 'EpisodeScreenRouteArgs{key: $key, episodeId: $episodeId, autoplay: $autoplay, queryParamStartPosition: $queryParamStartPosition, hideBottomSection: $hideBottomSection, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i14.ExtraUsergroupsScreen]
class ExtraUsergroupsScreenRoute extends _i34.PageRouteInfo<void> {
  const ExtraUsergroupsScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ExtraUsergroupsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExtraUsergroupsScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i15.FAQScreen]
class FAQScreenRoute extends _i34.PageRouteInfo<void> {
  const FAQScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          FAQScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i16.HomeScreen]
class HomeScreenRoute extends _i34.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i34.PageInfo<HomeScreenRouteArgs> page =
      _i34.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.HomeWrapperScreen]
class HomeWrapperScreenRoute extends _i34.PageRouteInfo<void> {
  const HomeWrapperScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          HomeWrapperScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeWrapperScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i18.LiveScreen]
class LiveScreenRoute extends _i34.PageRouteInfo<void> {
  const LiveScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          LiveScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LiveScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i19.OnboardingScreen]
class OnboardingScreenRoute
    extends _i34.PageRouteInfo<OnboardingScreenRouteArgs> {
  OnboardingScreenRoute({
    _i36.Key? key,
    String? loginError,
    bool auto = false,
    List<_i34.PageRouteInfo>? children,
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

  static const _i34.PageInfo<OnboardingScreenRouteArgs> page =
      _i34.PageInfo<OnboardingScreenRouteArgs>(name);
}

class OnboardingScreenRouteArgs {
  const OnboardingScreenRouteArgs({
    this.key,
    this.loginError,
    this.auto = false,
  });

  final _i36.Key? key;

  final String? loginError;

  final bool auto;

  @override
  String toString() {
    return 'OnboardingScreenRouteArgs{key: $key, loginError: $loginError, auto: $auto}';
  }
}

/// generated route for
/// [_i20.PageScreen]
class PageScreenRoute extends _i34.PageRouteInfo<PageScreenRouteArgs> {
  PageScreenRoute({
    _i36.Key? key,
    required String pageCode,
    List<_i34.PageRouteInfo>? children,
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

  static const _i34.PageInfo<PageScreenRouteArgs> page =
      _i34.PageInfo<PageScreenRouteArgs>(name);
}

class PageScreenRouteArgs {
  const PageScreenRouteArgs({
    this.key,
    required this.pageCode,
  });

  final _i36.Key? key;

  final String pageCode;

  @override
  String toString() {
    return 'PageScreenRouteArgs{key: $key, pageCode: $pageCode}';
  }
}

/// generated route for
/// [_i21.PrivacyPolicyScreen]
class PrivacyPolicyScreenRoute extends _i34.PageRouteInfo<void> {
  const PrivacyPolicyScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          PrivacyPolicyScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ProfileScreen]
class ProfileScreenRoute extends _i34.PageRouteInfo<ProfileScreenRouteArgs> {
  ProfileScreenRoute({
    _i35.Key? key,
    String? scroll,
    List<_i34.PageRouteInfo>? children,
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

  static const _i34.PageInfo<ProfileScreenRouteArgs> page =
      _i34.PageInfo<ProfileScreenRouteArgs>(name);
}

class ProfileScreenRouteArgs {
  const ProfileScreenRouteArgs({
    this.key,
    this.scroll,
  });

  final _i35.Key? key;

  final String? scroll;

  @override
  String toString() {
    return 'ProfileScreenRouteArgs{key: $key, scroll: $scroll}';
  }
}

/// generated route for
/// [_i17.ProfileWrapperScreen]
class ProfileWrapperScreenRoute extends _i34.PageRouteInfo<void> {
  const ProfileWrapperScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ProfileWrapperScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileWrapperScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SearchScreen]
class SearchScreenRoute extends _i34.PageRouteInfo<SearchScreenRouteArgs> {
  SearchScreenRoute({
    _i36.Key? key,
    String? query,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          SearchScreenRoute.name,
          args: SearchScreenRouteArgs(
            key: key,
            query: query,
          ),
          rawQueryParams: {'q': query},
          initialChildren: children,
        );

  static const String name = 'SearchScreenRoute';

  static const _i34.PageInfo<SearchScreenRouteArgs> page =
      _i34.PageInfo<SearchScreenRouteArgs>(name);
}

class SearchScreenRouteArgs {
  const SearchScreenRouteArgs({
    this.key,
    this.query,
  });

  final _i36.Key? key;

  final String? query;

  @override
  String toString() {
    return 'SearchScreenRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i17.SearchWrapperScreen]
class SearchWrapperScreenRoute extends _i34.PageRouteInfo<void> {
  const SearchWrapperScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          SearchWrapperScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchWrapperScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i24.SettingsScreen]
class SettingsScreenRoute extends _i34.PageRouteInfo<void> {
  const SettingsScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          SettingsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ShortScreen]
class ShortScreenRoute extends _i34.PageRouteInfo<ShortScreenRouteArgs> {
  ShortScreenRoute({
    _i35.Key? key,
    required String id,
    List<_i34.PageRouteInfo>? children,
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

  static const _i34.PageInfo<ShortScreenRouteArgs> page =
      _i34.PageInfo<ShortScreenRouteArgs>(name);
}

class ShortScreenRouteArgs {
  const ShortScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i35.Key? key;

  final String id;

  @override
  String toString() {
    return 'ShortScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i26.ShortsScreen]
class ShortsScreenRoute extends _i34.PageRouteInfo<ShortsScreenRouteArgs> {
  ShortsScreenRoute({
    _i35.Key? key,
    bool preventScroll = false,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          ShortsScreenRoute.name,
          args: ShortsScreenRouteArgs(
            key: key,
            preventScroll: preventScroll,
          ),
          initialChildren: children,
        );

  static const String name = 'ShortsScreenRoute';

  static const _i34.PageInfo<ShortsScreenRouteArgs> page =
      _i34.PageInfo<ShortsScreenRouteArgs>(name);
}

class ShortsScreenRouteArgs {
  const ShortsScreenRouteArgs({
    this.key,
    this.preventScroll = false,
  });

  final _i35.Key? key;

  final bool preventScroll;

  @override
  String toString() {
    return 'ShortsScreenRouteArgs{key: $key, preventScroll: $preventScroll}';
  }
}

/// generated route for
/// [_i17.ShortsWrapperScreen]
class ShortsWrapperScreenRoute extends _i34.PageRouteInfo<void> {
  const ShortsWrapperScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ShortsWrapperScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShortsWrapperScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i27.SignupScreen]
class SignupScreenRoute extends _i34.PageRouteInfo<void> {
  const SignupScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          SignupScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i28.StudyScreen]
class StudyScreenRoute extends _i34.PageRouteInfo<StudyScreenRouteArgs> {
  StudyScreenRoute({
    _i36.Key? key,
    required String episodeId,
    required String lessonId,
    List<_i34.PageRouteInfo>? children,
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

  static const _i34.PageInfo<StudyScreenRouteArgs> page =
      _i34.PageInfo<StudyScreenRouteArgs>(name);
}

class StudyScreenRouteArgs {
  const StudyScreenRouteArgs({
    this.key,
    required this.episodeId,
    required this.lessonId,
  });

  final _i36.Key? key;

  final String episodeId;

  final String lessonId;

  @override
  String toString() {
    return 'StudyScreenRouteArgs{key: $key, episodeId: $episodeId, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i29.SubtitleLanguageScreen]
class SubtitleLanguageScreenRoute extends _i34.PageRouteInfo<void> {
  const SubtitleLanguageScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          SubtitleLanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubtitleLanguageScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i30.TabsRootScreen]
class TabsRootScreenRoute extends _i34.PageRouteInfo<void> {
  const TabsRootScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          TabsRootScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabsRootScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i17.TabsWrapperScreen]
class TabsWrapperScreenRoute extends _i34.PageRouteInfo<void> {
  const TabsWrapperScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          TabsWrapperScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabsWrapperScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i31.TermsOfUseScreen]
class TermsOfUseScreenRoute extends _i34.PageRouteInfo<void> {
  const TermsOfUseScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          TermsOfUseScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i32.VideoQualityScreen]
class VideoQualityScreenRoute extends _i34.PageRouteInfo<void> {
  const VideoQualityScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          VideoQualityScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'VideoQualityScreenRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i33.WebviewScreen]
class WebviewScreenRoute extends _i34.PageRouteInfo<WebviewScreenRouteArgs> {
  WebviewScreenRoute({
    _i36.Key? key,
    required String redirectCode,
    List<_i34.PageRouteInfo>? children,
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

  static const _i34.PageInfo<WebviewScreenRouteArgs> page =
      _i34.PageInfo<WebviewScreenRouteArgs>(name);
}

class WebviewScreenRouteArgs {
  const WebviewScreenRouteArgs({
    this.key,
    required this.redirectCode,
  });

  final _i36.Key? key;

  final String redirectCode;

  @override
  String toString() {
    return 'WebviewScreenRouteArgs{key: $key, redirectCode: $redirectCode}';
  }
}
