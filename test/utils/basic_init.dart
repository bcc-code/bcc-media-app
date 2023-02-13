import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';

void basicInit() {
  PackageInfo.setMockInitialValues(
      appName: 'appName',
      packageName: 'packageName',
      version: 'version',
      buildNumber: 'buildNumber',
      buildSignature: 'buildSignature',
      installerStore: 'installerStore');
  TestWidgetsFlutterBinding.ensureInitialized();
}
