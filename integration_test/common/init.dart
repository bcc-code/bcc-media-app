import 'dart:async';

import 'package:alice/alice.dart';
import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/app_root.dart';
import 'package:brunstadtv_app/env/prod/firebase_options.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/providers/router_provider.dart';
import 'package:brunstadtv_app/services/deeplink_service.dart';
import 'package:brunstadtv_app/helpers/navigation_utils.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/router/analytics_observer.dart';
import 'package:brunstadtv_app/router/special_routes_guard.dart';
import 'package:brunstadtv_app/services/firebase.dart';
import 'package:brunstadtv_app/theme/bccm_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:brunstadtv_app/services/playback_service.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:app_links/app_links.dart';

void init() async {
  await setDefaults();

  initFirebase(DefaultFirebaseOptions.currentPlatform);

  final appRouter = AppRouter(specialRoutesGuard: SpecialRoutesGuard(), navigatorKey: navigatorKey);
  final providerContainer = await initProviderContainer([
    rootRouterProvider.overrideWithValue(appRouter),
  ]);
  final routerDelegate = await getRouterDelegate(providerContainer, appRouter);

  final app = UncontrolledProviderScope(
    container: providerContainer,
    child: AppRoot(
      navigatorKey: navigatorKey,
      routerDelegate: routerDelegate,
      appRouter: appRouter,
    ),
  );
  runApp(app);
}
