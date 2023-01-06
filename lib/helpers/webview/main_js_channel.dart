import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/navigation_utils.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/services/share_image.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth_state.dart';

class MainJsChannel {
  final ProviderContainer ref;
  final StackRouter router;
  const MainJsChannel._({required this.router, required this.ref});

  static void register(BuildContext context, InAppWebViewController controller) {
    final ref = ProviderScope.containerOf(context, listen: false);
    controller.addJavaScriptHandler(
      handlerName: 'flutter_main',
      callback: MainJsChannel._(router: context.router, ref: ref).handleMessage,
    );
  }

  Object? handleMessage(List<dynamic> arguments) {
    if (arguments[0] == 'navigate') {
      return _navigate(arguments);
    } else if (arguments[0] == 'push') {
      return _push(arguments);
    } else if (arguments[0] == 'get_access_token') {
      return _getAccessToken(arguments);
    } else if (arguments[0] == 'get_locale') {
      return _getLocale(arguments);
    } else if (arguments[0] == 'share_image') {
      return _shareImage(arguments);
    }
    return null;
  }

  bool _navigate(List<dynamic> arguments) {
    if (arguments[1] is String) {
      router.navigateNamedFromRoot(arguments[1]);
      return true;
    } else {
      FirebaseCrashlytics.instance.recordError(Exception('Tried to navigate with invalid argument: ${arguments[1]}'), StackTrace.current);
      return false;
    }
  }

  bool _push(List<dynamic> arguments) {
    if (arguments[1] is String) {
      router.pushNamed(arguments[1], includePrefixMatches: true);
      return true;
    } else {
      FirebaseCrashlytics.instance.recordError(Exception('Tried to push with invalid argument: ${arguments[1]}'), StackTrace.current);
      return false;
    }
  }

  String? _getAccessToken(List<dynamic> arguments) {
    debugPrint('delivering access token to js');
    return ref.read(authStateProvider).auth0AccessToken;
  }

  String _getLocale(List arguments) {
    return ref.read(settingsProvider).appLanguage.languageCode;
  }

  Future<bool> _shareImage(List<dynamic> arguments) async {
    if (arguments[1] is String) {
      await downloadAndShareImage(arguments[1]);
      return true;
    } else {
      FirebaseCrashlytics.instance.recordError(Exception('shareImage: Invalid argument: ${arguments[1]}'), StackTrace.current);
    }
    FirebaseCrashlytics.instance.recordError(Exception('shareImage: Failed to share image with argument: ${arguments[1]}'), StackTrace.current);
    return false;
  }
}
