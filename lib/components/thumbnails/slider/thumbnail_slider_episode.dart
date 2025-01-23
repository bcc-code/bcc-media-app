import 'package:flutter/material.dart';

import '../../../models/episode_thumbnail_data.dart';
import 'package:bccm_core/design_system.dart';

import '../episode_thumbnail.dart';

class ThumbnailSliderEpisode extends StatelessWidget {
  final EpisodeThumbnailData episode;
  final bool showSecondaryTitle;
  final Size imageSize;

  const ThumbnailSliderEpisode({
    super.key,
    required this.episode,
    required this.imageSize,
    required this.showSecondaryTitle,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    return SizedBox(
      width: imageSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EpisodeThumbnail.withSize(
            episode: episode,
            imageSize: imageSize,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                style: design.textStyles.caption2.copyWith(color: design.colors.tint1),
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
                  style: design.textStyles.caption1.copyWith(color: design.colors.label1),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
