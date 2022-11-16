import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation

    ProviderContainer? ref;
    if (router.navigatorKey.currentContext != null) {
      ref = ProviderScope.containerOf(router.navigatorKey.currentContext!, listen: false);
    }

    if (ref != null && ref.read(authStateProvider).auth0AccessToken == null && !ref.read(authStateProvider).guestUser) {
      router.push(LoginScreenRoute(onResult: (success) {
        resolver.next(success);
      }));
    } else {
      resolver.next(true);
    }
  }
}
