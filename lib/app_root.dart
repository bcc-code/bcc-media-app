import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/graphql/queries/devices.graphql.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'graphql/client.dart';

class AppRoot extends ConsumerStatefulWidget {
  const AppRoot({super.key, required this.child, required this.navigatorKey});

  final Widget? child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppRootState();
}

class _AppRootState extends ConsumerState<AppRoot> {
  void _handleMessage(RemoteMessage message, {bool? openedFromBackground}) {
    var navigatorContext = widget.navigatorKey.currentState?.context;
    var notification = message.notification;
    if (openedFromBackground != true &&
        notification != null &&
        message.data['show_in_app'] == true &&
        navigatorContext != null) {
      showDialog(
          context: navigatorContext,
          builder: (context) {
            return SimpleDialog(
                title: Text(
              notification.title ?? '',
              style: BtvTextStyles.title3,
            ));
          });
    }
    if (message.data['command'] == 'deeplink') {
      //context.router.navigate();
      if (message.data.containsKey('path') && message.data['path'] is String) {
        String path = message.data['path'];
        navigatorContext?.router.navigateNamed(path);
      }
    }
  }

  void _handleMessageOpenedFromBackground(RemoteMessage message) {
    _handleMessage(message, openedFromBackground: true);
  }

  Future _setupPushNotifications() async {
    var result = await FirebaseMessaging.instance.requestPermission();
    print(result.toString());
    var token = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: false, badge: false, sound: true);

    if (token != null) {
      var result = await ref.read(gqlClientProvider).mutate$SetDeviceToken(
          Options$Mutation$SetDeviceToken(
              variables: Variables$Mutation$SetDeviceToken(token: token)));
      debugPrint(result.data?.toString());
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      ref.read(gqlClientProvider).mutate$SetDeviceToken(
          Options$Mutation$SetDeviceToken(
              variables: Variables$Mutation$SetDeviceToken(token: fcmToken)));
      print('fcm token refreshed: $fcmToken');

      const storage = FlutterSecureStorage();
      storage.write(key: 'fcm_token', value: fcmToken);
      print('fcm token refreshed and stored: $fcmToken');
    }).onError((err) {
      print('error onTokenRefresh');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessage(message);
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification?.title}');
      }
    });

    var initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessageOpenedFromBackground(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp
        .listen((message) => _handleMessageOpenedFromBackground(message));
  }

  @override
  void initState() {
    super.initState();
    _setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox.shrink();
  }
}
