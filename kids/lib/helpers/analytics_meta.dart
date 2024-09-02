import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';
import 'package:kids/router/router.gr.dart';

class KidsAnalyticsMetaEnricher extends AnalyticsMetaEnricher {
  KidsAnalyticsMetaEnricher([super.ref]);

  @override
  String? getScreenName(Route route) {
    // Use pageRouteArgs.pageCode if we ever add a dynamic page route.
    return null;
  }

  @override
  Map<String, dynamic>? getExtraPropertiesForRoute(Route<dynamic> route) {
    final extraProperties = <String, dynamic>{};
    extraProperties['meta'] = <String, dynamic>{};

    // Use pageCode if we ever add a dynamic page route:
    // extraProperties['pageCode'] = pageRouteArgs.pageCode;

    final episodeRouteArgs = route.settings.arguments.asOrNull<EpisodeScreenRouteArgs>();
    if (episodeRouteArgs != null) {
      extraProperties['meta']['episodeId'] = episodeRouteArgs.id;
    }

    final showScreenRouteArgs = route.settings.arguments.asOrNull<ShowScreenRouteArgs>();
    if (showScreenRouteArgs != null) {
      extraProperties['meta']['showId'] = showScreenRouteArgs.showId;
    }

    final playlistScreenRouteArgs = route.settings.arguments.asOrNull<PlaylistScreenRouteArgs>();
    if (playlistScreenRouteArgs != null) {
      extraProperties['meta']['playlistId'] = playlistScreenRouteArgs.id;
    }

    final routeData = route.data;
    if (routeData != null && routeData.meta.containsKey(RouteMetaConstants.settingsName)) {
      extraProperties['meta']['settings'] = routeData.meta[RouteMetaConstants.settingsName];
    }

    return extraProperties;
  }
}
