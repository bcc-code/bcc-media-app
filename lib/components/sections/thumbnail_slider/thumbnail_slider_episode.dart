import 'package:flutter/material.dart';

import '../../../models/episode_thumbnail_data.dart';
import '../../../theme/bccm_colors.dart';
import '../../../theme/bccm_typography.dart';
import '../thumbnail/episode_thumbnail.dart';

class ThumbnailSliderEpisode extends StatelessWidget {
  final EpisodeThumbnailData episode;
  final bool showSecondaryTitle;
  final Size imageSize;
  final bool isLive;

  const ThumbnailSliderEpisode({
    super.key,
    required this.episode,
    required this.imageSize,
    required this.showSecondaryTitle,
    this.isLive = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EpisodeThumbnail.withSize(
            episode: episode,
            imageSize: imageSize,
            isLive: isLive,
          ),
          if (showSecondaryTitle)
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: Row(
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
                ],
              ),
            ),
          Text(
            episode.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: BccmTextStyles.caption1.copyWith(color: BccmColors.label1),
          )
        ],
      ),
    );
  }
}
