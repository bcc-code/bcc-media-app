import 'package:universal_io/io.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
