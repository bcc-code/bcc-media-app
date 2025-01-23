import 'dart:math';

import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/components/misc/horizontal_slider.dart';
import 'package:brunstadtv_app/components/pages/sections/section_item_click_wrapper.dart';
import 'package:brunstadtv_app/components/thumbnails/misc/bordered_image_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_core/design_system.dart';

const marginX = 4.0;

class FeaturedSectionV2 extends ConsumerWidget {
  final Fragment$Section$$FeaturedSection section;

  const FeaturedSectionV2(this.section, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      final filteredItems = section.items.items.where((e) {
        final episode = e.item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
        return episode == null || !episode.locked;
      }).toList();

      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ScrollConfiguration(
          behavior: AnyPointerScrollBehavior(),
          child: kIsWeb || ResponsiveBreakpoints.of(context).largerThan(TABLET)
              ? buildSlider(context, filteredItems, constraints)
              : buildPageView(context, filteredItems, constraints),
        ),
      );
    });
  }

  Widget buildPageView(
    BuildContext context,
    List<Fragment$Section$$FeaturedSection$items$items> sectionItems,
    BoxConstraints constraints,
  ) {
    final viewportFraction = (constraints.maxWidth - (32 - 2 * marginX)) / max(1, constraints.maxWidth);
    return AspectRatio(
      aspectRatio: 358 / 240,
      child: PageView.builder(
        physics: const _CustomPageViewScrollPhysics(),
        controller: PageController(viewportFraction: viewportFraction),
        itemCount: sectionItems.length,
        itemBuilder: (context, index) {
          final item = sectionItems[index % sectionItems.length];
          return SectionItemClickWrapper(
            item: item.item,
            collectionId: section.metadata?.useContext == true && section.metadata?.collectionId != null ? section.metadata!.collectionId : null,
            analytics: SectionItemAnalyticsData(id: item.id, position: index, type: item.$__typename, name: item.title),
            child: AspectRatio(
              aspectRatio: 358 / 240,
              child: _FeaturedItem(
                sectionItem: item,
                margin: const EdgeInsets.symmetric(horizontal: marginX),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildSlider(
    context,
    List<Fragment$Section$$FeaturedSection$items$items> sectionItems,
    BoxConstraints constraints,
  ) {
    const paddingX = kIsWeb ? 80.0 : 16.0;
    const gap = kIsWeb ? 16.0 : 4.0;
    return HorizontalSlider(
      height: 300,
      gap: gap,
      padding: const EdgeInsets.symmetric(horizontal: paddingX),
      itemCount: sectionItems.length,
      itemBuilder: (context, index) {
        final item = sectionItems[index % sectionItems.length];
        return AspectRatio(
          aspectRatio: 358 / 240,
          child: SectionItemClickWrapper(
            item: item.item,
            collectionId: section.metadata?.useContext == true && section.metadata?.collectionId != null ? section.metadata!.collectionId : null,
            analytics: SectionItemAnalyticsData(id: item.id, position: index, type: item.$__typename, name: item.title),
            child: _FeaturedItem(
              sectionItem: item,
              margin: const EdgeInsets.symmetric(horizontal: marginX),
              collectionId: section.metadata?.useContext == true && section.metadata?.collectionId != null ? section.metadata!.collectionId : null,
            ),
          ),
        );
      },
    );
  }
}

class _FeaturedItem extends StatelessWidget {
  final Fragment$Section$$FeaturedSection$items$items sectionItem;
  final EdgeInsetsGeometry? margin;
  final String? collectionId;

  const _FeaturedItem({
    required this.sectionItem,
    this.margin = const EdgeInsets.all(0),
    this.collectionId,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Container(
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: DesignSystem.of(context).colors.separatorOnLight,
        ),
      ),
      margin: margin,
      height: double.infinity,
      child: Stack(children: [
        BorderedImageContainer(
          imageUrl: sectionItem.image,
          borderRadius: BorderRadius.circular(16),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 18).copyWith(bottom: 18, top: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  design.colors.background1.withAlpha(0),
                  design.colors.background1,
                ],
                stops: const [0, 1],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    sectionItem.title,
                    textAlign: TextAlign.center,
                    style: design.textStyles.title1,
                  ),
                ),
                if (sectionItem.description.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      sectionItem.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: design.textStyles.body2.copyWith(color: design.colors.label2),
                    ),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class _CustomPageViewScrollPhysics extends ScrollPhysics {
  const _CustomPageViewScrollPhysics({super.parent});

  @override
  _CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 100,
        stiffness: 1,
        damping: 1,
      );
}
