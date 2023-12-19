import 'package:flutter_riverpod/flutter_riverpod.dart';

bool _isAndroidTv = false;
void setIsAndroidTv(bool value) {
  _isAndroidTv = value;
}

bool get isAndroidTv => _isAndroidTv;

final isAndroidTvProvider = Provider<bool>((ref) {
  return isAndroidTv;
});
