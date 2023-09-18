import 'package:bccm_player/bccm_player.dart';

import '../l10n/app_localizations.dart';

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
