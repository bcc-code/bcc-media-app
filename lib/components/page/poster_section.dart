import '../../graphql/queries/page.graphql.dart';
import '../../graphql/schema/pages.graphql.dart';
import 'package:flutter/material.dart';

import '../horizontal_slider.dart';
import '../bordered_image_container.dart';

const Map<Enum$SectionSize, Size> imageSize = {
  Enum$SectionSize.small: Size(140, 208),
  Enum$SectionSize.medium: Size(230, 340),
};

class PosterSection extends StatelessWidget {
  final Fragment$Section$$PosterSection data;

  const PosterSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
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
            items: data.items.items.map(
              (item) {
                if (item.item
                    is Fragment$Section$$PosterSection$items$items$item$$Episode) {
                  return _PosterEpisodeItem(sectionItem: item, size: data.size);
                } else if (item.item
                    is Fragment$Section$$PosterSection$items$items$item$$Show) {
                  return _PosterShowItem(sectionItem: item, size: data.size);
                }
                return Container();
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class _PosterEpisodeItem extends StatelessWidget {
  final Fragment$Section$$PosterSection$items$items sectionItem;
  final Fragment$Section$$PosterSection$items$items$item$$Episode episode;
  final Enum$SectionSize size;

  _PosterEpisodeItem({
    required this.sectionItem,
    required this.size,
  }) : episode = sectionItem.item
            as Fragment$Section$$PosterSection$items$items$item$$Episode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize[size]!.width,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderedImageContainer(
            height: imageSize[size]!.height,
            margin: const EdgeInsets.only(bottom: 4),
            image: sectionItem.image != null
                ? NetworkImage(sectionItem.image!)
                : null,
            // child: Container(
            //   alignment: Alignment.bottomCenter,
            //   margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
            //   child: _WatchProgressIndicator(
            //       totalDuration: 100, watchedDuration: 30),
            // ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Row(
              children: [
                Expanded(
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
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class _PosterShowItem extends StatelessWidget {
  final Fragment$Section$$PosterSection$items$items sectionItem;
  final Fragment$Section$$PosterSection$items$items$item$$Show show;
  final Enum$SectionSize size;

  _PosterShowItem({
    required this.sectionItem,
    required this.size,
  }) : show = sectionItem.item
            as Fragment$Section$$PosterSection$items$items$item$$Show;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize[size]!.width,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderedImageContainer(
            height: imageSize[size]!.height,
            margin: const EdgeInsets.only(bottom: 4),
            image: sectionItem.image != null
                ? NetworkImage(sectionItem.image!)
                : null,
          ),
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
}

class _WatchProgressIndicator extends StatelessWidget {
  final double totalDuration;
  final double watchedDuration;
  final double watchedFraction;
  String watchedTime = '4:32';

  _WatchProgressIndicator({
    required this.totalDuration,
    required this.watchedDuration,
  }) : watchedFraction = watchedDuration / totalDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(13, 22, 35, 0.7),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(4),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(204, 221, 255, 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: watchedFraction,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Text(
              '4:32',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
