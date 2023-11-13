import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/search.graphql.dart';
import 'package:brunstadtv_app/helpers/debouncer.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/analytics/search_performed.dart';
import 'package:brunstadtv_app/models/analytics/search_result_clicked.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/inherited_data.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/grid/episode_grid.dart';
import 'package:kids/helpers/transitions.dart';
import 'package:kids/router/router.gr.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class SliverSearchResults extends HookConsumerWidget {
  const SliverSearchResults({
    super.key,
    required this.searchQuery,
  });

  final String searchQuery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gqlClient = ref.watch(gqlClientProvider);

    final debouncer = useMemoized(() => AsyncDebouncer<Query$Search$search?>(milliseconds: 150));

    final doSearch = useCallback(() {
      final future = gqlClient.query$Search(Options$Query$Search(variables: Variables$Query$Search(queryString: searchQuery))).then((value) {
        if (value.exception != null) {
          throw value.exception!;
        }
        return value.parsedData?.search;
      });

      // analytics
      final searchStopwatch = Stopwatch()..start();
      future.then((searchResult) {
        searchStopwatch.stop();
        ref.read(analyticsProvider).searchPerformed(SearchPerformedEvent(
              searchText: searchQuery,
              searchLatency: searchStopwatch.elapsedMilliseconds,
              searchResultCount: searchResult?.hits ?? 0,
            ));
      });

      return future;
    }, [gqlClient, searchQuery]);

    final retries = useState(0);
    // ignore: exhaustive_keys
    final searchFuture = useMemoized(() => debouncer.run(doSearch), [searchQuery, retries.value]);
    final searchSnapshot = useFuture(searchFuture);

    if (searchSnapshot.hasError) {
      return SliverFillRemaining(
        child: Center(
          child: ErrorGeneric(
            onRetry: () {
              retries.value++;
            },
            details: searchSnapshot.error.toString(),
          ),
        ),
      );
    }
    final searchResult = searchSnapshot.data;
    if (searchSnapshot.connectionState == ConnectionState.waiting || searchResult == null) {
      return const SliverFillRemaining(child: Center(child: LoadingGeneric()));
    }

    final shows = searchResult.result.whereType<Fragment$SearchResultItem$$ShowSearchItem>();
    final episodes = searchResult.result.whereType<Fragment$SearchResultItem$$EpisodeSearchItem>();
    final design = DesignSystem.of(context);

    final small = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    final double basePadding = small ? 24 : 48;
    final headerTextStyle = small ? DesignSystem.of(context).textStyles.title1 : DesignSystem.of(context).textStyles.headline2;

    if (episodes.isEmpty && shows.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Text(
            S.of(context).noResults,
            style: headerTextStyle.copyWith(color: design.colors.label1),
          ),
        ),
      );
    }

    return InheritedData<SearchAnalytics>(
      inheritedData: SearchAnalytics(searchText: searchQuery),
      child: (context) => SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (shows.isNotEmpty) ...[
              if (!small)
                SafeArea(
                  top: false,
                  bottom: false,
                  minimum: EdgeInsets.symmetric(horizontal: basePadding),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      S.of(context).programsSection,
                      style: headerTextStyle.copyWith(color: design.colors.label1),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  scrollDirection: Axis.horizontal,
                  child: SafeArea(
                    bottom: false,
                    top: false,
                    minimum: EdgeInsets.symmetric(horizontal: basePadding),
                    child: Row(
                      children: shows
                          .mapIndexed(
                            (index, item) => Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: GestureDetector(
                                onTap: () {
                                  context.router.push(ShowScreenRoute(showId: item.id));

                                  ref.read(analyticsProvider).searchResultClicked(context,
                                      itemAnalyticsOverride: SearchItemAnalytics(
                                        position: index,
                                        type: item.$__typename,
                                        id: item.id,
                                        group: 'shows',
                                      ));
                                },
                                child: ShowSearchResult(item),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              )
            ],
            if (episodes.isNotEmpty) ...[
              if (shows.isNotEmpty)
                SafeArea(
                  top: false,
                  bottom: false,
                  minimum: EdgeInsets.symmetric(horizontal: basePadding),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: small ? 0 : 8),
                      child: Text(
                        S.of(context).episodes,
                        style: headerTextStyle.copyWith(color: design.colors.label1),
                      ),
                    ),
                  ),
                ),
              SafeArea(
                top: false,
                bottom: true,
                minimum: EdgeInsets.symmetric(horizontal: basePadding),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: EpisodeGrid(
                    onTap: (item, index, morphKey) {
                      currentMorphKey = morphKey;
                      context.router.push(EpisodeScreenRoute(id: item.id));

                      ref.read(analyticsProvider).searchResultClicked(context,
                          itemAnalyticsOverride: SearchItemAnalytics(
                            position: index,
                            type: 'Episode',
                            id: item.id,
                            group: 'episodes',
                          ));
                    },
                    items: episodes
                        .map(
                          (e) => EpisodeGridItem(
                            id: e.id,
                            title: e.title,
                            image: e.image,
                            duration: e.duration,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              SizedBox(height: basePadding),
            ],
          ],
        ),
      ),
    );
  }
}

class ShowSearchResult extends StatelessWidget {
  const ShowSearchResult(
    this.item, {
    super.key,
  });

  final Fragment$SearchResultItem$$ShowSearchItem item;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final small = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    final image = item.$show.posterImage ?? item.image;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: small ? 110 : 200),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: small ? 110 : 200,
              height: small ? 164 : 300,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (image != null)
                    Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(
                          child: Container(color: design.colors.separator2)
                              .animate(onComplete: (c) => c.forward(from: 0))
                              .shimmer(duration: 1000.ms)
                              .callback(delay: 1000.ms, duration: 250.ms, callback: (c) => true),
                        ),
                        simpleFadeInImage(url: image).animate().fadeIn(),
                      ],
                    )
                  else
                    Container(color: design.colors.separator2),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            style: (small ? design.textStyles.body3 : design.textStyles.body1).copyWith(color: design.colors.label1),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
