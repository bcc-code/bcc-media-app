import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/graphql/client.dart';
import 'package:my_app/graphql/queries/search.graphql.dart';
import 'package:my_app/screens/search/models/search_result_item.dart';

import 'episode_list.dart';
import 'result_programs_list.dart';

class SearchResultsPage extends ConsumerStatefulWidget {
  final String searchInput;

  const SearchResultsPage(this.searchInput);

  @override
  ConsumerState<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends ConsumerState<SearchResultsPage> {
  var results = true;
  late Future<Query$Search$search?> resultFuture;

  @override
  void didUpdateWidget(SearchResultsPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    final client = ref.read(gqlClientProvider);

    if (widget.searchInput != '') {
      resultFuture = client
          .query$Search(
        Options$Query$Search(
          variables: Variables$Query$Search(queryString: widget.searchInput),
        ),
      )
          .onError((error, stackTrace) {
        1;
        throw Error();
      }).then(
        (value) {
          if (value.hasException) {
            throw ErrorDescription(value.exception.toString());
          }
          return value.parsedData?.search;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.searchInput == '') {
      return noInputInfoWidget;
    } else {
      return FutureBuilder<Query$Search$search?>(
        future: resultFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox.square(
                dimension: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasData) {
            var searchResults = snapshot.data!.result;
            if (searchResults.isEmpty) {
              return noResultsInfoWidget;
            } else {
              var results = getResultProgramsEpisodes(searchResults);
              List<SearchResultItem> programs =
                  results['programs'] as List<SearchResultItem>;
              List<SearchResultItem> episodes =
                  results['episodes'] as List<SearchResultItem>;
              return ListView(
                children: [
                  if (programs.isNotEmpty)
                    ResultProgramsList(title: 'Programs', items: programs),
                  if (episodes.isNotEmpty)
                    EpisodeList(title: 'Episodes', items: episodes),
                ],
              );
            }
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(
            child: SizedBox.square(
              dimension: 50,
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
    }
  }

  final noResultsInfoWidget = Center(
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

  final noInputInfoWidget = Center(
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

  Map<String, List<SearchResultItem>> getResultProgramsEpisodes(
      List<Fragment$SearchResultItem> results) {
    List<SearchResultItem> programs = [];
    List<SearchResultItem> episodes = [];

    for (var result in results) {
      var resultItem = SearchResultItem.fromResult(result);
      if (resultItem.type == ResultType.show) {
        programs.add(resultItem);
      } else if (resultItem.type == ResultType.episode) {
        episodes.add(resultItem);
      }
    }

    return {
      'programs': programs,
      'episodes': episodes,
    };
  }
}
