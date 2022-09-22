import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../graphql/client.dart';
import '../../graphql/queries/search.graphql.dart';
import '../../components/episode_list.dart';
import '../../components/result_programs_list.dart';

class SearchResultsPage extends ConsumerStatefulWidget {
  final String _searchInput;

  const SearchResultsPage(this._searchInput);

  @override
  ConsumerState<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends ConsumerState<SearchResultsPage> {
  late Future<Query$Search$search?> _resultFuture;

  @override
  void didUpdateWidget(SearchResultsPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    final client = ref.read(gqlClientProvider);

    if (widget._searchInput != '') {
      _resultFuture = client
          .query$Search(
        Options$Query$Search(
          variables: Variables$Query$Search(queryString: widget._searchInput),
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
    if (widget._searchInput == '') {
      return _noInputInfoWidget;
    } else {
      return FutureBuilder<Query$Search$search?>(
        future: _resultFuture,
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
              return _noResultsInfoWidget;
            } else {
              final programs = searchResults
                  .whereType<Fragment$SearchResultItem$$ShowSearchItem>()
                  .toList();
              final episodes = searchResults
                  .whereType<Fragment$SearchResultItem$$EpisodeSearchItem>()
                  .toList();
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

  final _noResultsInfoWidget = Center(
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

  final _noInputInfoWidget = Center(
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
}
