import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/sections.graphql.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../graphql/queries/page.graphql.dart';
import '../../helpers/extensions.dart';
import '../../helpers/sections.dart';
import '../../models/pagination_status.dart';
import '../../providers/inherited_data.dart';
import 'sections/section_update_handler.dart';

/// How close to the bottom of the page do you have to be before we load more items
const kLoadMoreBottomScrollOffset = 300;

/// How many items do we fetch when we load more items
const kItemsToFetchForPagination = 20;

class PageRenderer extends ConsumerStatefulWidget {
  final Future<Query$Page$page> pageFuture;
  final Future Function({bool? retry}) onRefresh;
  final ScrollController? scrollController;

  const PageRenderer({
    super.key,
    required this.pageFuture,
    required this.onRefresh,
    this.scrollController,
  });

  @override
  ConsumerState<PageRenderer> createState() => _PageRendererState();
}

class _PageRendererState extends ConsumerState<PageRenderer> {
  GlobalKey<State<FutureBuilder<Query$Page$page>>> futureBuilderKey = GlobalKey();
  Map<String, PaginationStatus<Fragment$ItemSectionItem>> paginationMap = {};
  bool loadingBottomSectionItems = false;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = widget.scrollController ?? ScrollController();
  }

  Widget getPage(context, Query$Page$page pageData) {
    final sectionItems = pageData.sections.items;
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
              return InheritedData<SectionAnalytics>(
                inheritedData: SectionAnalytics(id: s.id, position: index, type: s.$__typename, name: s.title),
                child: (context) => SectionUpdateHandler(section: s, extraItems: paginationMap[s.id]?.items),
              );
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
