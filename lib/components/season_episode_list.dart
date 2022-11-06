import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../graphql/queries/search.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/utils.dart';
import '../l10n/app_localizations.dart';
import '../services/utils.dart';
import 'bordered_image_container.dart';
import 'episode_duration.dart';
import 'watched_badge.dart';

class SeasonEpisodeList extends StatelessWidget {
  final String? title;
  final List<EpisodeListEpisode> items;

  const SeasonEpisodeList({super.key, this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Container(
            padding:
                const EdgeInsets.only(top: 12, right: 16, bottom: 8, left: 16),
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(
              title!,
              style: BtvTextStyles.title2,
            ),
          ),
        ...items
      ],
    );
  }
}

class EpisodeListEpisode extends StatelessWidget {
  final String episodeId;
  final String title;
  final String? image;
  final int? seasonNumber;
  final int? episodeNumber;
  final String ageRating;
  final int duration;
  const EpisodeListEpisode({
    super.key,
    required this.episodeId,
    required this.title,
    this.image,
    this.episodeNumber,
    required this.ageRating,
    required this.duration,
    this.seasonNumber,
  });

  @override
  Widget build(BuildContext context) {
    final secondaryTitle = '${S.of(context).episode} $episodeNumber';
    final tertiaryTitle = episodeNumber != null
        ? '${S.of(context).seasonLetter}$seasonNumber:${S.of(context).episodeLetter}$episodeNumber'
        : null;
    return GestureDetector(
      onTap: () => context.navigateTo(EpisodeScreenRoute(episodeId: episodeId)),
      child: Container(
        height: 98,
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                BorderedImageContainer(width: 128, imageUrl: image),
                /* isComingSoon(episode.productionDate)
                    ? Opacity(
                        opacity: 0.5,
                        child:
                            BorderedImageContainer(imageUrl: sectionItem.image),
                      )
                    : BorderedImageContainer(imageUrl: sectionItem.image),
                if (isComingSoon(episode.productionDate))
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/Wait.png'),
                      ),
                    ),
                  ), */
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 12,
                    margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
                    child: Row(
                      children: [
                        const Spacer(),
                        EpisodeDuration(
                            duration: getFormattedDuration(duration)),
                      ],
                    ),
                  ),
                )),
                /* if (featuredTag != null)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: featuredTag!,
                  ), */
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (episodeNumber != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: secondaryTitle,
                            style: BtvTextStyles.caption2
                                .copyWith(color: BtvColors.tint1)),
                        WidgetSpan(child: SizedBox(width: 4)),
                        TextSpan(
                            text: tertiaryTitle, style: BtvTextStyles.caption1)
                      ])),
                    ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        title,
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
                          getFormattedAgeRating(ageRating),
                          style: BtvTextStyles.caption2
                              .copyWith(color: BtvColors.onTint, height: 1.1),
                        ),
                      ),
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
