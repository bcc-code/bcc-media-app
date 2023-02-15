import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:flutter/material.dart';

import '../theme/bccm_colors.dart';
import '../helpers/utils.dart';
import '../l10n/app_localizations.dart';
import 'bordered_image_container.dart';

class EpisodeListEpisode extends StatelessWidget {
  const EpisodeListEpisode({
    super.key,
    required this.id,
    required this.title,
    this.image,
    this.showTitle,
    required this.ageRating,
    required this.duration,
    this.showSecondaryTitle = true,
  });
  final String id;
  final String title;
  final String? image;
  final String? showTitle;
  final String ageRating;
  final int duration;
  final bool showSecondaryTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderedImageContainer(imageUrl: image, width: 128, margin: const EdgeInsets.only(right: 16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showSecondaryTitle && showTitle != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      showTitle!,
                      style: BccmTextStyles.caption2.copyWith(color: BccmColors.tint1),
                    ),
                  ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      title,
                      style: BccmTextStyles.caption1.copyWith(color: BccmColors.label1),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (ageRating != 'A')
                      Container(
                        margin: const EdgeInsets.only(right: 6),
                        height: 16,
                        padding: const EdgeInsets.only(right: 4, bottom: 2, left: 4),
                        decoration: BoxDecoration(
                          color: BccmColors.background2,
                          border: Border.all(
                            width: 1,
                            color: BccmColors.separatorOnLight,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(
                          getFormattedAgeRating(ageRating),
                          style: BccmTextStyles.caption2.copyWith(color: BccmColors.onTint, height: 1.1),
                        ),
                      ),
                    Text(
                      '${Duration(seconds: duration).inMinutes} ${S.of(context).minutesShort}',
                      style: BccmTextStyles.caption2.copyWith(color: BccmColors.label3),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
