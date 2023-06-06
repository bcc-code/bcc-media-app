import 'package:brunstadtv_app/flavors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../background_tasks.dart';

Future initFirebase(FirebaseOptions firebaseOptions) async {
  try {
    await Firebase.initializeApp(
      options: firebaseOptions,
    );
  } catch (e) {
    debugPrint(e.toString());
  }

  if (!kDebugMode) {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  } else {
    FlutterError.onError = (errorDetails) {
      debugPrint(errorDetails.toStringShort());
      debugPrint(errorDetails.toString());
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      debugPrint(error.toString());
      debugPrint(stack.toString());
      return true;
    };
  }

  if (FlavorConfig.current.enableNotifications) {
    FirebaseMessaging.onBackgroundMessage(onFirebaseBackgroundMessage);
  }
}
