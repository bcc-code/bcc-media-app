import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/constants.dart';

/// Enriches the analytics metadata with extra properties.
///
/// Different apps have different routers, so this needs to be
/// implemented per app. E.g. kids app has a different router than bccm app.
final analyticsMetaEnricherProvider = Provider<AnalyticsMetaEnricher>((ref) => BccmAnalyticsMetaEnricher());

abstract class AnalyticsMetaEnricher {
  /// Used for the `screen` event, to override the screen name.
  /// If null is returned, we use a default value e.g. the route path.
  String? getScreenName(Route<dynamic> route);

  /// Use to add extra properties to the analytics event
  /// Stuff like: `extraProperties['meta']['episodeId'] = episodeRouteArgs.episodeId;`
  Map<String, dynamic>? getExtraPropertiesForRoute(Route<dynamic> route);
}

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

    final routeData = route.data;
    if (routeData != null && routeData.meta.containsKey(RouteMetaConstants.settingsName)) {
      extraProperties['meta']['settings'] = routeData.meta[RouteMetaConstants.settingsName];
    }

    return extraProperties;
  }
}

class AnalyticsNavigatorObserver extends NavigatorObserver {
  bool _routeFilter(Route<dynamic> route) {
    final routeData = route.settings.asOrNull<AutoRoutePage>()?.routeData;
    if (routeData == null) return true;
    if (routeData.meta[RouteMetaConstants.navTabRoute] != null && routeData.meta[RouteMetaConstants.navTabRoute]) {
      return false;
    }
    return true;
  }

  void _sendScreenView(Route<dynamic> route) {
    final context = navigator?.context;
    if (context == null) {
      return;
    }
    final ref = ProviderScope.containerOf(context, listen: false);

    Map<String, dynamic> extraProperties = {
      ...?ref.read(analyticsMetaEnricherProvider).getExtraPropertiesForRoute(route),
    };

    final screenName = ref.read(analyticsMetaEnricherProvider).getScreenName(route) ??
        route.data?.meta[RouteMetaConstants.analyticsName] ??
        route.data?.path ??
        route.settings.name;

    if (screenName?.isNotEmpty == true) {
      SchedulerBinding.instance.scheduleFrameCallback((_) => ref.read(analyticsProvider).screen(screenName!, properties: extraProperties));
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('didPush ${route.settings.name}');
    super.didPush(route, previousRoute);
    if (_routeFilter(route)) {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint('didReplace ${newRoute?.settings.name}');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null && _routeFilter(newRoute)) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('didPop ${route.settings.name}');
    super.didPop(route, previousRoute);
    if (previousRoute != null && _routeFilter(previousRoute) && _routeFilter(route)) {
      _sendScreenView(previousRoute);
    }
  }
}
