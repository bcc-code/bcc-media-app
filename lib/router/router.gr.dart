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
import 'package:auto_route/auto_route.dart' as _i31;
import 'package:auto_route/empty_router_widgets.dart' as _i24;
import 'package:flutter/foundation.dart' as _i35;
import 'package:flutter/material.dart' as _i32;

import '../helpers/navigation/custom_transitions.dart' as _i34;
import '../screens/achievement_group.dart' as _i21;
import '../screens/achievements.dart' as _i20;
import '../screens/auto_login.dart' as _i1;
import '../screens/calendar.dart' as _i25;
import '../screens/episode.dart' as _i17;
import '../screens/extra_usergroups.dart' as _i18;
import '../screens/games/game.dart' as _i28;
import '../screens/games/games.dart' as _i30;
import '../screens/home.dart' as _i16;
import '../screens/live.dart' as _i23;
import '../screens/my_list.dart' as _i29;
import '../screens/onboarding/onboarding.dart' as _i2;
import '../screens/onboarding/signup.dart' as _i3;
import '../screens/page.dart' as _i27;
import '../screens/profile/about.dart' as _i12;
import '../screens/profile/account_deletion.dart' as _i15;
import '../screens/profile/app_language.dart' as _i5;
import '../screens/profile/audio_language.dart' as _i6;
import '../screens/profile/contact.dart' as _i9;
import '../screens/profile/contact_public.dart' as _i10;
import '../screens/profile/device_info.dart' as _i11;
import '../screens/profile/faq.dart' as _i13;
import '../screens/profile/privacy_policy.dart' as _i14;
import '../screens/profile/profile.dart' as _i4;
import '../screens/profile/subtitle_language.dart' as _i7;
import '../screens/profile/video_quality.dart' as _i8;
import '../screens/search.dart' as _i26;
import '../screens/study.dart' as _i19;
import '../screens/tabs_root.dart' as _i22;
import 'router.dart' as _i33;

class AppRouter extends _i31.RootStackRouter {
  AppRouter([_i32.GlobalKey<_i32.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i31.PageFactory> pagesMap = {
    AutoLoginScreenRoute.name: (routeData) {
      return _i31.MaterialPageX<void>(
        routeData: routeData,
        child: const _i1.AutoLoginScreen(),
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
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: _i2.OnboardingScreen(
          key: args.key,
          loginError: args.loginError,
          onResult: args.onResult,
          auto: args.auto,
        ),
        customRouteBuilder: _i33.profileRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignupScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i3.SignupScreen(),
        customRouteBuilder: _i33.modalSheetBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: false,
        barrierDismissible: false,
      );
    },
    AppLanguageScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i5.AppLanguageScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AudioLanguageScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i6.AudioLanguageScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SubtitleLanguageScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i7.SubtitleLanguageScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VideoQualityScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i8.VideoQualityScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i9.ContactScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactPublicScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i10.ContactPublicScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DeviceInfoScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i11.DeviceInfoScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AboutScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i12.AboutScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FAQScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i13.FAQScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PrivacyPolicyScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i14.PrivacyPolicyScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AccountDeletionScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i15.AccountDeletionScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PublicHomeRoute.name: (routeData) {
      final args = routeData.argsAs<PublicHomeRouteArgs>(
          orElse: () => const PublicHomeRouteArgs());
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: _i16.HomeScreen(key: args.key),
        maintainState: false,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EmbedScreen.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<EmbedScreenArgs>(
          orElse: () => EmbedScreenArgs(
                episodeId: pathParams.getString('episodeId'),
                autoplay: queryParams.optBool('autoplay'),
                queryParamStartPosition: queryParams.optInt('t'),
                hideBottomSection: queryParams.optBool('hide_bottom_section'),
                collectionId: queryParams.optString('collectionId'),
              ));
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: _i17.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
          collectionId: args.collectionId,
        ),
        transitionsBuilder: _i34.CustomTransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ExtraUsergroupsScreen.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i18.ExtraUsergroupsScreen(),
        customRouteBuilder: _i33.profileRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    StudyScreenRoute.name: (routeData) {
      final args = routeData.argsAs<StudyScreenRouteArgs>();
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: _i19.StudyScreen(
          key: args.key,
          episodeId: args.episodeId,
          lessonId: args.lessonId,
        ),
        transitionsBuilder: _i34.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AchievementsScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i20.AchievementsScreen(),
        transitionsBuilder: _i34.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AchievementGroupScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AchievementGroupScreenRouteArgs>(
          orElse: () => AchievementGroupScreenRouteArgs(
              groupId: pathParams.getString('groupId')));
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: _i21.AchievementGroupScreen(
          key: args.key,
          groupId: args.groupId,
        ),
        transitionsBuilder: _i34.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TabsRootScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i22.TabsRootScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LiveScreenRoute.name: (routeData) {
      return _i31.MaterialPageX<void>(
        routeData: routeData,
        child: const _i23.LiveScreen(),
      );
    },
    SearchScreenWrapperRoute.name: (routeData) {
      return _i31.MaterialPageX<void>(
        routeData: routeData,
        child: const _i24.EmptyRouterPage(),
      );
    },
    CalendarPageRoute.name: (routeData) {
      return _i31.MaterialPageX<void>(
        routeData: routeData,
        child: const _i25.CalendarPage(),
      );
    },
    MyListScreenWrapperRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i24.EmptyRouterPage(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GamesWrapperRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i24.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeScreenWrapperRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i24.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SearchScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<SearchScreenRouteArgs>(
          orElse: () =>
              SearchScreenRouteArgs(query: queryParams.optString('q')));
      return _i31.MaterialPageX<void>(
        routeData: routeData,
        child: _i26.SearchScreen(
          key: args.key,
          query: args.query,
        ),
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
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: _i17.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
          collectionId: args.collectionId,
        ),
        transitionsBuilder: _i34.CustomTransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
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
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: _i17.CollectionEpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
          collectionId: args.collectionId,
        ),
        transitionsBuilder: _i34.CustomTransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PageScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PageScreenRouteArgs>(
          orElse: () =>
              PageScreenRouteArgs(pageCode: pathParams.getString('pageCode')));
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: _i27.PageScreen(
          key: args.key,
          pageCode: args.pageCode,
        ),
        transitionsBuilder: _i34.CustomTransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GameScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<GameScreenRouteArgs>(
          orElse: () =>
              GameScreenRouteArgs(gameId: pathParams.getString('gameId')));
      return _i31.CupertinoPageX<void>(
        routeData: routeData,
        child: _i28.GameScreen(
          key: args.key,
          gameId: args.gameId,
        ),
        maintainState: false,
      );
    },
    MyListScreenRoute.name: (routeData) {
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: const _i29.MyListScreen(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GamesScreenRoute.name: (routeData) {
      return _i31.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i30.GamesScreen(),
      );
    },
    Home.name: (routeData) {
      final args = routeData.argsAs<HomeArgs>(orElse: () => const HomeArgs());
      return _i31.CustomPage<void>(
        routeData: routeData,
        child: _i16.HomeScreen(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i31.RouteConfig> get routes => [
        _i31.RouteConfig(
          AutoLoginScreenRoute.name,
          path: '/auto-login',
        ),
        _i31.RouteConfig(
          OnboardingScreenRoute.name,
          path: '/login',
          meta: <String, dynamic>{'analytics_name': 'login'},
        ),
        _i31.RouteConfig(
          SignupScreenRoute.name,
          path: 'signup',
          meta: <String, dynamic>{'analytics_name': 'signup'},
        ),
        _i31.RouteConfig(
          ProfileScreenRoute.name,
          path: '/profile',
          meta: <String, dynamic>{'analytics_name': 'profile'},
        ),
        _i31.RouteConfig(
          AppLanguageScreenRoute.name,
          path: '/app-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'appLanguage',
          },
        ),
        _i31.RouteConfig(
          AudioLanguageScreenRoute.name,
          path: '/audio-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'audioLanguage',
          },
        ),
        _i31.RouteConfig(
          SubtitleLanguageScreenRoute.name,
          path: '/subtitle-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'subtitlesLanguage',
          },
        ),
        _i31.RouteConfig(
          VideoQualityScreenRoute.name,
          path: '/video-quality',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'videoQuality',
          },
        ),
        _i31.RouteConfig(
          ContactScreenRoute.name,
          path: '/contact-support',
          meta: <String, dynamic>{'analytics_name': 'support'},
        ),
        _i31.RouteConfig(
          ContactPublicScreenRoute.name,
          path: '/contact-support-public',
          meta: <String, dynamic>{'analytics_name': 'support'},
        ),
        _i31.RouteConfig(
          DeviceInfoScreenRoute.name,
          path: '/device-info',
          meta: <String, dynamic>{'analytics_name': 'support'},
        ),
        _i31.RouteConfig(
          AboutScreenRoute.name,
          path: '/about',
          meta: <String, dynamic>{'analytics_name': 'about'},
        ),
        _i31.RouteConfig(
          FAQScreenRoute.name,
          path: '/faq',
          meta: <String, dynamic>{'analytics_name': 'faq'},
        ),
        _i31.RouteConfig(
          PrivacyPolicyScreenRoute.name,
          path: '/privacy-policy',
          meta: <String, dynamic>{'analytics_name': 'privacy-policy'},
        ),
        _i31.RouteConfig(
          AccountDeletionScreenRoute.name,
          path: '/account-deletion',
          meta: <String, dynamic>{'analytics_name': 'account-deletion'},
        ),
        _i31.RouteConfig(
          PublicHomeRoute.name,
          path: '/public-home',
        ),
        _i31.RouteConfig(
          EmbedScreen.name,
          path: '/embed/:episodeId',
          meta: <String, dynamic>{'analytics_name': 'episode'},
        ),
        _i31.RouteConfig(
          ExtraUsergroupsScreen.name,
          path: '/extra-usergroups',
          meta: <String, dynamic>{'analytics_name': 'extra-usergroups'},
        ),
        _i31.RouteConfig(
          StudyScreenRoute.name,
          path: 'study-lesson',
          meta: <String, dynamic>{'analytics_name': 'study-lesson'},
        ),
        _i31.RouteConfig(
          AchievementsScreenRoute.name,
          path: '/achievements',
          meta: <String, dynamic>{'analytics_name': 'achievements'},
        ),
        _i31.RouteConfig(
          AchievementGroupScreenRoute.name,
          path: '/achievement-group/:groupId',
          meta: <String, dynamic>{'analytics_name': 'achievement-group'},
        ),
        _i31.RouteConfig(
          TabsRootScreenRoute.name,
          path: '/',
          children: [
            _i31.RouteConfig(
              LiveScreenRoute.name,
              path: 'live',
              parent: TabsRootScreenRoute.name,
              meta: <String, dynamic>{
                'hide_mini_player': true,
                'nav_tab_route': true,
                'analytics_name': 'livestream',
              },
            ),
            _i31.RouteConfig(
              SearchScreenWrapperRoute.name,
              path: 'search',
              parent: TabsRootScreenRoute.name,
              children: [
                _i31.RouteConfig(
                  SearchScreenRoute.name,
                  path: '',
                  parent: SearchScreenWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i31.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: SearchScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i31.RouteConfig(
                  CollectionEpisodeScreenRoute.name,
                  path: 'episode/:collectionId/:episodeId',
                  parent: SearchScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i31.RouteConfig(
                  PageScreenRoute.name,
                  path: ':pageCode',
                  parent: SearchScreenWrapperRoute.name,
                  usesPathAsKey: true,
                ),
                _i31.RouteConfig(
                  GameScreenRoute.name,
                  path: ':gameId',
                  parent: SearchScreenWrapperRoute.name,
                ),
              ],
            ),
            _i31.RouteConfig(
              CalendarPageRoute.name,
              path: 'calendar',
              parent: TabsRootScreenRoute.name,
              meta: <String, dynamic>{
                'nav_tab_route': true,
                'analytics_name': 'calendar',
              },
            ),
            _i31.RouteConfig(
              MyListScreenWrapperRoute.name,
              path: 'my-list',
              parent: TabsRootScreenRoute.name,
              children: [
                _i31.RouteConfig(
                  MyListScreenRoute.name,
                  path: '',
                  parent: MyListScreenWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i31.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: MyListScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i31.RouteConfig(
                  CollectionEpisodeScreenRoute.name,
                  path: 'episode/:collectionId/:episodeId',
                  parent: MyListScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
              ],
            ),
            _i31.RouteConfig(
              GamesWrapperRoute.name,
              path: 'games',
              parent: TabsRootScreenRoute.name,
              children: [
                _i31.RouteConfig(
                  GamesScreenRoute.name,
                  path: '',
                  parent: GamesWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i31.RouteConfig(
                  GameScreenRoute.name,
                  path: ':gameId',
                  parent: GamesWrapperRoute.name,
                ),
              ],
            ),
            _i31.RouteConfig(
              HomeScreenWrapperRoute.name,
              path: '',
              parent: TabsRootScreenRoute.name,
              children: [
                _i31.RouteConfig(
                  Home.name,
                  path: '',
                  parent: HomeScreenWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i31.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: HomeScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i31.RouteConfig(
                  CollectionEpisodeScreenRoute.name,
                  path: 'episode/:collectionId/:episodeId',
                  parent: HomeScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i31.RouteConfig(
                  PageScreenRoute.name,
                  path: ':pageCode',
                  parent: HomeScreenWrapperRoute.name,
                  usesPathAsKey: true,
                ),
                _i31.RouteConfig(
                  GameScreenRoute.name,
                  path: ':gameId',
                  parent: HomeScreenWrapperRoute.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.AutoLoginScreen]
class AutoLoginScreenRoute extends _i31.PageRouteInfo<void> {
  const AutoLoginScreenRoute()
      : super(
          AutoLoginScreenRoute.name,
          path: '/auto-login',
        );

  static const String name = 'AutoLoginScreenRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingScreenRoute
    extends _i31.PageRouteInfo<OnboardingScreenRouteArgs> {
  OnboardingScreenRoute({
    _i35.Key? key,
    String? loginError,
    void Function(bool)? onResult,
    bool auto = false,
  }) : super(
          OnboardingScreenRoute.name,
          path: '/login',
          args: OnboardingScreenRouteArgs(
            key: key,
            loginError: loginError,
            onResult: onResult,
            auto: auto,
          ),
          rawQueryParams: {'auto': auto},
        );

  static const String name = 'OnboardingScreenRoute';
}

class OnboardingScreenRouteArgs {
  const OnboardingScreenRouteArgs({
    this.key,
    this.loginError,
    this.onResult,
    this.auto = false,
  });

  final _i35.Key? key;

  final String? loginError;

  final void Function(bool)? onResult;

  final bool auto;

  @override
  String toString() {
    return 'OnboardingScreenRouteArgs{key: $key, loginError: $loginError, onResult: $onResult, auto: $auto}';
  }
}

/// generated route for
/// [_i3.SignupScreen]
class SignupScreenRoute extends _i31.PageRouteInfo<void> {
  const SignupScreenRoute()
      : super(
          SignupScreenRoute.name,
          path: 'signup',
        );

  static const String name = 'SignupScreenRoute';
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileScreenRoute extends _i31.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i5.AppLanguageScreen]
class AppLanguageScreenRoute extends _i31.PageRouteInfo<void> {
  const AppLanguageScreenRoute()
      : super(
          AppLanguageScreenRoute.name,
          path: '/app-language',
        );

  static const String name = 'AppLanguageScreenRoute';
}

/// generated route for
/// [_i6.AudioLanguageScreen]
class AudioLanguageScreenRoute extends _i31.PageRouteInfo<void> {
  const AudioLanguageScreenRoute()
      : super(
          AudioLanguageScreenRoute.name,
          path: '/audio-language',
        );

  static const String name = 'AudioLanguageScreenRoute';
}

/// generated route for
/// [_i7.SubtitleLanguageScreen]
class SubtitleLanguageScreenRoute extends _i31.PageRouteInfo<void> {
  const SubtitleLanguageScreenRoute()
      : super(
          SubtitleLanguageScreenRoute.name,
          path: '/subtitle-language',
        );

  static const String name = 'SubtitleLanguageScreenRoute';
}

/// generated route for
/// [_i8.VideoQualityScreen]
class VideoQualityScreenRoute extends _i31.PageRouteInfo<void> {
  const VideoQualityScreenRoute()
      : super(
          VideoQualityScreenRoute.name,
          path: '/video-quality',
        );

  static const String name = 'VideoQualityScreenRoute';
}

/// generated route for
/// [_i9.ContactScreen]
class ContactScreenRoute extends _i31.PageRouteInfo<void> {
  const ContactScreenRoute()
      : super(
          ContactScreenRoute.name,
          path: '/contact-support',
        );

  static const String name = 'ContactScreenRoute';
}

/// generated route for
/// [_i10.ContactPublicScreen]
class ContactPublicScreenRoute extends _i31.PageRouteInfo<void> {
  const ContactPublicScreenRoute()
      : super(
          ContactPublicScreenRoute.name,
          path: '/contact-support-public',
        );

  static const String name = 'ContactPublicScreenRoute';
}

/// generated route for
/// [_i11.DeviceInfoScreen]
class DeviceInfoScreenRoute extends _i31.PageRouteInfo<void> {
  const DeviceInfoScreenRoute()
      : super(
          DeviceInfoScreenRoute.name,
          path: '/device-info',
        );

  static const String name = 'DeviceInfoScreenRoute';
}

/// generated route for
/// [_i12.AboutScreen]
class AboutScreenRoute extends _i31.PageRouteInfo<void> {
  const AboutScreenRoute()
      : super(
          AboutScreenRoute.name,
          path: '/about',
        );

  static const String name = 'AboutScreenRoute';
}

/// generated route for
/// [_i13.FAQScreen]
class FAQScreenRoute extends _i31.PageRouteInfo<void> {
  const FAQScreenRoute()
      : super(
          FAQScreenRoute.name,
          path: '/faq',
        );

  static const String name = 'FAQScreenRoute';
}

/// generated route for
/// [_i14.PrivacyPolicyScreen]
class PrivacyPolicyScreenRoute extends _i31.PageRouteInfo<void> {
  const PrivacyPolicyScreenRoute()
      : super(
          PrivacyPolicyScreenRoute.name,
          path: '/privacy-policy',
        );

  static const String name = 'PrivacyPolicyScreenRoute';
}

/// generated route for
/// [_i15.AccountDeletionScreen]
class AccountDeletionScreenRoute extends _i31.PageRouteInfo<void> {
  const AccountDeletionScreenRoute()
      : super(
          AccountDeletionScreenRoute.name,
          path: '/account-deletion',
        );

  static const String name = 'AccountDeletionScreenRoute';
}

/// generated route for
/// [_i16.HomeScreen]
class PublicHomeRoute extends _i31.PageRouteInfo<PublicHomeRouteArgs> {
  PublicHomeRoute({_i35.Key? key})
      : super(
          PublicHomeRoute.name,
          path: '/public-home',
          args: PublicHomeRouteArgs(key: key),
        );

  static const String name = 'PublicHomeRoute';
}

class PublicHomeRouteArgs {
  const PublicHomeRouteArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'PublicHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.EpisodeScreen]
class EmbedScreen extends _i31.PageRouteInfo<EmbedScreenArgs> {
  EmbedScreen({
    _i35.Key? key,
    required String episodeId,
    bool? autoplay,
    int? queryParamStartPosition,
    bool? hideBottomSection,
    String? collectionId,
  }) : super(
          EmbedScreen.name,
          path: '/embed/:episodeId',
          args: EmbedScreenArgs(
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
        );

  static const String name = 'EmbedScreen';
}

class EmbedScreenArgs {
  const EmbedScreenArgs({
    this.key,
    required this.episodeId,
    this.autoplay,
    this.queryParamStartPosition,
    this.hideBottomSection,
    this.collectionId,
  });

  final _i35.Key? key;

  final String episodeId;

  final bool? autoplay;

  final int? queryParamStartPosition;

  final bool? hideBottomSection;

  final String? collectionId;

  @override
  String toString() {
    return 'EmbedScreenArgs{key: $key, episodeId: $episodeId, autoplay: $autoplay, queryParamStartPosition: $queryParamStartPosition, hideBottomSection: $hideBottomSection, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i18.ExtraUsergroupsScreen]
class ExtraUsergroupsScreen extends _i31.PageRouteInfo<void> {
  const ExtraUsergroupsScreen()
      : super(
          ExtraUsergroupsScreen.name,
          path: '/extra-usergroups',
        );

  static const String name = 'ExtraUsergroupsScreen';
}

/// generated route for
/// [_i19.StudyScreen]
class StudyScreenRoute extends _i31.PageRouteInfo<StudyScreenRouteArgs> {
  StudyScreenRoute({
    _i35.Key? key,
    required String episodeId,
    required String lessonId,
  }) : super(
          StudyScreenRoute.name,
          path: 'study-lesson',
          args: StudyScreenRouteArgs(
            key: key,
            episodeId: episodeId,
            lessonId: lessonId,
          ),
        );

  static const String name = 'StudyScreenRoute';
}

class StudyScreenRouteArgs {
  const StudyScreenRouteArgs({
    this.key,
    required this.episodeId,
    required this.lessonId,
  });

  final _i35.Key? key;

  final String episodeId;

  final String lessonId;

  @override
  String toString() {
    return 'StudyScreenRouteArgs{key: $key, episodeId: $episodeId, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i20.AchievementsScreen]
class AchievementsScreenRoute extends _i31.PageRouteInfo<void> {
  const AchievementsScreenRoute()
      : super(
          AchievementsScreenRoute.name,
          path: '/achievements',
        );

  static const String name = 'AchievementsScreenRoute';
}

/// generated route for
/// [_i21.AchievementGroupScreen]
class AchievementGroupScreenRoute
    extends _i31.PageRouteInfo<AchievementGroupScreenRouteArgs> {
  AchievementGroupScreenRoute({
    _i35.Key? key,
    required String groupId,
  }) : super(
          AchievementGroupScreenRoute.name,
          path: '/achievement-group/:groupId',
          args: AchievementGroupScreenRouteArgs(
            key: key,
            groupId: groupId,
          ),
          rawPathParams: {'groupId': groupId},
        );

  static const String name = 'AchievementGroupScreenRoute';
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
/// [_i22.TabsRootScreen]
class TabsRootScreenRoute extends _i31.PageRouteInfo<void> {
  const TabsRootScreenRoute({List<_i31.PageRouteInfo>? children})
      : super(
          TabsRootScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'TabsRootScreenRoute';
}

/// generated route for
/// [_i23.LiveScreen]
class LiveScreenRoute extends _i31.PageRouteInfo<void> {
  const LiveScreenRoute()
      : super(
          LiveScreenRoute.name,
          path: 'live',
        );

  static const String name = 'LiveScreenRoute';
}

/// generated route for
/// [_i24.EmptyRouterPage]
class SearchScreenWrapperRoute extends _i31.PageRouteInfo<void> {
  const SearchScreenWrapperRoute({List<_i31.PageRouteInfo>? children})
      : super(
          SearchScreenWrapperRoute.name,
          path: 'search',
          initialChildren: children,
        );

  static const String name = 'SearchScreenWrapperRoute';
}

/// generated route for
/// [_i25.CalendarPage]
class CalendarPageRoute extends _i31.PageRouteInfo<void> {
  const CalendarPageRoute()
      : super(
          CalendarPageRoute.name,
          path: 'calendar',
        );

  static const String name = 'CalendarPageRoute';
}

/// generated route for
/// [_i24.EmptyRouterPage]
class MyListScreenWrapperRoute extends _i31.PageRouteInfo<void> {
  const MyListScreenWrapperRoute({List<_i31.PageRouteInfo>? children})
      : super(
          MyListScreenWrapperRoute.name,
          path: 'my-list',
          initialChildren: children,
        );

  static const String name = 'MyListScreenWrapperRoute';
}

/// generated route for
/// [_i24.EmptyRouterPage]
class GamesWrapperRoute extends _i31.PageRouteInfo<void> {
  const GamesWrapperRoute({List<_i31.PageRouteInfo>? children})
      : super(
          GamesWrapperRoute.name,
          path: 'games',
          initialChildren: children,
        );

  static const String name = 'GamesWrapperRoute';
}

/// generated route for
/// [_i24.EmptyRouterPage]
class HomeScreenWrapperRoute extends _i31.PageRouteInfo<void> {
  const HomeScreenWrapperRoute({List<_i31.PageRouteInfo>? children})
      : super(
          HomeScreenWrapperRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'HomeScreenWrapperRoute';
}

/// generated route for
/// [_i26.SearchScreen]
class SearchScreenRoute extends _i31.PageRouteInfo<SearchScreenRouteArgs> {
  SearchScreenRoute({
    _i35.Key? key,
    String? query,
  }) : super(
          SearchScreenRoute.name,
          path: '',
          args: SearchScreenRouteArgs(
            key: key,
            query: query,
          ),
          rawQueryParams: {'q': query},
        );

  static const String name = 'SearchScreenRoute';
}

class SearchScreenRouteArgs {
  const SearchScreenRouteArgs({
    this.key,
    this.query,
  });

  final _i35.Key? key;

  final String? query;

  @override
  String toString() {
    return 'SearchScreenRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i17.EpisodeScreen]
class EpisodeScreenRoute extends _i31.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({
    _i35.Key? key,
    required String episodeId,
    bool? autoplay,
    int? queryParamStartPosition,
    bool? hideBottomSection,
    String? collectionId,
  }) : super(
          EpisodeScreenRoute.name,
          path: 'episode/:episodeId',
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
        );

  static const String name = 'EpisodeScreenRoute';
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

  final _i35.Key? key;

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
/// [_i17.CollectionEpisodeScreen]
class CollectionEpisodeScreenRoute
    extends _i31.PageRouteInfo<CollectionEpisodeScreenRouteArgs> {
  CollectionEpisodeScreenRoute({
    _i35.Key? key,
    required String episodeId,
    bool? autoplay,
    int? queryParamStartPosition,
    bool? hideBottomSection,
    String? collectionId,
  }) : super(
          CollectionEpisodeScreenRoute.name,
          path: 'episode/:collectionId/:episodeId',
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
        );

  static const String name = 'CollectionEpisodeScreenRoute';
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

  final _i35.Key? key;

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
/// [_i27.PageScreen]
class PageScreenRoute extends _i31.PageRouteInfo<PageScreenRouteArgs> {
  PageScreenRoute({
    _i35.Key? key,
    required String pageCode,
  }) : super(
          PageScreenRoute.name,
          path: ':pageCode',
          args: PageScreenRouteArgs(
            key: key,
            pageCode: pageCode,
          ),
          rawPathParams: {'pageCode': pageCode},
        );

  static const String name = 'PageScreenRoute';
}

class PageScreenRouteArgs {
  const PageScreenRouteArgs({
    this.key,
    required this.pageCode,
  });

  final _i35.Key? key;

  final String pageCode;

  @override
  String toString() {
    return 'PageScreenRouteArgs{key: $key, pageCode: $pageCode}';
  }
}

/// generated route for
/// [_i28.GameScreen]
class GameScreenRoute extends _i31.PageRouteInfo<GameScreenRouteArgs> {
  GameScreenRoute({
    _i35.Key? key,
    required String gameId,
  }) : super(
          GameScreenRoute.name,
          path: ':gameId',
          args: GameScreenRouteArgs(
            key: key,
            gameId: gameId,
          ),
          rawPathParams: {'gameId': gameId},
        );

  static const String name = 'GameScreenRoute';
}

class GameScreenRouteArgs {
  const GameScreenRouteArgs({
    this.key,
    required this.gameId,
  });

  final _i35.Key? key;

  final String gameId;

  @override
  String toString() {
    return 'GameScreenRouteArgs{key: $key, gameId: $gameId}';
  }
}

/// generated route for
/// [_i29.MyListScreen]
class MyListScreenRoute extends _i31.PageRouteInfo<void> {
  const MyListScreenRoute()
      : super(
          MyListScreenRoute.name,
          path: '',
        );

  static const String name = 'MyListScreenRoute';
}

/// generated route for
/// [_i30.GamesScreen]
class GamesScreenRoute extends _i31.PageRouteInfo<void> {
  const GamesScreenRoute()
      : super(
          GamesScreenRoute.name,
          path: '',
        );

  static const String name = 'GamesScreenRoute';
}

/// generated route for
/// [_i16.HomeScreen]
class Home extends _i31.PageRouteInfo<HomeArgs> {
  Home({_i35.Key? key})
      : super(
          Home.name,
          path: '',
          args: HomeArgs(key: key),
        );

  static const String name = 'Home';
}

class HomeArgs {
  const HomeArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'HomeArgs{key: $key}';
  }
}
