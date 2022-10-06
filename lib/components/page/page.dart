import 'package:brunstadtv_app/components/icon_label_button.dart';
import 'package:flutter/material.dart';

import './featured.dart';
import './explore_categories.dart';
import './continue_watching.dart';
import './trending.dart';
import './favourites.dart';
import './error_message.dart';
import './kids_bible_stories.dart';

class BccmPage extends StatelessWidget {
  final String code;
  final isLoading = false;
  final hasLoadingError = false;

  BccmPage({super.key, required this.code});

  final sections = [
    {
      'type': 'featured',
      'items': [
        {
          'image': 'https://brunstadtv.imgix.net/FMHD_nett.jpg',
          'title': 'Fem minutter hver dag',
          'subTitle':
              'Hva om du som er ung i dag bruker fem minutter av din tid hver dag, på noe som kan forandre deg som menneske?',
        },
        {
          'image': 'https://brunstadtv.imgix.net/nett_tv.jpg',
          'title': 'Hva venter Gud på?',
          'subTitle':
              'Jerusalem er igjen i jødenes hender, så hva venter Gud på? Og hvordan kan vi benytte tiden fram til Jesu gjenkomst?',
        },
        {
          'image': 'https://brunstadtv.imgix.net/BUK_SC22_nett.jpg',
          'title': 'Forventningens Ånd',
          'subTitle':
              'En unik kveld hvor vi får et innblikk i hvordan man kan leve i forventningens Ånd.',
        },
        {
          'image':
              'https://brunstadtv.imgix.net/poster-VX-423116-20-11-51-08web.jpg',
          'title': 'HEr jeg våken? Er jeg beredt?',
          'subTitle': 'Se tilbakeblikk på en uforglemmelig sommercamp',
        },
        {
          'image': 'https://brunstadtv.imgix.net/BIKI_20220805_nett.jpg',
          'title': '«Hør ham»',
          'subTitle':
              'Hvordan kan vi høre Guds stemme i vårt hjerte? En gripende musikal fra barnemøtet i sommer.',
        },
      ],
    },
    {
      'type': 'error',
      'errorMessage':
          'Live is down due to maintenance, please contact redaksjon@brunstad.tv if you have questions',
    },
    {
      'type': 'explore_categories',
      'title': 'Explore Categories',
      'items': [
        {
          'label': 'Series',
          'image': 'CollectionSeries.png',
        },
        {
          'label': 'Kids',
          'image': 'CollectionKids.png',
        },
        {
          'label': 'Films',
          'image': 'CollectionFilms.png',
        },
        {
          'label': 'Events',
          'image': 'CollectionEvents.png',
        },
        {
          'label': 'Music',
          'image': 'CollectionMusic.png',
        },
        {
          'label': 'Worth watching',
          'image': 'CollectionWorthWatching.png',
        },
      ],
    },
    {
      'type': 'continue_watching',
      'title': 'Continue Watching',
      'items': [
        {
          'show': 'Bible Kids Live',
          'episode': 'Hear Him Musical',
          'image':
              'https://brunstadtv.imgix.net/c2731b93-3df6-43a4-984c-4732a7e7ee25.jpg',
          'watched': 30,
        },
        {
          'show': 'BCC Sommerstevnet',
          'episode': 'Møte 17. juli kl. 11:00',
          'image':
              'https://brunstadtv.imgix.net/1be1dfde-3498-4837-b86e-c92097844a2a.jpg',
          'date': '05. Aug 2022',
          'watched': 50,
        },
        {
          'show': 'Magasinet',
          'episode': 'The Future at Brunstad for the Youth',
          'image': 'https://brunstadtv.imgix.net/2022-04-16.jpg',
          'watched': 10,
        },
        {
          'show': 'Intro',
          'episode': 'HV 276 | Jeg er disippel hos Mesteren',
          'image':
              'https://brunstadtv.imgix.net/e14176d5-a533-4da2-a070-8a9b819ccc7f.jpg',
          'date': '05. Aug 2022',
          'watched': 90,
        },
      ]
    },
    {
      'type': 'trending',
      'title': 'Trending',
      'items': [
        {
          'type': 'new',
          'show': 'Fra Kåre',
          'episode': 'Fem minutter hver dag',
          'image':
              'https://brunstadtv.imgix.net/0f8145be-dbe2-4046-b9e5-7fdab91c6e69.png',
          'date': '12. Sept 2022',
          'watched': true,
          'duration': '1:30:30',
        },
        {
          'type': 'new_episodes',
          'show': 'Battle for the Church',
          'image': 'https://brunstadtv.imgix.net/PAUL_S01_E04_MAS_NOR_N.jpg',
          'episodesInfo': '2 Seasons - 12 Episodes'
        },
        {
          'type': 'normal',
          'show': 'Bibelutforskerne',
          'episode': 'Noah - Gud gir de ydmyke nåde',
          'image': 'https://brunstadtv.imgix.net/2022-04-16.jpg',
          'watched': false,
          'duration': '1:30:30',
        },
        {
          'type': 'normal',
          'show': 'Intro',
          'episode': 'HV 276 | Jeg er disippel hos Mesteren',
          'image':
              'https://brunstadtv.imgix.net/e14176d5-a533-4da2-a070-8a9b819ccc7f.jpg',
          'watched': true,
          'duration': '1:30:30',
        },
      ]
    },
    {
      'type': 'favourites',
      'title': 'Favourites',
      'items': [
        {
          'show': 'Intro',
          'showInfo': '3 Seasons - 8 Episodes',
          'episode': 'HV 276 | Jeg er disippel hos Mesteren',
          'image':
              'https://brunstadtv.imgix.net/e14176d5-a533-4da2-a070-8a9b819ccc7f.jpg',
          'watched': true,
          'duration': '1:30:30',
        },
        {
          'show': 'Bibelutforskerne',
          'showInfo': '3 Seasons - 8 Episodes',
          'episode': 'Noah - Gud gir de ydmyke nåde',
          'image': 'https://brunstadtv.imgix.net/2022-04-16.jpg',
          'watched': false,
          'duration': '1:30:30',
        },
        {
          'show': 'Fra Kåre',
          'showInfo': '3 Seasons - 8 Episodes',
          'episode': 'Fem minutter hver dag',
          'image':
              'https://brunstadtv.imgix.net/0f8145be-dbe2-4046-b9e5-7fdab91c6e69.png',
          'watched': true,
          'duration': '1:30:30',
        },
        {
          'show': 'Battle for the Church',
          'showInfo': '2 Seasons - 12 Episodes',
          'episode': 'Episode 4',
          'image': 'https://brunstadtv.imgix.net/PAUL_S01_E04_MAS_NOR_N.jpg',
          'watched': false,
          'duration': '1:30:30',
        },
      ]
    },
    {
      'type': 'kids_bible_stories',
      'title': 'Kids Bible Stories',
      'items': [
        {
          'show': 'Bibelutforskerne',
          'image': 'https://brunstadtv.imgix.net/2022-04-16.jpg',
        },
        {
          'show': 'Intro',
          'image':
              'https://brunstadtv.imgix.net/e14176d5-a533-4da2-a070-8a9b819ccc7f.jpg',
        },
        {
          'show': 'Fra Kåre',
          'image':
              'https://brunstadtv.imgix.net/0f8145be-dbe2-4046-b9e5-7fdab91c6e69.png',
        },
        {
          'show': 'Battle for the Church',
          'image': 'https://brunstadtv.imgix.net/PAUL_S01_E04_MAS_NOR_N.jpg',
        },
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingContent;
    } else if (hasLoadingError) {
      return loadingError;
    } else {
      return ListView(
        padding: const EdgeInsets.only(top: 12),
        children: sections.map((section) {
          switch (section['type']) {
            case 'featured':
              return Featured(
                  items: section['items'] as List<Map<String, String>>);
            case 'explore_categories':
              return ExploreCategories(data: section);
            case 'continue_watching':
              return ContinueWatching(data: section);
            case 'trending':
              return Trending(data: section);
            case 'favourites':
              return Favourites(data: section);
            case 'kids_bible_stories':
              return KidsBibleStories(data: section);
            case 'error':
              return ErrorMessage(data: section);
            default:
              return Container();
          }
        }).toList(),
      );
    }
  }

  final loadingContent = Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: const CircularProgressIndicator(strokeWidth: 2),
      ),
      const Text(
        'Loading content',
        style: TextStyle(
          color: Color.fromRGBO(112, 124, 142, 1),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ]),
  );

  final loadingError = Center(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: const Text(
              "Couldn't load content",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: const Text(
              'Check internet connection and try again',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(180, 192, 210, 1),
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          IconLabelButton.medium(labelText: 'Try again', onPressed: () {})
        ],
      ),
    ),
  );
}
