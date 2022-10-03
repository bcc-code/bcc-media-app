import 'package:flutter/material.dart';

import '../graphql/queries/search.graphql.dart';
import 'inner_bordered_image.dart';

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
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
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
    return Container(
      height: 98,
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InnerBorderedImage(
            width: 128,
            height: 128 * (9 / 16),
            margin: const EdgeInsets.only(right: 16),
            image:
                _episode.image != null ? NetworkImage(_episode.image!) : null,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_episode.showTitle != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      _episode.showTitle!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(110, 176, 230, 1),
                      ),
                    ),
                  ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      _episode.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14),
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
                        color: const Color.fromRGBO(29, 40, 56, 1),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(204, 221, 255, 0.1),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Text(
                        _ageGroup,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.1,
                        ),
                      ),
                    ),
                    Text(
                      _duration,
                      style: const TextStyle(
                        color: Color.fromRGBO(180, 192, 210, 1),
                        fontSize: 12,
                      ),
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
