import 'package:bccm_core/bccm_core.dart';
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
    onAppOpenWhenNotificationReceived: null,
    localNotificationService: ref.read(localNotificationServiceProvider),
    onCacheClearRequested: null,
    onShowInAppRequested: (message) {
      final context = globalNavigatorKey.currentContext;
      if (context == null) {
        debugPrint('No context to open notification');
        return;
      }
      final notification = message?.notification;
      if (notification == null) {
        debugPrint('No notification to open');
        return;
      }
      final title = notification.title;
      final body = notification.body;
      showDialog(
        context: context,
        builder: (c) => SimpleDialog(title: title?.let((t) => Text(t)), children: [
          if (body != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(body),
            ),
        ]),
      );
    },
    onTokenChanged: (token) async {
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
