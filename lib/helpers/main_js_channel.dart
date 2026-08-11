import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainJsChannel implements WebViewJsHandler {
  final ProviderContainer ref;
  final StackRouter router;
  final bool enableAuth;
  final WebViewController controller;

  /// The only host allowed to read the access token. The javascript bridge is bound to the
  /// webview controller rather than to a single origin, and is re-injected on every page load,
  /// so any page the webview navigates to can call into this handler.
  final String authorizedHost;

  const MainJsChannel._({required this.router, required this.ref, required this.enableAuth, required this.controller, required this.authorizedHost});

  static void register(BuildContext context, WebViewManager manager, {required bool enableAuth}) {
    final ref = ProviderScope.containerOf(context, listen: false);
    final channel = MainJsChannel._(
      router: context.router,
      ref: ref,
      enableAuth: enableAuth,
      controller: manager.controller,
      authorizedHost: manager.initialUri.host,
    );
    manager.js.registerHandler('main', channel);
    manager.initialUri = manager.initialUri.replace(
      queryParameters: {...manager.initialUri.queryParameters, 'webview_delayed_type': 'flutter_webview_manager'},
    );
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
    if (arguments[1] is! String) {
      throw Exception('Tried to launch with invalid argument: ${arguments[1]}');
    }
    final url = arguments[1] as String;

    // Web content chooses this url, so don't let it reach arbitrary schemes (intent:, app-specific
    // deep links, javascript:, file:, ...) — only the ones a link in a page could reasonably need.
    const allowedSchemes = {'http', 'https', 'mailto', 'tel'};
    final scheme = Uri.tryParse(url)?.scheme.toLowerCase();
    if (scheme == null || !allowedSchemes.contains(scheme)) {
      Sentry.captureException(Exception('Refused to launch url with disallowed scheme: $url'), stackTrace: StackTrace.current);
      return;
    }

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      Sentry.captureException(Exception('Cannot launch url: $url'), stackTrace: StackTrace.current);
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
    return router.maybePop();
  }

  Future<String?> _getAccessToken(List<dynamic> arguments) async {
    if (!enableAuth) {
      Sentry.captureException(Exception('get_access_token requested on a webview that was registered without auth'), stackTrace: StackTrace.current);
      return null;
    }

    // The bridge is re-injected into every page the webview loads, so verify that the page
    // asking for the token is still the one we trusted when the webview was set up.
    final currentUrl = await controller.currentUrl();
    final currentHost = currentUrl == null ? null : Uri.tryParse(currentUrl)?.host;
    if (currentHost == null || currentHost != authorizedHost) {
      Sentry.captureException(
        Exception('get_access_token requested by unauthorized host: $currentHost (expected $authorizedHost)'),
        stackTrace: StackTrace.current,
      );
      return null;
    }

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
        Sentry.captureException(Exception('shareImage: context is null'), stackTrace: StackTrace.current);
        return false;
      }
      await downloadAndShareImage(arguments[1], sharePositionOrigin: iPadSharePositionOrigin(context));
      return true;
    }
    Sentry.captureException(Exception('shareImage: Invalid argument: ${arguments[1]}'), stackTrace: StackTrace.current);
    return false;
  }

  Future<bool> _share(List<dynamic> arguments) async {
    final text = arguments[1];
    if (text is String) {
      final context = router.navigatorKey.currentState?.context;
      if (context == null) {
        Sentry.captureException(Exception('share: context is null'), stackTrace: StackTrace.current);
        return false;
      }
      String? subject;
      if (arguments.length > 2 && arguments[2] is String) {
        subject = arguments[2] as String;
      }
      await Share.share(text, subject: subject, sharePositionOrigin: iPadSharePositionOrigin(context));
      return true;
    }
    Sentry.captureException(Exception('share: Invalid argument: ${arguments[1]}'), stackTrace: StackTrace.current);
    return false;
  }
}
