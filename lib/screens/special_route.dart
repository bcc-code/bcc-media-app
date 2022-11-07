import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router/router.gr.dart';

class SpecialRoutesGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final route = resolver.route.children![0];
    print('Route: $route');
    if (route.segments[0] == 'r') {
      final code = route.pathParams.get('code');
      print('Code: $code');
    } else if (route.segments[0] == 'series') {
      final legacyEpisodeId = route.pathParams.get('legacyEpisodeId');
      print('LegacyEpisodeId: $legacyEpisodeId');
    } else if (route.segments[0] == 'program') {
      final legacyProgramId = route.pathParams.get('legacyProgramId');
      print('LegacyProgramId: $legacyProgramId');
    }
    // final id = resolver.route.pathParams.get('id');
    // if (resolver.)
    // router.root.navigateNamed('/episode/$id');
  }
}
