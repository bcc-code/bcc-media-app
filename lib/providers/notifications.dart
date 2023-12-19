import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:brunstadtv_app/providers/graphql.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  if (!FlavorConfig.current.enableNotifications) {
    final service = DisabledNotificationService();
    ref.onDispose(service.dispose);
    return service;
  }
  final service = FcmNotificationService(
    onTokenChanged: (token) async {
      debugPrint('Sending FCM token. $token');
      await ref.read(bccmGraphQLProvider).mutate$SetDeviceToken(
            Options$Mutation$SetDeviceToken(
              variables: Variables$Mutation$SetDeviceToken(
                token: token,
                languages: [ref.read(settingsProvider).appLanguage.languageCode],
              ),
            ),
          );
    },
  );
  ref.onDispose(service.dispose);
  return service;
});
