import 'package:brunstadtv_app/components/pages/sections/section_renderer.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:bccm_core/platform.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:bccm_core/bccm_core.dart';
import '../../helpers/sections.dart';
import '../../models/pagination_status.dart';
import 'sections/section_update_handler.dart';

/// How close to the bottom of the page do you have to be before we load more items
const kLoadMoreBottomScrollOffset = 1000;

/// How many items do we fetch when we load more items
const kItemsToFetchForPagination = 40;

class PageRenderer extends HookConsumerWidget {
  final Future<Query$Page$page>? pageFuture;
  final Future Function({bool? retry}) onRefresh;
  final ScrollController? scrollController;

  const PageRenderer({
    super.key,
    required this.pageFuture,
    required this.onRefresh,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sc = scrollController ?? useScrollController();
    final snapshot = useFuture(pageFuture);
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const LoadingGeneric();
    }
    if (snapshot.hasData) {
      return _PageRendererImpl(
        page: snapshot.data!,
        onRefresh: onRefresh,
        scrollController: sc,
      );
    } else if (snapshot.hasError) {
      return ErrorGeneric(
        onRetry: () {
          onRefresh(retry: true);
        },
      );
    }
    return const LoadingGeneric();
  }
}

class _PageRendererImpl extends HookConsumerWidget {
  final Query$Page$page page;
  final Future Function({bool? retry}) onRefresh;
  final ScrollController scrollController;

  const _PageRendererImpl({
    required this.page,
    required this.onRefresh,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionItems = page.sections.items;
    final mediaQueryData = MediaQuery.of(context);
    final paginationMap = useState<Map<String, PaginationStatus<Fragment$ItemSectionItem>>>({});
    final loadingBottomSectionItems = useState(false);

    loadMoreItemsForSection(String sectionId) async {
      final section = page.sections.items.firstWhereOrNull((element) => element.id == sectionId).asOrNull<Fragment$ItemSection>();
      if (section == null) return;
      final sectionPagination = paginationMap.value[sectionId] ??
          PaginationStatus<Fragment$ItemSectionItem>(currentOffset: section.items.offset + section.items.first, items: []);
      if (sectionPagination.reachedMax) {
        return;
      }
      debugPrint('loading more for section $sectionId');
      final result = await ref.read(bccmGraphQLProvider).query$FetchMoreItemsForItemSection(Options$Query$FetchMoreItemsForItemSection(
          variables: Variables$Query$FetchMoreItemsForItemSection(
              id: sectionId, offset: sectionPagination.currentOffset, first: kItemsToFetchForPagination)));
      final items = result.parsedData?.section.asOrNull<Fragment$ItemSection>()?.items.items;

      if (items == null || items.isEmpty) {
        sectionPagination.reachedMax = true;
        paginationMap.value[sectionId] = sectionPagination;
        return;
      }
      sectionPagination.items.addAll(items);
      sectionPagination.currentOffset += kItemsToFetchForPagination;
      paginationMap.value[sectionId] = sectionPagination;
    }

    loadMoreBottomSectionItems() async {
      loadingBottomSectionItems.value = true;
      await tryCatchRecordErrorAsync(() async {
        final sectionId = page.sections.items.lastWhereOrNull((element) => sectionIsVertical(element))?.id;
        if (sectionId == null) return;
        await loadMoreItemsForSection(sectionId);
      });
      if (!context.mounted) return;
      loadingBottomSectionItems.value = false;
    }

    final hasScrolled = useState(false);

    return MediaQuery(
      data: mediaQueryData.copyWith(padding: mediaQueryData.padding.copyWith(bottom: mediaQueryData.padding.bottom + 32)),
      child: RefreshIndicator(
        edgeOffset: MediaQuery.of(context).padding.top,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        displacement: 40,
        onRefresh: () {
          paginationMap.value = {};
          hasScrolled.value = false;
          return onRefresh();
        },
        notificationPredicate: (notification) => true,
        child: NotificationListener<ScrollNotification>(
          onNotification: (t) {
            final approachingBottom = t.metrics.pixels > scrollController.position.maxScrollExtent - kLoadMoreBottomScrollOffset;
            if (!loadingBottomSectionItems.value && approachingBottom) {
              loadMoreBottomSectionItems();
            }
            if (!hasScrolled.value && t.metrics.pixels > 0) {
              hasScrolled.value = true;
            }
            return false;
          },
          child: ListView.builder(
            controller: scrollController,
            cacheExtent: mediaQueryData.size.height * 0.3,
            physics: const AlwaysScrollableScrollPhysics(),
            semanticChildCount: sectionItems.length,
            itemCount: sectionItems.length + 1,
            itemBuilder: ((context, index) {
              if (index == sectionItems.length) {
                if (loadingBottomSectionItems.value) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 32, bottom: 64),
                    child: LoadingGeneric(),
                  );
                } else {
                  return const SizedBox(height: 32);
                }
              }
              var s = sectionItems[index];
              return SectionAnalytics(
                data: SectionAnalyticsData(id: s.id, position: index, type: s.$__typename, name: s.title),
                builder: (context) => SectionUpdateHandler(
                  section: s,
                  extraItems: paginationMap.value[s.id]?.items,
                  builder: (context, section, extraItems) {
                    return Animate(
                      delay: !hasScrolled.value ? Duration(milliseconds: index * 100) : Duration.zero,
                      effects: [
                        MoveEffect(
                          begin: const Offset(0, 15),
                          duration: 1500.ms,
                          curve: Curves.easeOutExpo,
                        ),
                        FadeEffect(
                          begin: 0.0,
                          duration: 1500.ms,
                          curve: Curves.easeOutExpo,
                        ),
                      ],
                      child: SectionRenderer(section: section, extraItems: extraItems),
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
