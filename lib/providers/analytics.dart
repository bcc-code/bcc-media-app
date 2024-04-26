import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';

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
      extraProperties['meta']['id'] = personRouteArgs.id;
    }

    final routeData = route.data;
    if (routeData != null && routeData.meta.containsKey(RouteMetaConstants.settingsName)) {
      extraProperties['meta']['settings'] = routeData.meta[RouteMetaConstants.settingsName];
    }

    return extraProperties;
  }
}
