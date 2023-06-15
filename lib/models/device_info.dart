import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class SupportDeviceInfo {
  final String? device;
  final String? envOverride;
  final String? manufacturer;
  final String? os;
  final String screenSize;
  final String appVer;
  final String? userId;

  const SupportDeviceInfo({
    required this.device,
    required this.envOverride,
    required this.manufacturer,
    required this.os,
    required this.screenSize,
    required this.appVer,
    required this.userId,
  });

  Map<String, String?> asMap(BuildContext cxt) => {
        S.of(cxt).deviceInfoDevice: device,
        S.of(cxt).deviceInfoEnvOverride: envOverride,
        S.of(cxt).deviceInfoManufacturer: manufacturer,
        S.of(cxt).deviceInfoOs: os,
        S.of(cxt).deviceInfoScreenSize: screenSize,
        S.of(cxt).deviceInfoAppVer: appVer,
        S.of(cxt).deviceInfoUserId: userId,
      };
}
