import 'package:flutter/material.dart';

class EpisodeListVertical extends StatelessWidget {
  final String listTitle;
  final List<Map<String, String>> _episodes = List.filled(10, {
    'series': 'Fra Kåre til BUK',
    'episodeName': '25. august - PROMO: Høstcamp og Romjulscamp',
    'imageUrl':
        'https://brunstadtv.imgix.net/c7b34d9c-d961-4326-9686-d480d461b54c.jpg',
    'ageGroup': '12+',
    'duration': '43 min',
  });

  EpisodeListVertical(this.listTitle);

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
            listTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        ..._episodes.map((episode) {
          return _EpisodeVertical(episode);
        }).toList()
      ],
    );
  }
}

class _EpisodeVertical extends StatelessWidget {
  final Map<String, String> _episode;

  const _EpisodeVertical(this._episode);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(_episode['imageUrl'] as String, height: 72),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    _episode['series'] as String,
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
                      _episode['episodeName'] as String,
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
                        _episode['ageGroup'] as String,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.1,
                        ),
                      ),
                    ),
                    Text(
                      _episode['duration'] as String,
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
