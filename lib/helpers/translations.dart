import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/models/offline/download_quality.dart';
import 'package:flutter/widgets.dart';

import '../l10n/app_localizations.dart';

extension DownloadQualityTranslations on DownloadQuality {
  /// Translates using the [S] instance from the [context].
  String translate(BuildContext context) {
    final strings = S.of(context);
    switch (this) {
      case DownloadQuality.low:
        return strings.low;
      case DownloadQuality.medium:
        return strings.medium;
      case DownloadQuality.high:
        return strings.high;
      default:
        return '?';
    }
  }
}

extension DownloadStatusTranslations on DownloadStatus {
  /// Translates using the [S] instance from the [context].
  String translate(BuildContext context) {
    final strings = S.of(context);
    switch (this) {
      case DownloadStatus.downloading:
        return strings.downloading;
      case DownloadStatus.failed:
        return strings.failed;
      case DownloadStatus.finished:
        return strings.finished;
      case DownloadStatus.paused:
        return strings.paused;
      case DownloadStatus.queued:
        return strings.queued;
      case DownloadStatus.removing:
        return strings.removing;
      default:
        return '?';
    }
  }
}
