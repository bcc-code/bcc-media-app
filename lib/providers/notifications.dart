import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';

final notificationServiceProviderOverride = notificationServiceProvider.overrideWith((ref) {
  if (!FlavorConfig.current.enableNotifications) {
    final service = DisabledNotificationService();
    ref.onDispose(service.dispose);
    return service;
  }
  final service = FcmNotificationService(
    localNotificationService: ref.read(localNotificationServiceProvider),
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
    onAppOpenWhenNotificationReceived: null,
    onShowInAppRequested: null,
    onCacheClearRequested: null,
  );
  ref.onDispose(service.dispose);
  return service;
});
