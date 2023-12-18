import 'package:bccm_core/src/features/globals/globals.dart';
import 'package:bccm_core/src/features/providers/package_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_io/io.dart';

import 'features/providers/shared_preferences.dart';

class BccmCore {
  BccmCore._internal();
  factory BccmCore() => _instance;
  static final BccmCore _instance = BccmCore._internal();

  /// Sets up core features and returns a list of overrides that should be passed to ProviderScope.
  /// This method should be called early in main(), after WidgetsFlutterBinding.ensureInitialized().
  ///
  /// Example:
  /// ```
  /// void main() async {
  ///   WidgetsFlutterBinding.ensureInitialized();
  ///   final coreOverrides = await BccmCore().setup();
  ///   runApp(ProviderScope(overrides: coreOverrides, child: MyApp()));
  /// }
  /// ```
  Future<List<Override>> setup() async {
    if (Platform.isAndroid) {
      final androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
      setIsAndroidTv(androidDeviceInfo.systemFeatures.contains('android.software.leanback'));
    }
    return _setupOverrides();
  }

  Future<List<Override>> _setupOverrides() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final packageInfo = await PackageInfo.fromPlatform();
    return [
      sharedPreferencesProvider.overrideWith((ref) => sharedPrefs),
      packageInfoProvider.overrideWith((ref) => packageInfo),
    ];
  }
}
