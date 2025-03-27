import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/providers/performance_class_provider.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final analyticsProviderOverride = analyticsProvider.overrideWith((ref) {
  return RudderAnalytics(
    ref: ref,
    strictAnonymousAnalytics: FlavorConfig.current.strictAnonymousAnalytics,
    rudderstackWriteKey: Env.rudderstackWriteKey,
    onShouldRefreshSessionId: () {
      ref.read(settingsProvider.notifier).refreshSessionId();
    },
  );
});

class BccmAnalyticsMetaEnricher extends AnalyticsMetaEnricher {
  BccmAnalyticsMetaEnricher(super.ref);

  @override
  String? getScreenName(Route<dynamic> route) {
    final pageRouteArgs = route.settings.arguments.asOrNull<PageScreenRouteArgs>();
    if (pageRouteArgs != null) {
      return pageRouteArgs.pageCode;
    }
    return null;
  }

  @override
  Map<String, dynamic>? getExtraPropertiesForRoute(Route<dynamic> route) {
    final extraProperties = <String, dynamic>{};
    extraProperties['meta'] = <String, dynamic>{};

    final pageRouteArgs = route.settings.arguments.asOrNull<PageScreenRouteArgs>();
    if (pageRouteArgs != null) {
      extraProperties['pageCode'] = pageRouteArgs.pageCode;
    }
    final episodeRouteArgs = route.settings.arguments.asOrNull<EpisodeScreenRouteArgs>();
    if (episodeRouteArgs != null) {
      extraProperties['meta']['episodeId'] = episodeRouteArgs.episodeId;
    }
    final personRouteArgs = route.settings.arguments.asOrNull<ContributorScreenRouteArgs>();
    if (personRouteArgs != null) {
      extraProperties['meta']['id'] = personRouteArgs.personId;
    }

    final routeData = route.data;
    if (routeData != null && routeData.meta.containsKey(RouteMetaConstants.settingsName)) {
      extraProperties['meta']['settings'] = routeData.meta[RouteMetaConstants.settingsName];
    }

    final onboardingRouteArgs = route.settings.arguments.asOrNull<OnboardingScreenRouteArgs>();
    final ref = this.ref;
    if (onboardingRouteArgs != null && ref != null) {
      extraProperties['meta']['hasEverLoggedIn'] = ref.read(sharedPreferencesProvider).getBool(PrefKeys.hasEverLoggedIn);
    }

    if (ref != null && Platform.isAndroid) {
      extraProperties['meta']['performanceClass'] = ref.read(androidPerformanceClassProvider).valueOrNull;
    }

    return extraProperties;
  }
}
