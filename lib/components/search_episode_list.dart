import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';

import '../graphql/queries/search.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/utils.dart';
import '../l10n/app_localizations.dart';
import '../services/utils.dart';
import 'bordered_image_container.dart';

class EpisodeList extends StatelessWidget {
  final List<EpisodeListEpisodeData> items;

  const EpisodeList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((episode) {
        return _Episode(episode);
      }).toList(),
    );
  }
}

class EpisodeListEpisodeData {
  EpisodeListEpisodeData({required this.id, required this.title, this.image, this.showTitle, required this.ageRating, required this.duration});
  final String id;
  final String title;
  final String? image;
  final String? showTitle;
  final String ageRating;
  final int duration;
}

class _Episode extends StatelessWidget {
  final EpisodeListEpisodeData _episode;

  const _Episode(this._episode);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.navigateTo(EpisodeScreenRoute(episodeId: _episode.id)),
      child: Container(
        height: 98,
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BorderedImageContainer(imageUrl: _episode.image, width: 128, margin: const EdgeInsets.only(right: 16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_episode.showTitle != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        _episode.showTitle!,
                        style: BtvTextStyles.caption2.copyWith(color: BtvColors.tint1),
                      ),
                    ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        _episode.title,
                        style: BtvTextStyles.caption1.copyWith(color: BtvColors.label1),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 6),
                        height: 16,
                        padding: const EdgeInsets.only(right: 4, bottom: 2, left: 4),
                        decoration: BoxDecoration(
                          color: BtvColors.background2,
                          border: Border.all(
                            width: 1,
                            color: BtvColors.separatorOnLight,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(
                          getFormattedAgeRating(_episode.ageRating),
                          style: BtvTextStyles.caption2.copyWith(color: BtvColors.onTint, height: 1.1),
                        ),
                      ),
                      Text(
                        '${Duration(seconds: _episode.duration).inMinutes} ${S.of(context).minutesShort}',
                        style: BtvTextStyles.caption2.copyWith(color: BtvColors.label3),
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
