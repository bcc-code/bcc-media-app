import 'dart:ui';

import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/helpers/translations.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/design_system/design_system.dart';

class DownloadStatusBadge extends StatelessWidget {
  const DownloadStatusBadge(
    this.download, {
    super.key,
  });

  final Download download;

  @override
  Widget build(BuildContext context) {
    return download.status == DownloadStatus.downloading
        ? _DownloadProgressBadge(
            download,
          )
        : _DownloadGenericBadge(
            download,
          );
  }
}

class _DownloadProgressBadge extends StatelessWidget {
  const _DownloadProgressBadge(this.download);

  final Download download;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: design.colors.background1,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3, left: 8),
            child: Text(
              '${(download.fractionDownloaded * 100).round()}%',
              style: design.textStyles.caption1.copyWith(color: design.colors.tint1),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(4).copyWith(left: 8),
            height: 16,
            width: 16,
            child: CircularProgressIndicator(
              strokeAlign: BorderSide.strokeAlignInside,
              value: clampDouble(download.fractionDownloaded, 0, 1),
              strokeWidth: 1.33,
              color: DesignSystem.of(context).colors.tint1,
            ),
          )
        ],
      ),
    );
  }
}

class _DownloadGenericBadge extends StatelessWidget {
  const _DownloadGenericBadge(this.download);

  final Download download;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: design.colors.background1,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 6, left: 8, right: 8),
            child: Text(
              download.status.translate(context),
              style: design.textStyles.caption1.copyWith(
                color: download.status == DownloadStatus.failed ? design.colors.tint2 : design.colors.tint1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
