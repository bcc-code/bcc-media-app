import 'package:flutter/material.dart';

import '../../services/utils.dart';
import '../horizontal_slider.dart';
import '../bordered_image_container.dart';
import 'episode_duration.dart';
import 'seen.dart';
import '../../graphql/schema/pages.graphql.dart';
import '../../graphql/queries/page.graphql.dart';

const Map<Enum$SectionSize, Size> imageSize = {
  Enum$SectionSize.small: Size(140, 80),
  Enum$SectionSize.medium: Size(240, 146),
};

class DefaultSection extends StatelessWidget {
  final Fragment$Section$$DefaultSection data;

  const DefaultSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final sectionItems = data.items.items;
    return Padding(
      padding: const EdgeInsets.only(top: 19, bottom: 12, left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.title != null)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                data.title!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          HorizontalSlider(
            clipBehaviour: Clip.none,
            items: sectionItems.map((item) {
              if (item.item
                  is Fragment$Section$$DefaultSection$items$items$item$$Episode) {
                return _DefaultEpisodeItem(sectionItem: item, size: data.size);
              } else if (item.item
                  is Fragment$Section$$DefaultSection$items$items$item$$Show) {
                return _DefaultShowItem(sectionItem: item, size: data.size);
              }
              return Container();
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _DefaultEpisodeItem extends StatelessWidget {
  final Fragment$Section$$DefaultSection$items$items sectionItem;
  final Fragment$Section$$DefaultSection$items$items$item$$Episode episode;
  final Enum$SectionSize size;

  // TODO: Remove these temp variables
  // bool watched = false;
  bool newItem = true;

  _DefaultEpisodeItem({required this.sectionItem, required this.size})
      : episode = sectionItem.item
            as Fragment$Section$$DefaultSection$items$items$item$$Episode;

  @override
  Widget build(BuildContext context) {
    final imageWidget = BorderedImageContainer(
      height: imageSize[size]!.height,
      margin: const EdgeInsets.only(bottom: 4),
      image:
          sectionItem.image != null ? NetworkImage(sectionItem.image!) : null,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 12,
          margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
          child: Row(
            children: [
              // if (watched) const Seen(),
              const Spacer(),
              EpisodeDuration(duration: getFormattedDuration(episode.duration)),
            ],
          ),
        ),
      ),
    );

    return Container(
      width: imageSize[size]!.width,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          newItem
              ? _Chipped(
                  chipLabel: 'New',
                  child: imageWidget,
                )
              : imageWidget,
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    episode.season!.$show.title.replaceAll(' ', '\u{000A0}'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(110, 176, 230, 1),
                    ),
                  ),
                ),
                if (episode.productionDate != null)
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: Text(
                      episode.productionDate!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(112, 124, 142, 1),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Text(
            sectionItem.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class _DefaultShowItem extends StatelessWidget {
  final Fragment$Section$$DefaultSection$items$items sectionItem;
  final Fragment$Section$$DefaultSection$items$items$item$$Show show;
  Enum$SectionSize size;

  // TODO: Remove this
  bool newEpisodes = true;

  _DefaultShowItem({required this.sectionItem, required this.size})
      : show = sectionItem.item
            as Fragment$Section$$DefaultSection$items$items$item$$Show;

  @override
  Widget build(BuildContext context) {
    final imageWidget = BorderedImageContainer(
      height: imageSize[size]!.height,
      margin: const EdgeInsets.only(bottom: 4),
      image:
          sectionItem.image != null ? NetworkImage(sectionItem.image!) : null,
    );

    return Container(
      width: imageSize[size]!.width,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          newEpisodes
              ? _Chipped(
                  chipLabel: 'New Episodes',
                  child: imageWidget,
                )
              : imageWidget,
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              sectionItem.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            '${show.seasonCount} Seasons - ${show.episodeCount} Episodes',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(112, 124, 142, 1),
            ),
          )
        ],
      ),
    );
  }
}

class _Chipped extends StatelessWidget {
  final String chipLabel;
  final Widget child;

  const _Chipped({required this.child, required this.chipLabel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: -4,
          right: -4,
          child: Container(
            padding: const EdgeInsets.only(left: 4, bottom: 2, right: 4),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(230, 60, 98, 1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(204, 221, 255, 0.1),
              ),
            ),
            child: Text(
              chipLabel,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
