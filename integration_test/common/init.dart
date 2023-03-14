import 'package:brunstadtv_app/app_root.dart';
import 'package:brunstadtv_app/env/prod/firebase_options.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/providers/router_provider.dart';
import 'package:brunstadtv_app/router/analytics_observer.dart';
import 'package:brunstadtv_app/router/special_routes_guard.dart';
import 'package:brunstadtv_app/helpers/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

void init() async {
  await setDefaults();

  initFirebase(DefaultFirebaseOptions.currentPlatform);

  final appRouter = AppRouter(specialRoutesGuard: SpecialRoutesGuard(), navigatorKey: navigatorKey);
  final providerContainer = await initProviderContainer([
    rootRouterProvider.overrideWithValue(appRouter),
  ]);

  final app = UncontrolledProviderScope(
    container: providerContainer,
    child: AppRoot(
      navigatorKey: navigatorKey,
      routerDelegate: appRouter.delegate(
        initialRoutes: [const AutoLoginScreeenRoute()],
        navigatorObservers: () => [AnalyticsNavigatorObserver()],
      ),
      appRouter: appRouter,
    ),
  );
  runApp(app);
}
