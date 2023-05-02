import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/episode_thumbnail_data.dart';
import '../../../theme/bccm_colors.dart';
import '../../../theme/bccm_typography.dart';
import '../thumbnail/episode_thumbnail.dart';

class ThumbnailGridEpisode extends StatelessWidget {
  final EpisodeThumbnailData episode;
  final double aspectRatio;
  final bool showSecondaryTitle;
  final bool isLive;

  const ThumbnailGridEpisode({
    super.key,
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
            episode: episode,
            imageWidth: double.infinity,
            aspectRatio: aspectRatio,
          ),
        ),
        if (showSecondaryTitle)
          Row(
            children: [
              if (episode.showTitle != null)
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: Text(
                      episode.showTitle!.replaceAll(' ', '\u{000A0}'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: BccmTextStyles.caption2.copyWith(color: BccmColors.tint1),
                    ),
                  ),
                ),
              if (episode.seasonNumber != null && episode.number != null)
                Text(
                  '${S.of(context).seasonLetter}${episode.seasonNumber}:${S.of(context).episodeLetter}${episode.number}',
                  style: BccmTextStyles.caption2,
                ),
            ],
          ),
        Container(
          margin: const EdgeInsets.only(bottom: 2),
          child: Text(
            episode.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: BccmTextStyles.caption1.copyWith(color: BccmColors.label1),
          ),
        ),
      ],
    );
  }
}
