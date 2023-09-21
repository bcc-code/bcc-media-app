import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/models/offline/download_quality.dart';

import '../l10n/app_localizations.dart';

String translateDownloadQuality(S strings, DownloadQuality quality) {
  switch (quality) {
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

String translateDownloadStatus(S strings, DownloadStatus status) {
  switch (status) {
    case DownloadStatus.downloading:
      return "Downloading";
    case DownloadStatus.failed:
      return "Failed";
    case DownloadStatus.finished:
      return "Finished";
    case DownloadStatus.paused:
      return "Paused";
    case DownloadStatus.queued:
      return "Queued";
    case DownloadStatus.removing:
      return "Removing";
    default:
      return '?';
  }
}
