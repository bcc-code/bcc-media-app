import 'package:flutter/material.dart';

import '../graphql/queries/page.graphql.dart';

import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';
import '../helpers/utils.dart';
import 'section_episode_thumbnail.dart';

class HorizontalSectionEpisode extends StatelessWidget {
  final Fragment$ItemSectionItem sectionItem;
  final Fragment$ItemSectionItem$item$$Episode episode;
  final bool showSecondaryTitle;
  final Size imageSize;
  final bool isLive;

  HorizontalSectionEpisode({
    super.key,
    required this.sectionItem,
    required this.imageSize,
    required this.showSecondaryTitle,
    this.isLive = false,
  }) : episode = sectionItem.item as Fragment$ItemSectionItem$item$$Episode;

  bool get watched => episode.progress != null && episode.progress! > episode.duration * 0.9;

  final bool isNewItem = false;

  @override
  Widget build(BuildContext context) {
    final show = episode.asOrNull<Fragment$EpisodeShow>()?.season?.$show;

    return SizedBox(
      width: imageSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionEpisodeThumbnail(
            imageSize: imageSize,
            isLive: isLive,
            sectionItem: sectionItem,
            watched: watched,
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
