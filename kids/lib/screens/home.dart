import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/models/pagination_status.dart';
import 'package:collection/collection.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/components/page/section_renderer.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// How close to the bottom of the page do you have to be before we load more items
const kLoadMoreBottomScrollOffset = 200;

/// How many items do we fetch when we load more items
const kItemsToFetchForPagination = 40;

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    getPage(bool reloadAppConfig) async {
      final api = ref.read(apiProvider);
      String? pageCode = ref.read(appConfigProvider)?.application.page?.code;
      if (reloadAppConfig == true) {
        ref.invalidate(appConfigFutureProvider);
      }

      final ac = await ref.read(appConfigFutureProvider);
      pageCode = ac.application.page?.code;

      if (pageCode == null) {
        throw Exception('No page code found in app config');
      }

      return api.getPage(pageCode);
    }

    final reloadKey = useState(UniqueKey());
    final reloadAppConfig = useState(false);
    final pageFuture = useMemoized(() => getPage(reloadAppConfig.value), [reloadKey.value]);
    final pageResult = useFuture(pageFuture);
    final page = pageResult.data;

    ref.listen(featureFlagVariantListProvider, (_, __) {
      reloadKey.value = UniqueKey();
    });

    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 20 : 48;
    final double logoHeight = bp.smallerThan(TABLET) ? 28 : 48;
    final isCasting = useListenableSelector(BccmPlayerController.primary, () => BccmPlayerController.primary.isChromecast);

    /// Pagination
    final scrollController = useScrollController();
    final paginationMap = useState<Map<String, PaginationStatus<Fragment$ItemSectionItem>>>({});
    final loadingBottomSectionItems = useState(false);
    final hasScrolled = useState(false);

    loadMoreItemsForSection(String sectionId) async {
      final section = page?.sections.items.firstWhereOrNull((element) => element.id == sectionId).asOrNull<Fragment$ItemSection>();
      if (section == null) return;
      final limit = section.metadata?.limit;
      if (limit != null && section.items.items.length >= limit) {
        return;
      }
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
        final sectionId = page?.sections.items.last.id;
        if (sectionId == null) return;
        if (paginationMap.value[sectionId]?.reachedMax == true) return;
        await loadMoreItemsForSection(sectionId);
      });
      if (!context.mounted) return;
      loadingBottomSectionItems.value = false;
    }

    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: orientation == Orientation.portrait
            ? Container(color: Colors.white)
            : NotificationListener<ScrollNotification>(
                onNotification: (t) {
                  // ignore horizontally scrolling sections
                  if (t.metrics.axis != Axis.vertical) return false;

                  final approachingBottom = t.metrics.pixels > scrollController.position.maxScrollExtent - kLoadMoreBottomScrollOffset;
                  if (!loadingBottomSectionItems.value && approachingBottom) {
                    loadMoreBottomSectionItems();
                  }
                  if (!hasScrolled.value && t.metrics.pixels > 0) {
                    hasScrolled.value = true;
                  }
                  return false;
                },
                child: CustomScrollView(
                  scrollDirection: Axis.vertical,
                  controller: scrollController,
                  slivers: [
                    SliverSafeArea(
                      bottom: false,
                      top: false,
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          color: Colors.white,
                          height: bp.smallerThan(TABLET) ? 88 : 168,
                          padding: EdgeInsets.only(left: basePadding, right: basePadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              design.buttons
                                  .responsive(
                                    onPressed: () {
                                      context.router.pushNamed('/settings');
                                    },
                                    labelText: '',
                                    image: SvgPicture.string(SvgIcons.profile),
                                  )
                                  .animate()
                                  .scale(curve: Curves.easeOutBack, duration: 600.ms)
                                  .rotate(begin: -0.5, end: 0, curve: Curves.easeOutExpo, duration: 1000.ms),
                              Image.asset('assets/flavors/prod/logo_neg.png', height: logoHeight)
                                  .animate()
                                  .slideY(begin: 4, curve: Curves.easeOutExpo, duration: 1000.ms, delay: 300.ms)
                                  .scale(begin: const Offset(0.5, 0.5))
                                  .rotate(begin: 0.05)
                                  .fadeIn(),
                              if (isCasting) ...[
                                design.buttons
                                    .responsive(
                                      variant: ButtonVariant.secondary,
                                      onPressed: () {
                                        BccmPlayerInterface.instance.openExpandedCastController();
                                      },
                                      labelText: '',
                                      image: SvgPicture.string(SvgIcons.cast),
                                    )
                                    .animate()
                                    .scale(curve: Curves.easeOutBack, duration: 600.ms)
                                    .rotate(begin: -0.5, end: 0, curve: Curves.easeOutExpo, duration: 1000.ms),
                              ],
                              design.buttons
                                  .responsive(
                                    onPressed: () {
                                      context.router.pushNamed('/search');
                                    },
                                    labelText: '',
                                    image: SvgPicture.string(SvgIcons.search),
                                  )
                                  .animate()
                                  .scale(curve: Curves.easeOutBack, duration: 600.ms)
                                  .rotate(begin: -0.5, end: 0, curve: Curves.easeOutExpo, duration: 1000.ms),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (pageResult.connectionState == ConnectionState.waiting)
                      const SliverFillRemaining(hasScrollBody: false, child: Center(child: LoadingIndicator()))
                    else if (page == null || pageResult.hasError)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: ErrorGeneric(
                          onRetry: () async {
                            reloadAppConfig.value = true;
                            reloadKey.value = UniqueKey();
                          },
                        ),
                      )
                    else
                      SliverList.builder(
                        itemCount: page.sections.items.length,
                        itemBuilder: (context, index) {
                          final section = page.sections.items[index];
                          return Container(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 0 : basePadding * 2,
                              bottom: index == page.sections.items.length - 1 ? basePadding : 0,
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return SizedBox(
                                  width: constraints.maxWidth,
                                  child: SectionAnalytics(
                                    data: SectionAnalyticsData(id: section.id, position: index, type: section.$__typename),
                                    builder: (context) => SectionUpdateHandler(
                                      section: section,
                                      extraItems: paginationMap.value[section.id]?.items,
                                      builder: (context, section, extraItems) => SectionRenderer(section: section, extraItems: extraItems),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
