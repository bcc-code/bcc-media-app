import 'dart:ui';

import 'package:share_plus/share_plus.dart';

Future<void> shareUrl(
  String url, {
  String? title,
  Rect? sharePositionOrigin,
}) async {
  await SharePlus.instance.share(
    ShareParams(
      text: url,
      sharePositionOrigin: sharePositionOrigin,
    ),
  );
}
