import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/constants.dart';
import '../helpers/version.dart';
import '../helpers/extensions.dart';
import '../main.dart';
import '../models/device_info.dart';
import 'auth_state/auth_state.dart';
import 'shared_preferences.dart';

final isPhysicalDeviceProvider = FutureProvider<bool>((ref) {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  Future<bool> future;
  if (Platform.isAndroid) {
    future = deviceInfo.androidInfo.then((val) => val.isPhysicalDevice);
  } else if (Platform.isIOS) {
    future = deviceInfo.iosInfo.then((val) => val.isPhysicalDevice);
  } else {
    return false;
  }
  return future;
});

final deviceInfoProvider = FutureProvider<SupportDeviceInfo?>((ref) async {
  final context = navigatorKey.currentContext;
  if (context == null) {
    return null;
  }

  String? device, manufacturer, os, userId;
  String screenSize, appVer;

  final screenWidth = View.of(context).physicalSize.width.toInt().toString();
  final screenHeight = View.of(context).physicalSize.height.toInt().toString();
  screenSize = '${screenHeight}x$screenWidth';

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  appVer = formatAppVersion(packageInfo);
  userId = ref.watch(authStateProvider).user?.name;

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
    os = '${Platform.operatingSystem.capitalized} ${androidInfo.version.release}';
    device = androidInfo.model;
    manufacturer = androidInfo.manufacturer;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
    os = '${Platform.operatingSystem.capitalized} ${iosInfo.systemVersion}';
    device = iosInfo.model;
    manufacturer = 'Apple';
  } else {
    //Windows or Chrome or Linux
    return null;
  }

  return SupportDeviceInfo(
    device: device,
    envOverride: ref.watch(sharedPreferencesProvider).getString(PrefKeys.envOverride),
    manufacturer: manufacturer,
    os: os,
    screenSize: screenSize,
    appVer: appVer,
    userId: userId,
  );
});
