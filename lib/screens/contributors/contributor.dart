import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/components/episode/list/episode_list_episode.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/profile/avatar.dart';
import 'package:brunstadtv_app/components/status/error_adaptive.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/tabs/tab_selector.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/status/error_generic.dart';
import 'package:bccm_core/design_system.dart';

@RoutePage<void>()
class ContributorScreen extends HookConsumerWidget {
  const ContributorScreen({
    Key? key,
    @PathParam() required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);

    final personQuery = useQuery$GetPerson(
      Options$Query$GetPerson(variables: Variables$Query$GetPerson(id: id), fetchPolicy: FetchPolicy.networkOnly),
    );
    final person = personQuery.result.parsedData?.person;

    if (personQuery.result.isLoading && person == null) {
      return const Scaffold(body: LoadingGeneric());
    }

    if (person == null) {
      final exception = personQuery.result.exception;
      return Scaffold(
        body: ErrorGeneric(
          onRetry: personQuery.refetch,
          details: exception?.toString(),
        ),
      );
    }

    final filterTabs = <({String name, String? typeCode})>[
      (name: S.of(context).seeAll, typeCode: null),
      ...person.contributionTypes.map((t) => (name: t.type.title, typeCode: t.type.code))
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: filterTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const CustomBackButton(),
          leadingWidth: 92,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPadding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    children: [
                      Avatar(
                        imageUrl: person.image,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 16),
                        child: Text(
                          person.name,
                          style: design.textStyles.title1,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1, color: DesignSystem.of(context).colors.separatorOnLight)),
                        ),
                        child: HookBuilder(
                          builder: (context) {
                            final tabController = DefaultTabController.of(context);
                            useListenable(tabController);
                            return TabSelector(
                              tabs: filterTabs.map((f) => f.name).toList(),
                              selectedIndex: tabController.index,
                              onSelectionChange: (newIndex) => tabController.index = newIndex,
                              padding: const EdgeInsets.only(top: 16, bottom: 8),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: filterTabs
                .map(
                  (f) => _ContributionsList(personId: person.id, type: f.typeCode),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _ContributionsList extends HookConsumerWidget {
  const _ContributionsList({
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
                offset: 0,
                types: type != null ? [type!] : null,
              ),
              fetchPolicy: FetchPolicy.networkOnly,
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

    useEffect(() {
      fetchMore();
    }, []);

    if (snapshot.hasError) {
      return ErrorGeneric(
        onRetry: () {
          fetchMore();
        },
        details: snapshot.error.toString(),
      );
    }

    final c = PrimaryScrollController.of(context);
    useEffect(() {
      fn() {
        if (c.position.extentAfter < 500) {
          if (!shouldAutoFetchMore.value) return;
          fetchMore();
        }
      }

      c.addListener(fn);
      return () => c.removeListener(fn);
    }, []);

    if (items.value.isEmpty && snapshot.connectionState != ConnectionState.done) {
      return const LoadingGeneric();
    }

    if (items.value.isEmpty && snapshot.hasError) {
      return ErrorAdaptive(
        exception: snapshot.error?.asOrNull<OperationException>(),
        onRetry: () {
          fetchMore();
        },
      );
    }

    Future<void> playRandom() async {
      final result = await ref.read(bccmGraphQLProvider).query$GetRandomContribution(
            Options$Query$GetRandomContribution(
              variables: Variables$Query$GetRandomContribution(
                id: personId,
                types: type != null ? [type!] : null,
              ),
            ),
          );
      final item = result.parsedData?.person.contributions.items.firstOrNull?.item;
      if (item == null) return;
      _navigateToItem(context, item);
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
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 56, top: 32, left: 16, right: 16),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }
                final contribution = items.value.elementAtOrNull(index);
                if (contribution == null) {
                  return const SizedBox.shrink();
                }
                final chapter = contribution.item.asOrNull<Fragment$Contribution$item$$Chapter>();
                if (chapter != null) {
                  final episode = chapter.episode;
                  if (episode == null) {
                    return const SizedBox.shrink();
                  }
                  return _ClickWrapper(
                    contribution: contribution,
                    analytics: SectionItemAnalytics(id: chapter.id, type: 'Chapter', position: index),
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
                final episode = items.value.elementAtOrNull(index)?.item.asOrNull<Fragment$Contribution$item$$Episode>();
                if (episode != null) {
                  return _ClickWrapper(
                    contribution: contribution,
                    analytics: SectionItemAnalytics(id: episode.id, type: 'Episode', position: index),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ClickWrapper extends ConsumerWidget {
  const _ClickWrapper({
    Key? key,
    required this.contribution,
    required this.analytics,
    required this.child,
  }) : super(key: key);

  final Fragment$Contribution contribution;
  final SectionItemAnalytics analytics;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InheritedData<SectionItemAnalytics>(
      inheritedData: analytics,
      child: (context) {
        void onPressed() {
          _navigateToItem(context, contribution.item);
        }

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          child: FocusableActionDetector(
            mouseCursor: WidgetStateMouseCursor.clickable,
            actions: {
              ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) => onPressed()),
            },
            child: child,
          ),
        );
      },
    );
  }
}

void _navigateToItem(BuildContext context, Fragment$Contribution$item item) {
  final chapter = item.asOrNull<Fragment$Contribution$item$$Chapter>();
  if (chapter != null) {
    final episode = chapter.episode;
    if (episode == null) return;
    context.navigateTo(
      EpisodeScreenRoute(
        episodeId: episode.id,
        queryParamStartPosition: chapter.start,
        autoplay: true,
      ),
    );
  }
  final ep = item.asOrNull<Fragment$Contribution$item$$Episode>();
  if (ep != null) {
    context.navigateTo(EpisodeScreenRoute(episodeId: ep.id));
  }
}
