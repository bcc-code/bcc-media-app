import 'package:auto_route/auto_route.dart';
import 'package:my_app/router/router.gr.dart';

import '../services/auth_service.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (AuthService.instance.idToken == null) {
      // we redirect the user to our login page
      router.push(LoginScreenRoute(onResult: (success) {
        // if success == true the navigation will be resumed
        // else it will be aborted
        resolver.next(success);
      }));
    } else {
      resolver.next(true);
    }
  }
}
