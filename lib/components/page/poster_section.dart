import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../router/router.gr.dart';
import '../../graphql/queries/page.graphql.dart';
import '../../graphql/schema/pages.graphql.dart';
import '../../services/utils.dart';
import '../bordered_image_container.dart';
import '../horizontal_slider.dart';
import 'feature_tag.dart';
import 'episode_duration.dart';
import 'watch_progress_indicator.dart';
import 'watched.dart';

const Map<Enum$SectionSize, Size> imageSize = {
  Enum$SectionSize.small: Size(140, 208),
  Enum$SectionSize.medium: Size(230, 340),
};

class PosterSection extends StatelessWidget {
  final Fragment$Section$$PosterSection data;

  const PosterSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.title != null)
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              top: 19,
              right: 16,
              bottom: 5,
            ),
            child: Text(
              data.title!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        HorizontalSlider(
          clipBehaviour: Clip.none,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          items: sectionItems,
        ),
      ],
    );
  }

  List<Widget> get sectionItems {
    final sectionItemsList = <Widget>[];
    for (var item in data.items.items) {
      if (item.item
          is Fragment$Section$$PosterSection$items$items$item$$Episode) {
        sectionItemsList
            .add(_PosterEpisodeItem(sectionItem: item, size: data.size));
      } else if (item.item
          is Fragment$Section$$PosterSection$items$items$item$$Show) {
        sectionItemsList
            .add(_PosterShowItem(sectionItem: item, size: data.size));
      }
    }
    return sectionItemsList;
  }
}

class _PosterEpisodeItem extends StatelessWidget {
  final Fragment$Section$$PosterSection$items$items sectionItem;
  final Fragment$Section$$PosterSection$items$items$item$$Episode episode;
  final Enum$SectionSize size;

  // TODO: Remove these temp variables
  bool watched = false;
  bool isLive = true;
  bool isNewItem = false;
  bool showWatchProgressIndicator = false;

  _PosterEpisodeItem({
    required this.sectionItem,
    required this.size,
  }) : episode = sectionItem.item
            as Fragment$Section$$PosterSection$items$items$item$$Episode;

  bool get showFeaturedTag => isLive || isNewItem || isComingSoon;

  bool get isComingSoon {
    if (episode.productionDate == null) {
      return false;
    }
    return DateTime.now().isBefore(DateTime.parse(episode.productionDate!));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router
          .navigate(EpisodeScreenRoute(episodeId: sectionItem.id)),
      child: SizedBox(
        width: imageSize[size]!.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionItemImage,
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: Row(
                children: [
                  if (episode.season != null)
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: Text(
                          episode.season!.$show.title
                              .replaceAll(' ', '\u{000A0}'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(110, 176, 230, 1),
                          ),
                        ),
                      ),
                    ),
                  if (episode.productionDate != null)
                    Text(
                      getFormattedProductionDate(episode.productionDate!),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(112, 124, 142, 1),
                      ),
                    ),
                ],
              ),
            ),
            Text(
              sectionItem.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Widget get sectionItemImage {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: imageSize[size]!.width,
      height: imageSize[size]!.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BorderedImageContainer(
            image: sectionItem.image != null
                ? NetworkImage(sectionItem.image!)
                : null,
          ),
          if (isComingSoon)
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                image: DecorationImage(
                  image: AssetImage('assets/icons/Wait.png'),
                ),
              ),
            ),
          showWatchProgressIndicator
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(left: 4, bottom: 4, right: 4),
                    child: WatchProgressIndicator(
                        totalDuration: episode.duration, watchedDuration: 10),
                  ),
                )
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 12,
                    margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
                    child: Row(
                      children: [
                        if (watched) const Watched(),
                        const Spacer(),
                        EpisodeDuration(
                            duration: getFormattedDuration(episode.duration)),
                      ],
                    ),
                  ),
                ),
          if (showFeaturedTag)
            Positioned(
              top: -4,
              right: -4,
              child: featuredTag!,
            ),
        ],
      ),
    );
  }

  Widget? get featuredTag {
    if (isLive) {
      return const FeatureTag(
        label: 'Live now',
        color: Color.fromRGBO(230, 60, 98, 1),
      );
    } else if (isComingSoon) {
      return const FeatureTag(
        label: 'Coming soon',
        color: Color.fromRGBO(29, 40, 56, 1),
      );
    } else if (isNewItem) {
      return const FeatureTag(
        label: 'New',
        color: Color.fromRGBO(230, 60, 98, 1),
      );
    }
    return null;
  }
}

class _PosterShowItem extends StatelessWidget {
  final Fragment$Section$$PosterSection$items$items sectionItem;
  final Fragment$Section$$PosterSection$items$items$item$$Show show;
  final Enum$SectionSize size;

  bool hasNewEpisodes = true;

  _PosterShowItem({
    required this.sectionItem,
    required this.size,
  }) : show = sectionItem.item
            as Fragment$Section$$PosterSection$items$items$item$$Show;

  @override
  Widget build(BuildContext context) {
    final imageWidget = BorderedImageContainer(
      height: imageSize[size]!.height,
      margin: const EdgeInsets.only(bottom: 4),
      image:
          sectionItem.image != null ? NetworkImage(sectionItem.image!) : null,
    );

    return SizedBox(
      width: imageSize[size]!.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionItemImage,
          Text(
            sectionItem.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget get sectionItemImage {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: imageSize[size]!.width,
      height: imageSize[size]!.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BorderedImageContainer(
            image: sectionItem.image != null
                ? NetworkImage(sectionItem.image!)
                : null,
          ),
          if (hasNewEpisodes)
            const Positioned(
              top: -4,
              right: -4,
              child: FeatureTag(
                label: 'New Episodes',
                color: Color.fromRGBO(230, 60, 98, 1),
              ),
            ),
        ],
      ),
    );
  }
}
