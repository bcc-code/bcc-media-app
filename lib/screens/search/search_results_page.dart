import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/debouncer.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../graphql/client.dart';
import '../../graphql/queries/search.graphql.dart';
import '../../components/episode_list.dart';
import '../../components/result_programs_list.dart';
import '../../theme/bccm_colors.dart';
import '../../theme/bccm_typography.dart';
import '../../l10n/app_localizations.dart';
import '../../models/analytics/search_performed.dart';
import '../../models/analytics/search_result_clicked.dart';
import '../../providers/analytics.dart';
import '../../providers/inherited_data.dart';

class SearchResultsPage extends ConsumerStatefulWidget {
  final String searchInput;

  const SearchResultsPage(this.searchInput, {super.key}) : assert(searchInput != '');

  @override
  ConsumerState<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends ConsumerState<SearchResultsPage> {
  late Future<Query$Search$search?> _resultFuture;
  final AsyncDebouncer<Query$Search$search?> debouncer = AsyncDebouncer(milliseconds: 150);

  void setResultFuture() {
    final client = ref.read(gqlClientProvider);
    if (widget.searchInput != '') {
      setState(() {
        _resultFuture = debouncer.run(
          () {
            final searchResultFuture = client
                .query$Search(
              Options$Query$Search(
                variables: Variables$Query$Search(queryString: widget.searchInput),
              ),
            )
                .onError((error, stackTrace) {
              throw Error();
            }).then(
              (value) {
                if (value.hasException) {
                  throw ErrorDescription(value.exception.toString());
                }
                return value.parsedData?.search;
              },
            );

            sendSearchPerformedAnalytics(searchResultFuture);

            return searchResultFuture;
          },
        );
      });
    }
  }

  void sendSearchPerformedAnalytics(Future searchResultFuture) {
    final searchStopwatch = Stopwatch()..start();
    searchResultFuture.then((searchResult) {
      if (searchResult == null) {
        return;
      }
      searchStopwatch.stop();
      ref.read(analyticsProvider).searchPerformed(SearchPerformedEvent(
            searchText: widget.searchInput,
            searchLatency: searchStopwatch.elapsedMilliseconds,
            searchResultCount: searchResult.hits,
          ));
    });
  }

  @override
  void initState() {
    super.initState();
    setResultFuture();
  }

  @override
  void didUpdateWidget(SearchResultsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchInput != widget.searchInput) {
      setResultFuture();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InheritedData<SearchAnalytics>(
      inheritedData: SearchAnalytics(searchText: widget.searchInput),
      child: (context) => FutureBuilder<Query$Search$search?>(
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
              return _getNoResultsInfoWidget(context);
            } else {
              final programs = searchResults.whereType<Fragment$SearchResultItem$$ShowSearchItem>().toList();
              final episodes = searchResults.whereType<Fragment$SearchResultItem$$EpisodeSearchItem>().toList();
              return ListView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  if (programs.isNotEmpty) ResultProgramsList(title: S.of(context).programsSection, items: programs),
                  if (episodes.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.only(top: 12, right: 16, left: 16),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        S.of(context).episodes,
                        style: BccmTextStyles.title2,
                      ),
                    ),
                  if (episodes.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: episodes
                            .mapIndexed(
                              (index, e) => InheritedData<SearchItemAnalytics>(
                                inheritedData: SearchItemAnalytics(position: index, type: e.$__typename, id: e.id, group: 'episodes'),
                                child: (context) => GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    context.navigateTo(EpisodeScreenRoute(episodeId: e.id));
                                    ref.read(analyticsProvider).searchResultClicked(context);
                                  },
                                  child: EpisodeListEpisode(
                                    id: e.id,
                                    title: e.title,
                                    ageRating: e.ageRating,
                                    duration: e.duration,
                                    image: e.image,
                                    showTitle: e.showTitle,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
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
      ),
    );
  }

  Widget _getNoResultsInfoWidget(context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icons/Search_Default.png', width: 80, height: 80, fit: BoxFit.fill),
            Text(
              S.of(context).noResults,
              textAlign: TextAlign.center,
              style: BccmTextStyles.body1.copyWith(color: BccmColors.label3),
            )
          ],
        ),
      );
}
