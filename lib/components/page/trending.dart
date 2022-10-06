import 'package:flutter/material.dart';

import '../horizontal_slider.dart';
import '../bordered_image_container.dart';
import 'episode_duration.dart';
import 'seen.dart';

class Trending extends StatelessWidget {
  final dynamic data;

  const Trending({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 19, bottom: 12, left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Text(
              data['title'] as String,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          HorizontalSlider(
            clipBehaviour: Clip.none,
            items: (data['items'] as List<Map<String, dynamic>>).map((item) {
              switch (item['type']) {
                case 'new':
                  return _NewItem(data: item);
                case 'new_episodes':
                  return _NewEpisodesItem(data: item);
                case 'normal':
                  return _NormalItem(data: item);
                default:
                  return Container();
              }
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _NewItem extends StatelessWidget {
  final Map<String, dynamic> data;

  const _NewItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Chipped(
            chipLabel: 'New',
            child: BorderedImageContainer(
              height: 80,
              margin: const EdgeInsets.only(bottom: 4),
              image: NetworkImage(data['image']!),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 12,
                  margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
                  child: Row(
                    children: [
                      if (data['watched']) const Seen(),
                      const Spacer(),
                      EpisodeDuration(duration: data['duration']),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    data['show'].replaceAll(' ', '\u{000A0}'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(110, 176, 230, 1),
                    ),
                  ),
                ),
                if (data['date'] != null)
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: Text(
                      data['date'],
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
            data['episode'],
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class _NewEpisodesItem extends StatelessWidget {
  final Map<String, dynamic> data;

  const _NewEpisodesItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Chipped(
            chipLabel: 'New Episodes',
            child: BorderedImageContainer(
              height: 80,
              margin: const EdgeInsets.only(bottom: 4),
              image: NetworkImage(data['image']!),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              data['show'],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            data['episodesInfo'],
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

class _NormalItem extends StatelessWidget {
  final Map<String, dynamic> data;

  const _NormalItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderedImageContainer(
            height: 80,
            margin: const EdgeInsets.only(bottom: 4),
            image: NetworkImage(data['image']!),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 12,
                margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
                child: Row(
                  children: [
                    if (data['watched']) const Seen(),
                    const Spacer(),
                    EpisodeDuration(duration: data['duration']),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              data['show'],
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(110, 176, 230, 1)),
            ),
          ),
          Text(
            data['episode'],
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
