import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/navigation/navigation_utils.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/graphql/queries/devices.graphql.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/client.dart';
import '../helpers/event_bus.dart';
import '../models/events/app_ready.dart';
import '../theme/design_system/design_system.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref: ref);
});

class NotificationService {
  Ref ref;
  String? fcmToken;
  late StreamSubscription<AppReadyEvent> _appReadySubscription;
  StreamSubscription<RemoteMessage>? _onMessageSubscription;
  StreamSubscription<RemoteMessage>? _onMessageOpenedApp;
  StreamSubscription<String>? _tokenSubscription;
  ProviderSubscription<Settings>? _settingsSubscription;

  NotificationService({required this.ref}) {
    _appReadySubscription = globalEventBus.on<AppReadyEvent>().listen(_onAppReady);
    ref.onDispose(dispose);
  }

  void dispose() {
    _appReadySubscription.cancel();
    _onMessageSubscription?.cancel();
    _onMessageOpenedApp?.cancel();
    _tokenSubscription?.cancel();
    _settingsSubscription?.close();
  }

  /// Request permission and get token to start receiving push notifications
  Future requestPermissionAndSetup() async {
    var result = await FirebaseMessaging.instance.requestPermission();
    print('NotificationStatus: ${result.authorizationStatus}');
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: false, badge: false, sound: true);

    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await _setDeviceToken(token);
    } else {
      debugPrint('FirebaseMessaging.instance.getToken() returned null');
    }
    _setupTokenListeners();
  }

  void _setupTokenListeners() {
    _tokenSubscription ??= FirebaseMessaging.instance.onTokenRefresh.listen(_setDeviceToken)
      ..onError((err) {
        print('error onTokenRefresh');
      });
    _settingsSubscription ??= ref.listen<Settings>(settingsProvider, (old, value) async {
      if (old?.appLanguage != value.appLanguage) {
        var token = await FirebaseMessaging.instance.getToken();
        if (token == null) return;
        _setDeviceToken(token);
      }
    });
  }

  void _onAppReady(AppReadyEvent _) async {
    var initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      debugPrint('Handling initial notification message.');
      _handleMessage(initialMessage, openedFromBackground: true);
    }

    _onMessageSubscription ??= FirebaseMessaging.onMessage.listen(_handleMessage);
    _onMessageOpenedApp ??= FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint('_onMessageOpenedApp');
      _handleMessage(message, openedFromBackground: true);
    });
    debugPrint('Notification listeners set up.');
  }

  Future _setDeviceToken(String token) async {
    debugPrint('Sending FCM token. $token');
    fcmToken = token;
    var result = await ref.read(gqlClientProvider).mutate$SetDeviceToken(Options$Mutation$SetDeviceToken(
        variables: Variables$Mutation$SetDeviceToken(token: token, languages: [ref.read(settingsProvider).appLanguage.languageCode])));
    return result;
  }

  void _handleMessage(RemoteMessage message, {bool openedFromBackground = false}) {
    if (!openedFromBackground) {
      debugPrint('Got a message whilst in the foreground!');
    }
    debugPrint('Message data: ${message.data}, notification: ${message.notification?.title}');
    final context = navigatorKey.currentContext;
    if (context?.mounted != true) {
      debugPrint('Navigator was not mounted while handling an FCM message. Aborting.');
      return;
    }
    final notification = message.notification;
    if (!openedFromBackground && notification != null && message.data['show_in_app'] == true) {
      showDialog(
          context: context!,
          builder: (context) {
            return SimpleDialog(
                title: Text(
              notification.title ?? '',
              style: DesignSystem.of(context).textStyles.title3,
            ));
          });
    } else if (openedFromBackground && message.data['action'] == 'deep_link') {
      if (message.data['deep_link'] is String) {
        String path = message.data['deep_link'];
        debugPrint('navigating to deep_link from notification: $path');
        debugPrint('router in notification handler: ${context!.router.currentPath} ${context.router.currentSegments}');
        context.router.navigateNamedFromRoot(path);
      }
    } else if (message.data['action'] == 'clear_cache') {
      // TODO: implement cache clearing
    }
  }
}
