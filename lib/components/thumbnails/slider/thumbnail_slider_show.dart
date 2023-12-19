import 'package:flutter/material.dart';

import 'package:bccm_core/platform.dart';
import '../../../l10n/app_localizations.dart';

import 'package:bccm_core/design_system.dart';

import '../show_thumbnail.dart';

class ThumbnailSliderShow extends StatelessWidget {
  final Fragment$ItemSectionItem sectionItem;
  final Fragment$ItemSectionItem$item$$Show show;
  final Size imageSize;
  final bool showSeasonEpisodeCounts;

  // TODO: Remove this
  final bool hasNewEpisodes = false;

  const ThumbnailSliderShow({
    super.key,
    required this.sectionItem,
    required this.show,
    required this.imageSize,
    required this.showSeasonEpisodeCounts,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return SizedBox(
      width: imageSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowThumbnail.withSize(
            imageSize: imageSize,
            sectionItem: sectionItem,
            hasNewEpisodes: hasNewEpisodes,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              sectionItem.title,
              style: design.textStyles.caption1.copyWith(color: design.colors.label1),
            ),
          ),
          if (showSeasonEpisodeCounts)
            Text(
              '${show.seasonCount} ${S.of(context).seasons} - ${show.episodeCount} ${S.of(context).episodes}',
              style: design.textStyles.caption2,
            )
        ],
      ),
    );
  }
}
