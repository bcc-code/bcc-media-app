import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MainJsChannel implements WebViewJsHandler {
  final ProviderContainer ref;
  final StackRouter router;
  final bool enableAuth;
  const MainJsChannel._({required this.router, required this.ref, required this.enableAuth});

  static void register(BuildContext context, WebViewManager manager, {required bool enableAuth}) {
    final ref = ProviderScope.containerOf(context, listen: false);
    final channel = MainJsChannel._(router: context.router, ref: ref, enableAuth: enableAuth);
    manager.js.registerHandler('main', channel);
    manager.initialUri = manager.initialUri.replace(queryParameters: {
      ...manager.initialUri.queryParameters,
      'webview_delayed_type': 'flutter_webview_manager',
    });
  }

  get supportedFeatures => {
        'navigate': true,
        'push': true,
        'exit': true,
        'get_access_token': enableAuth,
        'get_locale': true,
        'share_image': true,
        'share': true,
        'haptic_feedback': true,
        'launch_url': true,
        'get_supported_features': true,
      };

  @override
  Object? handleMessage(List<dynamic> arguments) {
    if (arguments.isEmpty) {
      throw Exception('Invalid arguments: $arguments');
    }
    final command = arguments[0];
    if (command is! String) {
      throw Exception('Invalid command: $command');
    }

    switch (command) {
      case 'navigate':
        return _navigate(arguments);
      case 'push':
        return _push(arguments);
      case 'exit':
        return _exit(arguments);
      case 'get_access_token':
        return _getAccessToken(arguments);
      case 'get_locale':
        return _getLocale(arguments);
      case 'share_image':
        return _shareImage(arguments);
      case 'share':
        return _share(arguments);
      case 'haptic_feedback':
        return _hapticFeedback(arguments);
      case 'launch_url':
        return _launchUrl(arguments);
      case 'get_supported_features':
        return _getSupportedFeatures(arguments);
    }
    return null;
  }

  Map<String, bool> _getSupportedFeatures(List<dynamic> arguments) {
    return supportedFeatures;
  }

  Future _launchUrl(List<dynamic> arguments) async {
    if (arguments[1]! is String) {
      throw Exception('Tried to launch with invalid argument: ${arguments[1]}');
    }
    final url = arguments[1] as String;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      FirebaseCrashlytics.instance.recordError(Exception('Cannot launch url: $url'), StackTrace.current);
    }
  }

  Future _navigate(List<dynamic> arguments) {
    if (arguments[1] is String) {
      return router.navigateNamedFromRoot(arguments[1]);
    }
    throw Exception('Tried to navigate with invalid argument: ${arguments[1]}');
  }

  Future _push(List<dynamic> arguments) async {
    if (arguments[1] is String) {
      return router.pushNamed(arguments[1], includePrefixMatches: true);
    }
    throw Exception('Tried to push with invalid argument: ${arguments[1]}');
  }

  Future _exit(List<dynamic> arguments) async {
    return router.pop();
  }

  String? _getAccessToken(List<dynamic> arguments) {
    debugPrint('delivering access token to js');
    return ref.read(authStateProvider).auth0AccessToken;
  }

  String _getLocale(List arguments) {
    return ref.read(settingsProvider).appLanguage.languageCode;
  }

  Future _hapticFeedback(List<dynamic> arguments) {
    if (arguments[1] is! String) {
      throw Exception('hapticFeedback: first argument isnt string: ${arguments[1]}');
    }

    final type = arguments[1] as String;
    switch (type) {
      case 'vibrate':
        return CustomHapticFeedback.vibrate();
      case 'lightImpact':
        return CustomHapticFeedback.lightImpact();
      case 'mediumImpact':
        return CustomHapticFeedback.mediumImpact();
      case 'heavyImpact':
        return CustomHapticFeedback.heavyImpact();
      case 'selectionClick':
        return CustomHapticFeedback.selectionClick();
    }

    throw Exception('hapticFeedback: invalid argument ${arguments[1]}');
  }

  Future<bool> _shareImage(List<dynamic> arguments) async {
    if (arguments[1] is String) {
      final context = router.navigatorKey.currentState?.context;
      if (context == null) {
        FirebaseCrashlytics.instance.recordError(Exception('shareImage: context is null'), StackTrace.current);
        return false;
      }
      await downloadAndShareImage(arguments[1], sharePositionOrigin: iPadSharePositionOrigin(context));
      return true;
    }
    FirebaseCrashlytics.instance.recordError(Exception('shareImage: Invalid argument: ${arguments[1]}'), StackTrace.current);
    return false;
  }

  Future<bool> _share(List<dynamic> arguments) async {
    final text = arguments[1];
    if (text is String) {
      final context = router.navigatorKey.currentState?.context;
      if (context == null) {
        FirebaseCrashlytics.instance.recordError(Exception('share: context is null'), StackTrace.current);
        return false;
      }
      String? subject;
      if (arguments.length > 2 && arguments[2] is String) {
        subject = arguments[2] as String;
      }
      await Share.share(text, subject: subject, sharePositionOrigin: iPadSharePositionOrigin(context));
      return true;
    }
    FirebaseCrashlytics.instance.recordError(Exception('share: Invalid argument: ${arguments[1]}'), StackTrace.current);
    return false;
  }
}
