import 'dart:ui';

import 'package:share_plus/share_plus.dart';

extension ShareUrl on Share {
  Future<void> shareUrl(
    String url, {
    String? title,
    Rect? sharePositionOrigin,
  }) async {
    return Share.share(
      url,
      sharePositionOrigin: sharePositionOrigin,
    );
  }
}
