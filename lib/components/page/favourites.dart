import 'package:brunstadtv_app/components/page/episode_duration.dart';
import 'package:brunstadtv_app/components/page/seen.dart';
import 'package:flutter/material.dart';

import '../horizontal_slider.dart';
import '../bordered_image_container.dart';

class Favourites extends StatelessWidget {
  final dynamic data;

  const Favourites({super.key, required this.data});

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
            items: (data['items'] as List<Map<String, dynamic>>)
                .map((item) => _Item(data: item))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final Map<String, dynamic> data;

  const _Item({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderedImageContainer(
            height: 146,
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
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    data['show']!.replaceAll(' ', '\u{000A0}'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(110, 176, 230, 1),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: Text(
                    data['showInfo']!,
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
            data['episode']!,
            maxLines: 2,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
