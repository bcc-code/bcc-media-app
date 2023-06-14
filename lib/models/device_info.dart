import 'dart:collection';

class SupportDeviceInfo extends UnmodifiableMapView<String, String?> {
  final String? device;
  final String? envOverride;
  final String? manufacturer;
  final String? os;
  final String screenSize;
  final String appVer;
  final String? userId;

  SupportDeviceInfo({
    required this.device,
    required this.envOverride,
    required this.manufacturer,
    required this.os,
    required this.screenSize,
    required this.appVer,
    required this.userId,
  }) : super({
          'Device': device,
          'Environment override': envOverride,
          'Manufacturer': manufacturer,
          'Operating System': os,
          'Screen Size': screenSize,
          'App Version': appVer,
          'User ID': userId,
        });
}
