import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../helpers/constants.dart';
import '../helpers/router/custom_transitions.dart';
import 'router.gr.dart';

@AutoRouterConfig(deferredLoading: false, replaceInRouteName: 'Screen,ScreenRoute')
class AppRouter extends $AppRouter {
  AppRouter({super.navigatorKey});

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: InitScreenRoute.page,
      path: '/init',
    ),
    CustomRoute(
      page: OnboardingScreenRoute.page,
      path: '/login',
      meta: const {RouteMetaConstants.analyticsName: 'login'},
    ),
    CustomRoute(
      customRouteBuilder: modalSheetBuilder,
      page: SignupScreenRoute.page,
      path: '/signup',
      meta: const {RouteMetaConstants.analyticsName: 'signup'},
    ),
    CustomRoute(
      opaque: false,
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      page: SettingsScreenRoute.page,
      path: '/settings',
      meta: const {RouteMetaConstants.analyticsName: 'settings'},
    ),
    CustomRoute(
      page: AppLanguageScreenRoute.page,
      path: '/app-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'appLanguage'},
    ),
    CustomRoute(
      page: AudioLanguageScreenRoute.page,
      path: '/audio-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'audioLanguage'},
    ),
    CustomRoute(
      page: SubtitleLanguageScreenRoute.page,
      path: '/subtitle-language',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'subtitlesLanguage'},
    ),
    CustomRoute(
      page: VideoQualityScreenRoute.page,
      path: '/video-quality',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'settings', RouteMetaConstants.settingsName: 'videoQuality'},
    ),
    CustomRoute(
      page: ContactScreenRoute.page,
      path: '/contact-support',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'support'},
    ),
    CustomRoute(
      page: ContactPublicScreenRoute.page,
      path: '/contact-support-public',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'support'},
    ),
    CustomRoute(
      page: DeviceInfoScreenRoute.page,
      path: '/device-info',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'device-info'},
    ),
    CustomRoute(
      page: AboutScreenRoute.page,
      path: '/about',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'about'},
    ),
    CustomRoute(
      page: FAQScreenRoute.page,
      path: '/faq',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'faq'},
    ),
    CustomRoute(
      page: PrivacyPolicyScreenRoute.page,
      path: '/privacy-policy',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'privacy-policy'},
    ),
    CustomRoute(
      page: TermsOfUseScreenRoute.page,
      path: '/terms-of-use',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'terms-of-use'},
    ),
    CustomRoute(
      page: AccountDeletionScreenRoute.page,
      path: '/account-deletion',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'account-deletion'},
    ),
    CustomRoute(
      page: EpisodeScreenRoute.page,
      path: '/embed/:episodeId',
      durationInMilliseconds: 300,
      reverseDurationInMilliseconds: 300,
      transitionsBuilder: CustomTransitionsBuilders.slideLeft,
      meta: const {RouteMetaConstants.analyticsName: 'episode'},
    ),
    CustomRoute(
      page: ExtraUsergroupsScreenRoute.page,
      path: '/extra-usergroups',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      customRouteBuilder: settingsRouteBuilder,
      meta: const {RouteMetaConstants.analyticsName: 'extra-usergroups'},
    ),
    CustomRoute(
      page: StudyScreenRoute.page,
      path: '/study-lesson',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp(),
      meta: const {RouteMetaConstants.analyticsName: 'study-lesson'},
    ),
    CustomRoute(
      page: WebviewScreenRoute.page,
      path: '/w/:redirectCode',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp(),
      meta: const {RouteMetaConstants.analyticsName: 'webview'},
    ),
    CustomRoute(
      page: AchievementsScreenRoute.page,
      path: '/achievements',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp(),
      meta: const {RouteMetaConstants.analyticsName: 'achievements'},
    ),
    CustomRoute(
      page: AchievementGroupScreenRoute.page,
      path: '/achievement-group/:groupId',
      durationInMilliseconds: 400,
      reverseDurationInMilliseconds: 600,
      transitionsBuilder: CustomTransitionsBuilders.slideUp(),
      meta: const {
        RouteMetaConstants.analyticsName: 'achievement-group',
      },
    ),
    CustomRoute(
      page: TabsRootScreenRoute.page,
      path: '/',
      children: [
        MaterialRoute(
          page: SearchWrapperScreenRoute.page,
          path: 'search',
          children: [
            MaterialRoute(
              page: SearchScreenRoute.page,
              path: '',
              meta: const {RouteMetaConstants.navTabRoute: true},
            ),
            _episodeScreenRoute,
            _trackScreenRoute,
            _collectionEpisodeScreenRoute,
            _pageScreenRoute,
          ],
        ),
        CustomRoute(
          page: ShortsWrapperScreenRoute.page,
          path: 'shorts',
          maintainState: true,
          children: [
            CupertinoRoute(
              page: ShortsScreenRoute.page,
              path: '',
              maintainState: true,
              meta: const {RouteMetaConstants.navTabRoute: true, RouteMetaConstants.analyticsName: 'shorts'},
            ),
            _episodeScreenRoute,
            _trackScreenRoute,
            _collectionEpisodeScreenRoute,
          ],
        ),
        CustomRoute(
          page: ProfileWrapperScreenRoute.page,
          path: 'profile',
          maintainState: true,
          children: [
            CustomRoute(
              page: ProfileScreenRoute.page,
              path: '',
              maintainState: false,
              usesPathAsKey: true,
              meta: const {RouteMetaConstants.navTabRoute: true},
            ),
            _episodeScreenRoute,
            _trackScreenRoute,
            _collectionEpisodeScreenRoute,
            _shortScreenRoute('shorts/'),
          ],
        ),
        CustomRoute(
          page: HomeWrapperScreenRoute.page,
          path: '',
          children: [
            CupertinoRoute(
              page: HomeScreenRoute.page,
              path: '',
              maintainState: true,
              meta: const {RouteMetaConstants.navTabRoute: true},
            ),
            _shortScreenRoute('shorts/'),
            _episodeScreenRoute,
            _trackScreenRoute,
            _collectionEpisodeScreenRoute,
            _contributorScreenRoute,
            _pageScreenRoute,
          ],
        ),
      ],
    ),
  ];
}

final _collectionEpisodeScreenRoute = CupertinoRoute(
  page: CollectionEpisodeScreenRoute.page,
  path: 'episode/:collectionId/:episodeId',
  meta: const {RouteMetaConstants.analyticsName: 'episode'},
);

final _trackScreenRoute = CustomRoute(
  page: TrackScreenRoute.page,
  customRouteBuilder: modalSheetBuilder,
  path: 'track/:trackId',
  meta: const {RouteMetaConstants.analyticsName: 'track'},
);

final _episodeScreenRoute = CupertinoRoute(
  page: EpisodeScreenRoute.page,
  path: 'episode/:episodeId',
  meta: const {RouteMetaConstants.analyticsName: 'episode'},
);

final _contributorScreenRoute = CupertinoRoute(
  page: ContributorScreenRoute.page,
  path: 'contributor/:personId',
  meta: const {RouteMetaConstants.analyticsName: 'contributor'},
);

_shortScreenRoute(String pathPrefix) => CupertinoRoute(
      page: ShortScreenRoute.page,
      path: '$pathPrefix:id',
      usesPathAsKey: true,
      maintainState: true,
      meta: const {RouteMetaConstants.navTabRoute: true, RouteMetaConstants.analyticsName: 'shorts'},
    );

final _pageScreenRoute = CupertinoRoute(
  page: PageScreenRoute.page,
  path: ':pageCode',
  usesPathAsKey: true,
);

// Empty routes
@RoutePage<void>()
class SearchWrapperScreen extends AutoRouter {
  const SearchWrapperScreen({super.key});
}

@RoutePage<void>()
class TabsWrapperScreen extends AutoRouter {
  const TabsWrapperScreen({super.key});
}

@RoutePage<void>()
class HomeWrapperScreen extends AutoRouter {
  const HomeWrapperScreen({super.key});
}

@RoutePage<void>()
class ProfileWrapperScreen extends AutoRouter {
  const ProfileWrapperScreen({super.key});
}

@RoutePage<void>()
class ShortsWrapperScreen extends AutoRouter {
  const ShortsWrapperScreen({super.key});
}

Route<T> modalSheetBuilder<T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
  return ModalSheetRoute(
    settings: page,
    builder: (context) => child,
    animationCurve: Curves.easeOutCirc,
    expanded: true,
  );
}

Route<T> settingsRouteBuilder<T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
  if (!kIsWeb) {
    return PageRouteBuilder(settings: page, pageBuilder: (context, a, b) => CustomTransitionsBuilders.slideUp()(context, a, b, child));
  }
  return DialogRoute(
    context: context,
    settings: page,
    builder: (context) => child,
  );
}
