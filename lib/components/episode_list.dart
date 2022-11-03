import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../graphql/queries/search.graphql.dart';
import '../helpers/btv_colors.dart';
import 'bordered_image_container.dart';

class EpisodeList extends StatelessWidget {
  final String title;
  final List<Fragment$SearchResultItem$$EpisodeSearchItem> items;

  const EpisodeList({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 12, right: 16, bottom: 8, left: 16),
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: BtvTextStyles.title2,
          ),
        ),
        ...items.map((episode) {
          return _Episode(episode);
        }).toList()
      ],
    );
  }
}

class _Episode extends StatelessWidget {
  final Fragment$SearchResultItem$$EpisodeSearchItem _episode;
  final _ageGroup = '12+';
  final _duration = '40 min';

  const _Episode(this._episode);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.navigateTo(EpisodeScreenRoute(episodeId: _episode.id)),
      child: Container(
        height: 98,
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BorderedImageContainer(
                imageUrl: _episode.image,
                width: 128,
                margin: EdgeInsets.only(right: 16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_episode.showTitle != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        _episode.showTitle!,
                        style: BtvTextStyles.caption2
                            .copyWith(color: BtvColors.tint1),
                      ),
                    ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        _episode.title,
                        style: BtvTextStyles.caption1
                            .copyWith(color: BtvColors.label1),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 6),
                        height: 16,
                        padding:
                            const EdgeInsets.only(right: 4, bottom: 2, left: 4),
                        decoration: BoxDecoration(
                          color: BtvColors.background2,
                          border: Border.all(
                            width: 1,
                            color: BtvColors.seperatorOnLight,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(
                          _ageGroup,
                          style: BtvTextStyles.caption2
                              .copyWith(color: BtvColors.onTint, height: 1.1),
                        ),
                      ),
                      Text(
                        _duration,
                        style: BtvTextStyles.caption2
                            .copyWith(color: BtvColors.label3),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
