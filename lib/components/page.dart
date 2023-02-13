import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/achievement_section.dart';
import 'package:brunstadtv_app/components/error_generic.dart';
import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/see_more.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/sections.graphql.dart';
import 'package:brunstadtv_app/helpers/sections.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/queries/calendar_episode_entries.graphql.dart';
import '../graphql/queries/page.graphql.dart';
import '../helpers/utils.dart';
import '../models/pagination_status.dart';
import '../providers/inherited_data.dart';
import '../providers/todays_calendar_entries.dart';
import 'card_section.dart';
import 'featured_section.dart';
import 'default_grid_section.dart';
import 'message_section.dart';
import 'page_details_section.dart';
import 'poster_grid_section.dart';
import 'icon_section.dart';
import 'label_section.dart';
import 'poster_section.dart';
import 'default_section.dart';
import 'icon_grid_section.dart';
import 'list_section.dart';
import 'page_section.dart';
import 'web_section.dart';

/// How close to the bottom of the page do you have to be before we load more items
const kLoadMoreBottomScrollOffset = 300;

/// How many items do we fetch when we load more items
const kItemsToFetchForPagination = 20;

class BccmPage extends ConsumerStatefulWidget {
  final Future<Query$Page$page> pageFuture;
  final Future Function({bool? retry}) onRefresh;
  final ScrollController? scrollController;

  const BccmPage({
    super.key,
    required this.pageFuture,
    required this.onRefresh,
    this.scrollController,
  });

  @override
  ConsumerState<BccmPage> createState() => _BccmPageState(scrollController ?? ScrollController());
}

class _BccmPageState extends ConsumerState<BccmPage> {
  GlobalKey<State<FutureBuilder<Query$Page$page>>> futureBuilderKey = GlobalKey();
  Map<String, PaginationStatus<Fragment$ItemSectionItem>> paginationMap = {};
  bool loadingBottomSectionItems = false;
  final ScrollController scrollController;

  _BccmPageState(this.scrollController);

  Widget? _getSectionWidget(Fragment$Section s) {
    final extraItems = paginationMap[s.id]?.items;
    final iconSection = s.asOrNull<Fragment$Section$$IconSection>();
    if (iconSection != null) {
      return PageSection.fromFragment(iconSection, child: IconSection(iconSection));
    }
    final labelSection = s.asOrNull<Fragment$Section$$LabelSection>();
    if (labelSection != null) {
      return PageSection.fromFragment(labelSection, child: LabelSection(labelSection));
    }
    final defaultSection = s.asOrNull<Fragment$Section$$DefaultSection>();
    if (defaultSection != null) {
      return PageSection.fromFragment(defaultSection, child: DefaultSection(defaultSection));
    }
    final posterSection = s.asOrNull<Fragment$Section$$PosterSection>();
    if (posterSection != null) {
      return PageSection.fromFragment(posterSection, child: PosterSection(posterSection));
    }
    var defaultGridSection = s.asOrNull<Fragment$Section$$DefaultGridSection>();
    if (defaultGridSection != null) {
      defaultGridSection = defaultGridSection.copyWith(
        items: defaultGridSection.items.copyWith(items: [
          ...defaultGridSection.items.items,
          ...(extraItems?.whereType<Fragment$Section$$DefaultGridSection$items$items>().toList() ?? [])
        ]),
      );
      return PageSection.fromFragment(defaultGridSection, child: DefaultGridSection(defaultGridSection));
    }
    var posterGridSection = s.asOrNull<Fragment$Section$$PosterGridSection>();
    if (posterGridSection != null) {
      posterGridSection = posterGridSection.copyWith(
        items: posterGridSection.items.copyWith(
            items: [...posterGridSection.items.items, ...(extraItems?.whereType<Fragment$Section$$PosterGridSection$items$items>().toList() ?? [])]),
      );
      return PageSection.fromFragment(posterGridSection, child: PosterGridSection(posterGridSection));
    }
    final featuredSection = s.asOrNull<Fragment$Section$$FeaturedSection>();
    if (featuredSection != null) {
      return PageSection.fromFragment(featuredSection, child: FeaturedSection(featuredSection));
    }
    final iconGridSection = s.asOrNull<Fragment$Section$$IconGridSection>();
    if (iconGridSection != null) {
      return PageSection.fromFragment(iconGridSection, child: IconGridSection(iconGridSection));
    }
    var listSection = s.asOrNull<Fragment$Section$$ListSection>();
    if (listSection != null) {
      listSection = listSection.copyWith(
          items: listSection.items
              .copyWith(items: [...listSection.items.items, ...(extraItems?.whereType<Fragment$Section$$ListSection$items$items>().toList() ?? [])]));
      return PageSection.fromFragment(listSection, child: ListSection(listSection));
    }
    final webSection = s.asOrNull<Fragment$Section$$WebSection>();
    if (webSection != null) {
      return PageSection.fromFragment(webSection, child: WebSection(webSection));
    }
    final messageSection = s.asOrNull<Fragment$Section$$MessageSection>();
    if (messageSection != null) {
      return Padding(padding: const EdgeInsets.only(top: 4), child: PageSection.fromFragment(messageSection, child: MessageSection(messageSection)));
    }
    final cardSection = s.asOrNull<Fragment$Section$$CardSection>();
    if (cardSection != null && cardSection.items.items.isNotEmpty) {
      return Padding(padding: const EdgeInsets.only(top: 4), child: PageSection.fromFragment(cardSection, child: CardSection(cardSection)));
    }
    final pageDetailsSection = s.asOrNull<Fragment$Section$$PageDetailsSection>();
    if (pageDetailsSection != null) {
      return Padding(padding: const EdgeInsets.only(top: 4), child: PageDetailsSection(pageDetailsSection));
    }
    final achievementsSection = s.asOrNull<Fragment$Section$$AchievementSection>();
    if (achievementsSection != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: PageSection(
          title: achievementsSection.title,
          description: achievementsSection.description,
          rightSlot: SeeMoreSlot(onTap: () => context.router.navigate(const AchievementsScreenRoute())),
          child: AchievementSection(achievementsSection),
        ),
      );
    }
    return null;
  }

  Widget getPage(context, Query$Page$page pageData) {
    final sectionItems = pageData.sections.items.where((section) {
      if (section.asOrNull<Fragment$ItemSection>()?.items.items.isEmpty == true) {
        return false;
      }
      return true;
    }).toList();
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(padding: mediaQueryData.padding.copyWith(bottom: mediaQueryData.padding.bottom + 32)),
      child: RefreshIndicator(
        edgeOffset: MediaQuery.of(context).padding.top,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        displacement: 40,
        onRefresh: () {
          resetState();
          return widget.onRefresh();
        },
        notificationPredicate: (notification) => true,
        child: NotificationListener<ScrollNotification>(
          onNotification: (t) {
            final approachingBottom = t.metrics.pixels > scrollController.position.maxScrollExtent - kLoadMoreBottomScrollOffset;
            if (!loadingBottomSectionItems && approachingBottom) {
              loadMoreBottomSectionItems();
            }
            return false;
          },
          child: ListView.builder(
            controller: scrollController,
            cacheExtent: 3000,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: sectionItems.length,
            itemBuilder: ((context, index) {
              var s = sectionItems[index];
              final widget = _getSectionWidget(s);
              if (widget != null) {
                return InheritedData<SectionAnalytics>(
                  inheritedData: SectionAnalytics(id: s.id, position: index, type: s.$__typename, name: s.title),
                  child: (context) => widget,
                );
              }
              return const SizedBox.shrink();
            }),
          ),
        ),
      ),
    );
  }

  loadMoreBottomSectionItems() async {
    setState(() {
      loadingBottomSectionItems = true;
    });
    var page = await widget.pageFuture;
    final sectionId = page.sections.items.lastWhereOrNull((element) => sectionIsVertical(element))?.id;
    if (sectionId == null) {
      return;
    }
    await loadMoreItemsForSection(sectionId);
    if (!mounted) return;
    setState(() {
      loadingBottomSectionItems = false;
    });
  }

  loadMoreItemsForSection(String sectionId) async {
    var page = await widget.pageFuture;
    final section = page.sections.items.firstWhereOrNull((element) => element.id == sectionId).asOrNull<Fragment$ItemSection>();
    if (section == null) return;
    final sectionPagination =
        paginationMap[sectionId] ?? PaginationStatus<Fragment$ItemSectionItem>(currentOffset: section.items.offset + section.items.first, items: []);
    if (sectionPagination.reachedMax) {
      return;
    }
    debugPrint('loading more for section $sectionId');
    final result = await ref.read(gqlClientProvider).query$FetchMoreItemsForItemSection(Options$Query$FetchMoreItemsForItemSection(
        variables:
            Variables$Query$FetchMoreItemsForItemSection(id: sectionId, offset: sectionPagination.currentOffset, first: kItemsToFetchForPagination)));
    final items = result.parsedData?.section.asOrNull<Fragment$ItemSection>()?.items.items;

    if (items == null || items.isEmpty) {
      sectionPagination.reachedMax = true;
      setState(() {
        paginationMap[sectionId] = sectionPagination;
      });
      return;
    }
    sectionPagination.items.addAll(items);
    sectionPagination.currentOffset += kItemsToFetchForPagination;
    setState(() {
      paginationMap[sectionId] = sectionPagination;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Query$Page$page>(
      key: futureBuilderKey,
      future: widget.pageFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getPage(context, snapshot.data!);
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return ErrorGeneric(
            onRetry: () {
              resetState();
              widget.onRefresh(retry: true);
            },
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingGeneric();
        }
        return const LoadingGeneric();
      },
    );
  }

  void resetState() {
    setState(() {
      futureBuilderKey = GlobalKey();
      paginationMap = {};
    });
  }
}
