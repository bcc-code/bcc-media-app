import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/router/analytics_observer.dart';
import 'package:kids/router/router.gr.dart';

class KidsAnalyticsMetaEnricher extends AnalyticsMetaEnricher {
  @override
  String? getScreenName(RouteData routeData) {
    // Use pageRouteArgs.pageCode if we ever add a dynamic page route.
    return null;
  }

  @override
  Map<String, dynamic>? getExtraPropertiesForRoute(RouteData routeData) {
    final extraProperties = <String, dynamic>{};
    extraProperties['meta'] = <String, dynamic>{};

    // Use pageCode if we ever add a dynamic page route:
    // extraProperties['pageCode'] = pageRouteArgs.pageCode;

    final episodeRouteArgs = routeData.args.asOrNull<EpisodeScreenRouteArgs>();
    if (episodeRouteArgs != null) {
      extraProperties['meta']['episodeId'] = episodeRouteArgs.id;
    }

    final showScreenRouteArgs = routeData.args.asOrNull<ShowScreenRouteArgs>();
    if (showScreenRouteArgs != null) {
      extraProperties['meta']['showId'] = showScreenRouteArgs.showId;
    }

    final playlistScreenRouteArgs = routeData.args.asOrNull<PlaylistScreenRouteArgs>();
    if (showScreenRouteArgs != null) {
      extraProperties['meta']['playlistId'] = playlistScreenRouteArgs?.id;
    }

    if (routeData.meta.containsKey(RouteMetaConstants.settingsName)) {
      extraProperties['meta']['settings'] = routeData.meta[RouteMetaConstants.settingsName];
    }

    return extraProperties;
  }
}
