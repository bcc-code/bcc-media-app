import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/search.graphql.dart';
import 'package:brunstadtv_app/helpers/debouncer.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/grid/episode_grid.dart';

class SearchResults extends HookConsumerWidget {
  const SearchResults({
    super.key,
    required this.searchQuery,
  });

  final String searchQuery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gqlClient = ref.watch(gqlClientProvider);

    final debouncer = useMemoized(() => AsyncDebouncer<Query$Search$search?>(milliseconds: 150));

    final doSearch = useCallback(() {
      final future = gqlClient
          .query$Search(
        Options$Query$Search(
          variables: Variables$Query$Search(queryString: searchQuery),
        ),
      )
          .onError((error, stackTrace) {
        throw Error();
      }).then(
        (value) {
          if (value.exception != null) {
            throw value.exception!;
          }
          return value.parsedData?.search;
        },
      );
      return future;
    }, [gqlClient, searchQuery]);

    final searchFuture = useMemoized(() => debouncer.run(doSearch), [searchQuery]);
    final searchSnapshot = useFuture(searchFuture);

    if (searchSnapshot.connectionState == ConnectionState.waiting || searchSnapshot.connectionState == ConnectionState.none) {
      return const LoadingGeneric();
    }

    final searchResult = searchSnapshot.data;

    if (searchSnapshot.hasError || searchResult == null) {
      return const Center(child: Text('Error'));
    }

    final shows = searchResult.result.whereType<Fragment$SearchResultItem$$ShowSearchItem>();
    final episodes = searchResult.result.whereType<Fragment$SearchResultItem$$EpisodeSearchItem>();
    final design = DesignSystem.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (shows.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SafeArea(
                bottom: false,
                top: false,
                child: Row(
                  children: shows
                      .map(
                        (item) => Padding(padding: const EdgeInsets.only(right: 12), child: ShowSearchResult(item)),
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
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(S.of(context).episodes, style: design.textStyles.title1.copyWith(color: design.colors.label1)),
              ),
            ),
          SafeArea(
            top: false,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: EpisodeGrid(
                onTap: (item, morphKey) {},
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
        ],
      ],
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
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 110),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 110,
              height: 164,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (item.image != null)
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
                        simpleFadeInImage(url: item.image!).animate().fadeIn(),
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
            style: design.textStyles.body3.copyWith(color: design.colors.label1),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
