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
import 'package:auto_route/auto_route.dart' as _i34;
import 'package:auto_route/empty_router_widgets.dart' as _i28;
import 'package:flutter/foundation.dart' as _i38;
import 'package:flutter/material.dart' as _i35;

import '../helpers/router/custom_transitions.dart' as _i37;
import '../screens/auto_login.dart' as _i1;
import '../screens/episode.dart' as _i20;
import '../screens/games/game.dart' as _i22;
import '../screens/games/games.dart' as _i33;
import '../screens/onboarding/onboarding.dart' as _i4;
import '../screens/onboarding/signup.dart' as _i5;
import '../screens/page.dart' as _i31;
import '../screens/settings/about.dart' as _i14;
import '../screens/settings/account_deletion.dart' as _i18;
import '../screens/settings/app_language.dart' as _i7;
import '../screens/settings/audio_language.dart' as _i8;
import '../screens/settings/contact.dart' as _i11;
import '../screens/settings/contact_public.dart' as _i12;
import '../screens/settings/device_info.dart' as _i13;
import '../screens/settings/extra_usergroups.dart' as _i21;
import '../screens/settings/faq.dart' as _i15;
import '../screens/settings/privacy_policy.dart' as _i16;
import '../screens/settings/settings.dart' as _i6;
import '../screens/settings/subtitle_language.dart' as _i9;
import '../screens/settings/terms_of_use.dart' as _i17;
import '../screens/settings/video_quality.dart' as _i10;
import '../screens/study/achievement_group.dart' as _i25;
import '../screens/study/achievements.dart' as _i24;
import '../screens/study/study.dart' as _i23;
import '../screens/tabs/calendar.dart' as _i29;
import '../screens/tabs/home.dart' as _i19;
import '../screens/tabs/live.dart' as _i27;
import '../screens/tabs/profile.dart' as _i32;
import '../screens/tabs/search.dart' as _i30;
import '../screens/tabs/tabs_root.dart' as _i26;
import '../screens/tv/tv_live.dart' as _i2;
import '../screens/tv/tv_login.dart' as _i3;
import 'router.dart' as _i36;

class AppRouter extends _i34.RootStackRouter {
  AppRouter([_i35.GlobalKey<_i35.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i34.PageFactory> pagesMap = {
    AutoLoginScreenRoute.name: (routeData) {
      return _i34.MaterialPageX<void>(
        routeData: routeData,
        child: const _i1.AutoLoginScreen(),
      );
    },
    TvLiveScreenRoute.name: (routeData) {
      return _i34.MaterialPageX<void>(
        routeData: routeData,
        child: const _i2.TvLiveScreen(),
      );
    },
    TvLoginScreenRoute.name: (routeData) {
      return _i34.MaterialPageX<void>(
        routeData: routeData,
        child: const _i3.TvLoginScreen(),
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
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: _i4.OnboardingScreen(
          key: args.key,
          loginError: args.loginError,
          onResult: args.onResult,
          auto: args.auto,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignupScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i5.SignupScreen(),
        customRouteBuilder: _i36.modalSheetBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i6.SettingsScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: false,
        barrierDismissible: false,
      );
    },
    AppLanguageScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i7.AppLanguageScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AudioLanguageScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i8.AudioLanguageScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SubtitleLanguageScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i9.SubtitleLanguageScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VideoQualityScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i10.VideoQualityScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i11.ContactScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactPublicScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i12.ContactPublicScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DeviceInfoScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i13.DeviceInfoScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AboutScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i14.AboutScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FAQScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i15.FAQScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PrivacyPolicyScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i16.PrivacyPolicyScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TermsOfUseScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i17.TermsOfUseScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AccountDeletionScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i18.AccountDeletionScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PublicHomeRoute.name: (routeData) {
      final args = routeData.argsAs<PublicHomeRouteArgs>(
          orElse: () => const PublicHomeRouteArgs());
      return _i34.CupertinoPageX<void>(
        routeData: routeData,
        child: _i19.HomeScreen(key: args.key),
        maintainState: false,
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
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: _i20.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
          collectionId: args.collectionId,
        ),
        transitionsBuilder: _i37.CustomTransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ExtraUsergroupsScreen.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i21.ExtraUsergroupsScreen(),
        customRouteBuilder: _i36.settingsRouteBuilder,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GameScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<GameScreenRouteArgs>(
          orElse: () =>
              GameScreenRouteArgs(gameId: pathParams.getString('gameId')));
      return _i34.CupertinoPageX<void>(
        routeData: routeData,
        child: _i22.GameScreen(
          key: args.key,
          gameId: args.gameId,
        ),
        maintainState: false,
      );
    },
    StudyScreenRoute.name: (routeData) {
      final args = routeData.argsAs<StudyScreenRouteArgs>();
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: _i23.StudyScreen(
          key: args.key,
          episodeId: args.episodeId,
          lessonId: args.lessonId,
        ),
        transitionsBuilder: _i37.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AchievementsScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i24.AchievementsScreen(),
        transitionsBuilder: _i37.CustomTransitionsBuilders.slideUp,
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
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: _i25.AchievementGroupScreen(
          key: args.key,
          groupId: args.groupId,
        ),
        transitionsBuilder: _i37.CustomTransitionsBuilders.slideUp,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TabsRootScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i26.TabsRootScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LiveScreenRoute.name: (routeData) {
      return _i34.MaterialPageX<void>(
        routeData: routeData,
        child: const _i27.LiveScreen(),
      );
    },
    SearchScreenWrapperRoute.name: (routeData) {
      return _i34.MaterialPageX<void>(
        routeData: routeData,
        child: const _i28.EmptyRouterPage(),
      );
    },
    CalendarPageRoute.name: (routeData) {
      return _i34.MaterialPageX<void>(
        routeData: routeData,
        child: const _i29.CalendarPage(),
      );
    },
    ProfileScreenWrapperRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i28.EmptyRouterPage(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GamesWrapperRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i28.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeScreenWrapperRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i28.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SearchScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<SearchScreenRouteArgs>(
          orElse: () =>
              SearchScreenRouteArgs(query: queryParams.optString('q')));
      return _i34.MaterialPageX<void>(
        routeData: routeData,
        child: _i30.SearchScreen(
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
      return _i34.CupertinoPageX<void>(
        routeData: routeData,
        child: _i20.EpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
          collectionId: args.collectionId,
        ),
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
      return _i34.CupertinoPageX<void>(
        routeData: routeData,
        child: _i20.CollectionEpisodeScreen(
          key: args.key,
          episodeId: args.episodeId,
          autoplay: args.autoplay,
          queryParamStartPosition: args.queryParamStartPosition,
          hideBottomSection: args.hideBottomSection,
          collectionId: args.collectionId,
        ),
      );
    },
    PageScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PageScreenRouteArgs>(
          orElse: () =>
              PageScreenRouteArgs(pageCode: pathParams.getString('pageCode')));
      return _i34.CupertinoPageX<void>(
        routeData: routeData,
        child: _i31.PageScreen(
          key: args.key,
          pageCode: args.pageCode,
        ),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i34.CustomPage<void>(
        routeData: routeData,
        child: const _i32.ProfileScreen(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GamesScreenRoute.name: (routeData) {
      return _i34.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i33.GamesScreen(),
      );
    },
    GamesGameScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<GamesGameScreenRouteArgs>(
          orElse: () =>
              GamesGameScreenRouteArgs(gameId: pathParams.getString('gameId')));
      return _i34.CupertinoPageX<void>(
        routeData: routeData,
        child: _i22.GameScreen(
          key: args.key,
          gameId: args.gameId,
        ),
        maintainState: false,
      );
    },
    Home.name: (routeData) {
      final args = routeData.argsAs<HomeArgs>(orElse: () => const HomeArgs());
      return _i34.CupertinoPageX<void>(
        routeData: routeData,
        child: _i19.HomeScreen(key: args.key),
      );
    },
  };

  @override
  List<_i34.RouteConfig> get routes => [
        _i34.RouteConfig(
          AutoLoginScreenRoute.name,
          path: '/auto-login',
        ),
        _i34.RouteConfig(
          TvLiveScreenRoute.name,
          path: '/tv/live',
          meta: <String, dynamic>{'analytics_name': 'tv-live'},
        ),
        _i34.RouteConfig(
          TvLoginScreenRoute.name,
          path: '/tv/login',
          meta: <String, dynamic>{'analytics_name': 'tv-login'},
        ),
        _i34.RouteConfig(
          OnboardingScreenRoute.name,
          path: '/login',
          meta: <String, dynamic>{'analytics_name': 'login'},
        ),
        _i34.RouteConfig(
          SignupScreenRoute.name,
          path: 'signup',
          meta: <String, dynamic>{'analytics_name': 'signup'},
        ),
        _i34.RouteConfig(
          SettingsScreenRoute.name,
          path: '/settings',
          meta: <String, dynamic>{'analytics_name': 'settings'},
        ),
        _i34.RouteConfig(
          AppLanguageScreenRoute.name,
          path: '/app-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'appLanguage',
          },
        ),
        _i34.RouteConfig(
          AudioLanguageScreenRoute.name,
          path: '/audio-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'audioLanguage',
          },
        ),
        _i34.RouteConfig(
          SubtitleLanguageScreenRoute.name,
          path: '/subtitle-language',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'subtitlesLanguage',
          },
        ),
        _i34.RouteConfig(
          VideoQualityScreenRoute.name,
          path: '/video-quality',
          meta: <String, dynamic>{
            'analytics_name': 'settings',
            'settings_name': 'videoQuality',
          },
        ),
        _i34.RouteConfig(
          ContactScreenRoute.name,
          path: '/contact-support',
          meta: <String, dynamic>{'analytics_name': 'support'},
        ),
        _i34.RouteConfig(
          ContactPublicScreenRoute.name,
          path: '/contact-support-public',
          meta: <String, dynamic>{'analytics_name': 'support'},
        ),
        _i34.RouteConfig(
          DeviceInfoScreenRoute.name,
          path: '/device-info',
          meta: <String, dynamic>{'analytics_name': 'support'},
        ),
        _i34.RouteConfig(
          AboutScreenRoute.name,
          path: '/about',
          meta: <String, dynamic>{'analytics_name': 'about'},
        ),
        _i34.RouteConfig(
          FAQScreenRoute.name,
          path: '/faq',
          meta: <String, dynamic>{'analytics_name': 'faq'},
        ),
        _i34.RouteConfig(
          PrivacyPolicyScreenRoute.name,
          path: '/privacy-policy',
          meta: <String, dynamic>{'analytics_name': 'privacy-policy'},
        ),
        _i34.RouteConfig(
          TermsOfUseScreenRoute.name,
          path: '/terms-of-use',
          meta: <String, dynamic>{'analytics_name': 'terms-of-use'},
        ),
        _i34.RouteConfig(
          AccountDeletionScreenRoute.name,
          path: '/account-deletion',
          meta: <String, dynamic>{'analytics_name': 'account-deletion'},
        ),
        _i34.RouteConfig(
          PublicHomeRoute.name,
          path: '/public-home',
        ),
        _i34.RouteConfig(
          EmbedScreen.name,
          path: '/embed/:episodeId',
          meta: <String, dynamic>{'analytics_name': 'episode'},
        ),
        _i34.RouteConfig(
          ExtraUsergroupsScreen.name,
          path: '/extra-usergroups',
          meta: <String, dynamic>{'analytics_name': 'extra-usergroups'},
        ),
        _i34.RouteConfig(
          GameScreenRoute.name,
          path: '/game/:gameId',
        ),
        _i34.RouteConfig(
          StudyScreenRoute.name,
          path: 'study-lesson',
          meta: <String, dynamic>{'analytics_name': 'study-lesson'},
        ),
        _i34.RouteConfig(
          AchievementsScreenRoute.name,
          path: '/achievements',
          meta: <String, dynamic>{'analytics_name': 'achievements'},
        ),
        _i34.RouteConfig(
          AchievementGroupScreenRoute.name,
          path: '/achievement-group/:groupId',
          meta: <String, dynamic>{'analytics_name': 'achievement-group'},
        ),
        _i34.RouteConfig(
          TabsRootScreenRoute.name,
          path: '/',
          children: [
            _i34.RouteConfig(
              LiveScreenRoute.name,
              path: 'live',
              parent: TabsRootScreenRoute.name,
              meta: <String, dynamic>{
                'hide_mini_player': true,
                'nav_tab_route': true,
                'analytics_name': 'livestream',
              },
            ),
            _i34.RouteConfig(
              SearchScreenWrapperRoute.name,
              path: 'search',
              parent: TabsRootScreenRoute.name,
              children: [
                _i34.RouteConfig(
                  SearchScreenRoute.name,
                  path: '',
                  parent: SearchScreenWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i34.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: SearchScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i34.RouteConfig(
                  CollectionEpisodeScreenRoute.name,
                  path: 'episode/:collectionId/:episodeId',
                  parent: SearchScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i34.RouteConfig(
                  PageScreenRoute.name,
                  path: ':pageCode',
                  parent: SearchScreenWrapperRoute.name,
                  usesPathAsKey: true,
                ),
              ],
            ),
            _i34.RouteConfig(
              CalendarPageRoute.name,
              path: 'calendar',
              parent: TabsRootScreenRoute.name,
              meta: <String, dynamic>{
                'nav_tab_route': true,
                'analytics_name': 'calendar',
              },
            ),
            _i34.RouteConfig(
              ProfileScreenWrapperRoute.name,
              path: 'profile',
              parent: TabsRootScreenRoute.name,
              children: [
                _i34.RouteConfig(
                  ProfileScreenRoute.name,
                  path: '',
                  parent: ProfileScreenWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i34.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: ProfileScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i34.RouteConfig(
                  CollectionEpisodeScreenRoute.name,
                  path: 'episode/:collectionId/:episodeId',
                  parent: ProfileScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
              ],
            ),
            _i34.RouteConfig(
              GamesWrapperRoute.name,
              path: 'games',
              parent: TabsRootScreenRoute.name,
              children: [
                _i34.RouteConfig(
                  GamesScreenRoute.name,
                  path: '',
                  parent: GamesWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i34.RouteConfig(
                  GamesGameScreenRoute.name,
                  path: ':gameId',
                  parent: GamesWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'game'},
                ),
              ],
            ),
            _i34.RouteConfig(
              HomeScreenWrapperRoute.name,
              path: '',
              parent: TabsRootScreenRoute.name,
              children: [
                _i34.RouteConfig(
                  Home.name,
                  path: '',
                  parent: HomeScreenWrapperRoute.name,
                  meta: <String, dynamic>{'nav_tab_route': true},
                ),
                _i34.RouteConfig(
                  EpisodeScreenRoute.name,
                  path: 'episode/:episodeId',
                  parent: HomeScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i34.RouteConfig(
                  CollectionEpisodeScreenRoute.name,
                  path: 'episode/:collectionId/:episodeId',
                  parent: HomeScreenWrapperRoute.name,
                  meta: <String, dynamic>{'analytics_name': 'episode'},
                ),
                _i34.RouteConfig(
                  PageScreenRoute.name,
                  path: ':pageCode',
                  parent: HomeScreenWrapperRoute.name,
                  usesPathAsKey: true,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.AutoLoginScreen]
class AutoLoginScreenRoute extends _i34.PageRouteInfo<void> {
  const AutoLoginScreenRoute()
      : super(
          AutoLoginScreenRoute.name,
          path: '/auto-login',
        );

  static const String name = 'AutoLoginScreenRoute';
}

/// generated route for
/// [_i2.TvLiveScreen]
class TvLiveScreenRoute extends _i34.PageRouteInfo<void> {
  const TvLiveScreenRoute()
      : super(
          TvLiveScreenRoute.name,
          path: '/tv/live',
        );

  static const String name = 'TvLiveScreenRoute';
}

/// generated route for
/// [_i3.TvLoginScreen]
class TvLoginScreenRoute extends _i34.PageRouteInfo<void> {
  const TvLoginScreenRoute()
      : super(
          TvLoginScreenRoute.name,
          path: '/tv/login',
        );

  static const String name = 'TvLoginScreenRoute';
}

/// generated route for
/// [_i4.OnboardingScreen]
class OnboardingScreenRoute
    extends _i34.PageRouteInfo<OnboardingScreenRouteArgs> {
  OnboardingScreenRoute({
    _i38.Key? key,
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

  final _i38.Key? key;

  final String? loginError;

  final void Function(bool)? onResult;

  final bool auto;

  @override
  String toString() {
    return 'OnboardingScreenRouteArgs{key: $key, loginError: $loginError, onResult: $onResult, auto: $auto}';
  }
}

/// generated route for
/// [_i5.SignupScreen]
class SignupScreenRoute extends _i34.PageRouteInfo<void> {
  const SignupScreenRoute()
      : super(
          SignupScreenRoute.name,
          path: 'signup',
        );

  static const String name = 'SignupScreenRoute';
}

/// generated route for
/// [_i6.SettingsScreen]
class SettingsScreenRoute extends _i34.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i7.AppLanguageScreen]
class AppLanguageScreenRoute extends _i34.PageRouteInfo<void> {
  const AppLanguageScreenRoute()
      : super(
          AppLanguageScreenRoute.name,
          path: '/app-language',
        );

  static const String name = 'AppLanguageScreenRoute';
}

/// generated route for
/// [_i8.AudioLanguageScreen]
class AudioLanguageScreenRoute extends _i34.PageRouteInfo<void> {
  const AudioLanguageScreenRoute()
      : super(
          AudioLanguageScreenRoute.name,
          path: '/audio-language',
        );

  static const String name = 'AudioLanguageScreenRoute';
}

/// generated route for
/// [_i9.SubtitleLanguageScreen]
class SubtitleLanguageScreenRoute extends _i34.PageRouteInfo<void> {
  const SubtitleLanguageScreenRoute()
      : super(
          SubtitleLanguageScreenRoute.name,
          path: '/subtitle-language',
        );

  static const String name = 'SubtitleLanguageScreenRoute';
}

/// generated route for
/// [_i10.VideoQualityScreen]
class VideoQualityScreenRoute extends _i34.PageRouteInfo<void> {
  const VideoQualityScreenRoute()
      : super(
          VideoQualityScreenRoute.name,
          path: '/video-quality',
        );

  static const String name = 'VideoQualityScreenRoute';
}

/// generated route for
/// [_i11.ContactScreen]
class ContactScreenRoute extends _i34.PageRouteInfo<void> {
  const ContactScreenRoute()
      : super(
          ContactScreenRoute.name,
          path: '/contact-support',
        );

  static const String name = 'ContactScreenRoute';
}

/// generated route for
/// [_i12.ContactPublicScreen]
class ContactPublicScreenRoute extends _i34.PageRouteInfo<void> {
  const ContactPublicScreenRoute()
      : super(
          ContactPublicScreenRoute.name,
          path: '/contact-support-public',
        );

  static const String name = 'ContactPublicScreenRoute';
}

/// generated route for
/// [_i13.DeviceInfoScreen]
class DeviceInfoScreenRoute extends _i34.PageRouteInfo<void> {
  const DeviceInfoScreenRoute()
      : super(
          DeviceInfoScreenRoute.name,
          path: '/device-info',
        );

  static const String name = 'DeviceInfoScreenRoute';
}

/// generated route for
/// [_i14.AboutScreen]
class AboutScreenRoute extends _i34.PageRouteInfo<void> {
  const AboutScreenRoute()
      : super(
          AboutScreenRoute.name,
          path: '/about',
        );

  static const String name = 'AboutScreenRoute';
}

/// generated route for
/// [_i15.FAQScreen]
class FAQScreenRoute extends _i34.PageRouteInfo<void> {
  const FAQScreenRoute()
      : super(
          FAQScreenRoute.name,
          path: '/faq',
        );

  static const String name = 'FAQScreenRoute';
}

/// generated route for
/// [_i16.PrivacyPolicyScreen]
class PrivacyPolicyScreenRoute extends _i34.PageRouteInfo<void> {
  const PrivacyPolicyScreenRoute()
      : super(
          PrivacyPolicyScreenRoute.name,
          path: '/privacy-policy',
        );

  static const String name = 'PrivacyPolicyScreenRoute';
}

/// generated route for
/// [_i17.TermsOfUseScreen]
class TermsOfUseScreenRoute extends _i34.PageRouteInfo<void> {
  const TermsOfUseScreenRoute()
      : super(
          TermsOfUseScreenRoute.name,
          path: '/terms-of-use',
        );

  static const String name = 'TermsOfUseScreenRoute';
}

/// generated route for
/// [_i18.AccountDeletionScreen]
class AccountDeletionScreenRoute extends _i34.PageRouteInfo<void> {
  const AccountDeletionScreenRoute()
      : super(
          AccountDeletionScreenRoute.name,
          path: '/account-deletion',
        );

  static const String name = 'AccountDeletionScreenRoute';
}

/// generated route for
/// [_i19.HomeScreen]
class PublicHomeRoute extends _i34.PageRouteInfo<PublicHomeRouteArgs> {
  PublicHomeRoute({_i38.Key? key})
      : super(
          PublicHomeRoute.name,
          path: '/public-home',
          args: PublicHomeRouteArgs(key: key),
        );

  static const String name = 'PublicHomeRoute';
}

class PublicHomeRouteArgs {
  const PublicHomeRouteArgs({this.key});

  final _i38.Key? key;

  @override
  String toString() {
    return 'PublicHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i20.EpisodeScreen]
class EmbedScreen extends _i34.PageRouteInfo<EmbedScreenArgs> {
  EmbedScreen({
    _i38.Key? key,
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

  final _i38.Key? key;

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
/// [_i21.ExtraUsergroupsScreen]
class ExtraUsergroupsScreen extends _i34.PageRouteInfo<void> {
  const ExtraUsergroupsScreen()
      : super(
          ExtraUsergroupsScreen.name,
          path: '/extra-usergroups',
        );

  static const String name = 'ExtraUsergroupsScreen';
}

/// generated route for
/// [_i22.GameScreen]
class GameScreenRoute extends _i34.PageRouteInfo<GameScreenRouteArgs> {
  GameScreenRoute({
    _i38.Key? key,
    required String gameId,
  }) : super(
          GameScreenRoute.name,
          path: '/game/:gameId',
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

  final _i38.Key? key;

  final String gameId;

  @override
  String toString() {
    return 'GameScreenRouteArgs{key: $key, gameId: $gameId}';
  }
}

/// generated route for
/// [_i23.StudyScreen]
class StudyScreenRoute extends _i34.PageRouteInfo<StudyScreenRouteArgs> {
  StudyScreenRoute({
    _i38.Key? key,
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

  final _i38.Key? key;

  final String episodeId;

  final String lessonId;

  @override
  String toString() {
    return 'StudyScreenRouteArgs{key: $key, episodeId: $episodeId, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i24.AchievementsScreen]
class AchievementsScreenRoute extends _i34.PageRouteInfo<void> {
  const AchievementsScreenRoute()
      : super(
          AchievementsScreenRoute.name,
          path: '/achievements',
        );

  static const String name = 'AchievementsScreenRoute';
}

/// generated route for
/// [_i25.AchievementGroupScreen]
class AchievementGroupScreenRoute
    extends _i34.PageRouteInfo<AchievementGroupScreenRouteArgs> {
  AchievementGroupScreenRoute({
    _i38.Key? key,
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

  final _i38.Key? key;

  final String groupId;

  @override
  String toString() {
    return 'AchievementGroupScreenRouteArgs{key: $key, groupId: $groupId}';
  }
}

/// generated route for
/// [_i26.TabsRootScreen]
class TabsRootScreenRoute extends _i34.PageRouteInfo<void> {
  const TabsRootScreenRoute({List<_i34.PageRouteInfo>? children})
      : super(
          TabsRootScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'TabsRootScreenRoute';
}

/// generated route for
/// [_i27.LiveScreen]
class LiveScreenRoute extends _i34.PageRouteInfo<void> {
  const LiveScreenRoute()
      : super(
          LiveScreenRoute.name,
          path: 'live',
        );

  static const String name = 'LiveScreenRoute';
}

/// generated route for
/// [_i28.EmptyRouterPage]
class SearchScreenWrapperRoute extends _i34.PageRouteInfo<void> {
  const SearchScreenWrapperRoute({List<_i34.PageRouteInfo>? children})
      : super(
          SearchScreenWrapperRoute.name,
          path: 'search',
          initialChildren: children,
        );

  static const String name = 'SearchScreenWrapperRoute';
}

/// generated route for
/// [_i29.CalendarPage]
class CalendarPageRoute extends _i34.PageRouteInfo<void> {
  const CalendarPageRoute()
      : super(
          CalendarPageRoute.name,
          path: 'calendar',
        );

  static const String name = 'CalendarPageRoute';
}

/// generated route for
/// [_i28.EmptyRouterPage]
class ProfileScreenWrapperRoute extends _i34.PageRouteInfo<void> {
  const ProfileScreenWrapperRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ProfileScreenWrapperRoute.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileScreenWrapperRoute';
}

/// generated route for
/// [_i28.EmptyRouterPage]
class GamesWrapperRoute extends _i34.PageRouteInfo<void> {
  const GamesWrapperRoute({List<_i34.PageRouteInfo>? children})
      : super(
          GamesWrapperRoute.name,
          path: 'games',
          initialChildren: children,
        );

  static const String name = 'GamesWrapperRoute';
}

/// generated route for
/// [_i28.EmptyRouterPage]
class HomeScreenWrapperRoute extends _i34.PageRouteInfo<void> {
  const HomeScreenWrapperRoute({List<_i34.PageRouteInfo>? children})
      : super(
          HomeScreenWrapperRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'HomeScreenWrapperRoute';
}

/// generated route for
/// [_i30.SearchScreen]
class SearchScreenRoute extends _i34.PageRouteInfo<SearchScreenRouteArgs> {
  SearchScreenRoute({
    _i38.Key? key,
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

  final _i38.Key? key;

  final String? query;

  @override
  String toString() {
    return 'SearchScreenRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i20.EpisodeScreen]
class EpisodeScreenRoute extends _i34.PageRouteInfo<EpisodeScreenRouteArgs> {
  EpisodeScreenRoute({
    _i38.Key? key,
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

  final _i38.Key? key;

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
/// [_i20.CollectionEpisodeScreen]
class CollectionEpisodeScreenRoute
    extends _i34.PageRouteInfo<CollectionEpisodeScreenRouteArgs> {
  CollectionEpisodeScreenRoute({
    _i38.Key? key,
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

  final _i38.Key? key;

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
/// [_i31.PageScreen]
class PageScreenRoute extends _i34.PageRouteInfo<PageScreenRouteArgs> {
  PageScreenRoute({
    _i38.Key? key,
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

  final _i38.Key? key;

  final String pageCode;

  @override
  String toString() {
    return 'PageScreenRouteArgs{key: $key, pageCode: $pageCode}';
  }
}

/// generated route for
/// [_i32.ProfileScreen]
class ProfileScreenRoute extends _i34.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: '',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i33.GamesScreen]
class GamesScreenRoute extends _i34.PageRouteInfo<void> {
  const GamesScreenRoute()
      : super(
          GamesScreenRoute.name,
          path: '',
        );

  static const String name = 'GamesScreenRoute';
}

/// generated route for
/// [_i22.GameScreen]
class GamesGameScreenRoute
    extends _i34.PageRouteInfo<GamesGameScreenRouteArgs> {
  GamesGameScreenRoute({
    _i38.Key? key,
    required String gameId,
  }) : super(
          GamesGameScreenRoute.name,
          path: ':gameId',
          args: GamesGameScreenRouteArgs(
            key: key,
            gameId: gameId,
          ),
          rawPathParams: {'gameId': gameId},
        );

  static const String name = 'GamesGameScreenRoute';
}

class GamesGameScreenRouteArgs {
  const GamesGameScreenRouteArgs({
    this.key,
    required this.gameId,
  });

  final _i38.Key? key;

  final String gameId;

  @override
  String toString() {
    return 'GamesGameScreenRouteArgs{key: $key, gameId: $gameId}';
  }
}

/// generated route for
/// [_i19.HomeScreen]
class Home extends _i34.PageRouteInfo<HomeArgs> {
  Home({_i38.Key? key})
      : super(
          Home.name,
          path: '',
          args: HomeArgs(key: key),
        );

  static const String name = 'Home';
}

class HomeArgs {
  const HomeArgs({this.key});

  final _i38.Key? key;

  @override
  String toString() {
    return 'HomeArgs{key: $key}';
  }
}
