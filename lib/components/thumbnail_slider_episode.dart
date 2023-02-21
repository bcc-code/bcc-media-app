import 'package:flutter/material.dart';

import '../graphql/queries/page.graphql.dart';

import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';
import 'episode_thumbnail.dart';

class ThumbnailSliderEpisode extends StatelessWidget {
  final Fragment$ItemSectionItem sectionItem;
  final Fragment$ItemSectionItem$item$$Episode episode;
  final bool showSecondaryTitle;
  final Size imageSize;
  final bool isLive;

  const ThumbnailSliderEpisode({
    super.key,
    required this.sectionItem,
    required this.episode,
    required this.imageSize,
    required this.showSecondaryTitle,
    this.isLive = false,
  });

  final bool isNewItem = false;

  @override
  Widget build(BuildContext context) {
    final show = episode.season?.$show;

    return SizedBox(
      width: imageSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EpisodeThumbnail(
            episode: episode,
            image: sectionItem.image,
            imageSize: imageSize,
            isLive: isLive,
          ),
          if (showSecondaryTitle)
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: Row(
                children: [
                  if (show != null)
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: Text(
                          show.title.replaceAll(' ', '\u{000A0}'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BccmTextStyles.caption2.copyWith(color: BccmColors.tint1),
                        ),
                      ),
                    ),
                  /* if (productionDate != null)
                  Text(
                    productionDate,
                    style: BtvTextStyles.caption2,
                  ), */
                ],
              ),
            ),
          Text(
            sectionItem.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: BccmTextStyles.caption1.copyWith(color: BccmColors.label1),
          )
        ],
      ),
    );
  }
}
