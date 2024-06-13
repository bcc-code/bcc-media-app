import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/components/episode/list/episode_list_episode.dart';
import 'package:brunstadtv_app/components/status/error_adaptive.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/router/router_utils.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bccm_core/design_system.dart';

class ContributionsList extends HookConsumerWidget {
  const ContributionsList({
    super.key,
    required this.personId,
    required this.type,
  });

  final String personId;
  final String? type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offset = useState(0);
    final items = useState<List<Fragment$Contribution?>>([]);
    final future = useState<Future<QueryResult<Query$GetContributions>?>?>(null);
    final snapshot = useFuture(future.value);
    final fetchingMore = useState(false);
    final shouldAutoFetchMore = useState(true);

    fetchMore() async {
      final f = fetchingMore.value;
      if (f) return;
      fetchingMore.value = true;
      future.value = () async {
        final client = ref.read(bccmGraphQLProvider);
        QueryResult<Query$GetContributions> result;
        try {
          result = await client.query$GetContributions(
            Options$Query$GetContributions(
              variables: Variables$Query$GetContributions(
                id: personId,
                offset: offset.value,
                contentTypes: type != null ? [type!] : null,
              ),
              fetchPolicy: FetchPolicy.networkOnly,
              errorPolicy: ErrorPolicy.all,
            ),
          );
        } finally {
          fetchingMore.value = false;
        }
        if (result.hasException) {
          throw result.exception!;
        }

        final newPage = result.parsedData?.person.contributions;
        if (newPage != null) {
          offset.value += newPage.items.length;
          items.value = [
            ...items.value,
            ...newPage.items,
          ];
        }
        if (newPage == null || newPage.items.isEmpty) {
          shouldAutoFetchMore.value = false;
        }
        return result;
      }();
    }

    useOnInit(fetchMore);

    final scrollController = PrimaryScrollController.of(context);
    useEffect(() {
      scrollListener() {
        if (scrollController.position.extentAfter < 500) {
          if (!shouldAutoFetchMore.value) return;
          fetchMore();
        }
      }

      scrollController.addListener(scrollListener);
      return () => scrollController.removeListener(scrollListener);
    }, []);

    if (items.value.isEmpty && snapshot.connectionState != ConnectionState.done) {
      return const LoadingGeneric();
    }

    if (items.value.isEmpty && snapshot.hasError) {
      return ErrorAdaptive(
        exception: snapshot.error?.asOrNull<OperationException>(),
        onRetry: fetchMore,
      );
    }

    Future<void> playRandom() async {
      final result = await ref.read(bccmGraphQLProvider).query$GetRandomContribution(
            Options$Query$GetRandomContribution(
              variables: Variables$Query$GetRandomContribution(
                id: personId,
                contentTypes: type != null ? [type!] : null,
              ),
            ),
          );
      final item = result.parsedData?.person.contributions.items.firstOrNull?.item;
      if (item == null) return;
      if (!context.mounted) return;
      navigateToContributionItem(context, item);

      ref.read(analyticsProvider).interaction(InteractionEvent(
            interaction: 'play_random_clicked',
            pageCode: 'contributor',
            contextElementId: personId,
            contextElementType: 'person',
            meta: {
              'contentType': type,
              'itemId': item.asOrNull<Fragment$ContributionItemId>()?.id,
            },
          ));
    }

    final design = DesignSystem.of(context);
    return Animate(
      effects: [
        FadeEffect(
          duration: 1200.ms,
          curve: Curves.easeOutExpo,
        )
      ],
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).countItems(snapshot.data?.parsedData?.person.contributions.total ?? 0),
                      style: design.textStyles.caption1.copyWith(color: design.colors.label4),
                    ),
                  ),
                  design.buttons.small(
                    variant: ButtonVariant.secondary,
                    onPressed: playRandom,
                    labelText: S.of(context).playRandom,
                    image: SvgPicture.string(SvgIcons.playSmall),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.builder(
              itemCount: items.value.length + 1,
              itemBuilder: (context, index) {
                if (index == items.value.length) {
                  if (snapshot.connectionState != ConnectionState.waiting) {
                    return const SizedBox.shrink();
                  }
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 56, top: 32, left: 16, right: 16),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                final contribution = items.value.elementAtOrNull(index);
                if (contribution == null) {
                  return const SizedBox.shrink();
                }
                return _ContributionListItem(
                  personId: personId,
                  contribution: contribution,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ContributionListItem extends StatelessWidget {
  const _ContributionListItem({
    required this.personId,
    required this.contribution,
    required this.index,
  });

  final int index;
  final Fragment$Contribution contribution;
  final String personId;

  @override
  Widget build(BuildContext context) {
    final chapter = contribution.item.asOrNull<Fragment$Contribution$item$$Chapter>();
    if (chapter != null) {
      final episode = chapter.episode;
      if (episode == null) {
        return const SizedBox.shrink();
      }
      return _ItemClickWrapper(
        personId: personId,
        contribution: contribution,
        analytics: SectionItemAnalyticsData(
          id: chapter.id,
          position: index,
          type: chapter.$__typename,
          name: chapter.title,
        ),
        child: EpisodeListEpisode(
          id: episode.id,
          ageRating: episode.ageRating,
          duration: chapter.duration,
          showTitle: episode.title,
          showSecondaryTitle: true,
          title: chapter.title,
          image: chapter.image ?? episode.image,
        ),
      );
    }
    final episode = contribution.item.asOrNull<Fragment$Contribution$item$$Episode>();
    if (episode != null) {
      return _ItemClickWrapper(
        personId: personId,
        contribution: contribution,
        analytics: SectionItemAnalyticsData(
          id: episode.id,
          position: index,
          type: episode.$__typename,
          name: episode.title,
        ),
        child: EpisodeListEpisode(
          id: episode.id,
          ageRating: episode.ageRating,
          duration: episode.duration,
          showTitle: episode.season?.$show.title ?? S.of(context).episode,
          showSecondaryTitle: true,
          title: episode.title,
          image: episode.image,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

class _ItemClickWrapper extends ConsumerWidget {
  const _ItemClickWrapper({
    Key? key,
    required this.personId,
    required this.contribution,
    required this.analytics,
    required this.child,
  }) : super(key: key);

  final Fragment$Contribution contribution;
  final String personId;
  final SectionItemAnalyticsData analytics;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SectionItemAnalytics(
      data: analytics,
      builder: (context) => FocusableControlBuilder(
        cursor: SystemMouseCursors.click,
        hitTestBehavior: HitTestBehavior.opaque,
        onPressed: () {
          navigateToContributionItem(context, contribution.item);
          ref.read(analyticsProvider).sectionItemClicked(context);
        },
        builder: (context, control) => child,
      ),
    );
  }
}
