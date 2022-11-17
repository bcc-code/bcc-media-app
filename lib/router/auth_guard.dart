import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation

    ProviderContainer? ref;
    if (router.navigatorKey.currentContext != null) {
      ref = ProviderScope.containerOf(router.navigatorKey.currentContext!, listen: false);
    }

    if (ref == null) {
      // AFAIK, this happen always on the very first route, but never after.
      return resolver.next(true);
    }

    final authState = ref.read(authStateProvider);

    if (authState.guestMode) {
      return resolver.next(true);
    }

    if (authState.auth0AccessToken == null) {
      router.push(LoginScreenRoute(onResult: (success) {
        resolver.next(success);
      }));
      return;
    } else {
      resolver.next(true);
      return;
    }
    resolver.next(true);
  }
}
