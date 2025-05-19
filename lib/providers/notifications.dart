import 'dart:io';

import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

final notificationServiceProviderOverride = notificationServiceProvider.overrideWith((ref) {
  if (!FlavorConfig.current.enableNotifications) {
    final service = DisabledNotificationService();
    ref.onDispose(service.dispose);
    return service;
  }
  final service = FcmNotificationService(
    onAppOpenWhenNotificationReceived: null,
    localNotificationService: Platform.isAndroid ? ref.read(localNotificationServiceProvider) : null,
    refRead: ref.read,
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
      await ref.read(bccmGraphQLProvider).mutate$SetDeviceTokenV2(
            Options$Mutation$SetDeviceTokenV2(
              variables: Variables$Mutation$SetDeviceTokenV2(
                token: token,
                languages: [ref.read(settingsProvider).appLanguage.languageCode],
                os: await getDeviceTokenOSEnum(),
                appBuildNumber: int.tryParse(ref.read(packageInfoProvider).buildNumber) ?? 0,
              ),
            ),
          );
    },
  );
  ref.onDispose(service.dispose);
  return service;
});

Future<Enum$OS> getDeviceTokenOSEnum() async {
  if (Platform.isAndroid) {
    return Enum$OS.Android;
  }
  if (Platform.isIOS) {
    final platformIsIpad = await isIpad();
    return platformIsIpad ? Enum$OS.iPadOS : Enum$OS.iOS;
  }
  return Enum$OS.unknown;
}

Future<bool> isIpad() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  return iosInfo.model.toLowerCase().contains('ipad');
}
