import 'package:flutter/material.dart';

import '../../../graphql/queries/page.graphql.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/episode_thumbnail_data.dart';
import '../../../theme/design_system/design_system.dart';

import '../thumbnail/episode_thumbnail.dart';

class ThumbnailGridEpisode extends StatelessWidget {
  final Fragment$GridSectionItem sectionItem;
  final Fragment$GridSectionItem$item$$Episode episode;
  final double aspectRatio;
  final bool showSecondaryTitle;
  final bool isLive;

  const ThumbnailGridEpisode({
    super.key,
    required this.sectionItem,
    required this.episode,
    required this.showSecondaryTitle,
    this.isLive = false,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4),
          child: EpisodeThumbnail.withWidth(
            episode: EpisodeThumbnailData(
              image: sectionItem.image,
              duration: episode.duration,
              locked: episode.locked,
              progress: episode.progress,
              publishDate: episode.publishDate,
            ),
            imageWidth: double.infinity,
            aspectRatio: aspectRatio,
          ),
        ),
        if (showSecondaryTitle)
          Row(
            children: [
              if (episode.season != null)
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: Text(
                      episode.season!.$show.title.replaceAll(' ', '\u{000A0}'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: DesignSystem.of(context).textStyles.caption2.copyWith(color: DesignSystem.of(context).colors.tint1),
                    ),
                  ),
                ),
              if (episode.season != null)
                Text(
                  '${S.of(context).seasonLetter}${episode.season!.number}:${S.of(context).episodeLetter}${episode.number}',
                  style: DesignSystem.of(context).textStyles.caption2,
                ),
            ],
          ),
        Container(
          margin: const EdgeInsets.only(bottom: 2),
          child: Text(
            sectionItem.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: DesignSystem.of(context).textStyles.caption1.copyWith(color: DesignSystem.of(context).colors.label1),
          ),
        ),
      ],
    );
  }
}
