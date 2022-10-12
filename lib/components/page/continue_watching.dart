import 'package:flutter/material.dart';

import '../horizontal_slider.dart';
import '../bordered_image_container.dart';

class ContinueWatching extends StatelessWidget {
  final dynamic data;

  const ContinueWatching({super.key, required this.data});

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
            items: (data['items'] as List<Map<String, dynamic>>)
                .map((item) => _Item(small: data['small'], data: item))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool small;
  final double imageHeight;

  const _Item({super.key, required this.data, this.small = false})
      : imageHeight = small ? 80 : 208;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              BorderedImageContainer(
                height: imageHeight,
                margin: const EdgeInsets.only(bottom: 4),
                image: NetworkImage(data['image']!),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
                  child: _WatchProgressIndicator(
                      totalDuration: 100, watchedDuration: 30),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Row(
              children: [
                Expanded(
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
