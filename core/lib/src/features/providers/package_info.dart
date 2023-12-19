import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod/riverpod.dart';

final packageInfoProvider = StateProvider<PackageInfo>(
  (ref) => throw UnimplementedError('packageInfoProvider should be overriden in main()'),
);
