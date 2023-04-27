// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'dart:ui';

import 'package:share_plus/share_plus.dart';

extension ShareUrl on Share {
  Future<void> shareUrl(
    String url, {
    String? title,
    Rect? sharePositionOrigin,
  }) async {
    html.window.navigator.share({
      'url': url,
      if (title != null) 'title': title,
    });
  }
}
