import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'episode_list.dart';
import 'result_programs_list.dart';

class SearchResultsPage extends StatefulWidget {
  final String searchInput;

  const SearchResultsPage(this.searchInput);

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  var results = true;

  var programList = List.filled(10, {
    'programName': 'Fra Kåre til BUK Fra Kåre til BUK',
    'imageUrl':
        'https://brunstadtv.imgix.net/c7b34d9c-d961-4326-9686-d480d461b54c.jpg',
    'url': '',
  });

  var episodeList = List.filled(10, {
    'programName': 'Fra Kåre til BUK',
    'episodeName': '25. august - PROMO: Høstcamp og Romjulscamp',
    'imageUrl':
        'https://brunstadtv.imgix.net/c7b34d9c-d961-4326-9686-d480d461b54c.jpg',
    'ageGroup': '12+',
    'duration': '43 min',
  });

  @override
  Widget build(BuildContext context) {
    if (widget.searchInput == '') {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: const Text(
            'You can search all content from BrunstadTV.  Series, videos and episodes.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(180, 192, 210, 1),
            ),
          ),
        ),
      );
    } else if (results) {
      return ListView(
        children: [
          ResultProgramsList(title: 'Programs', items: programList),
          EpisodeList(title: 'Episodes', items: episodeList),
        ],
      );
    } else {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icons/Search_Default.png',
                width: 80, height: 80, fit: BoxFit.fill),
            const Text(
              'No results found',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(180, 192, 210, 1),
              ),
            )
          ],
        ),
      );
    }
  }
}
