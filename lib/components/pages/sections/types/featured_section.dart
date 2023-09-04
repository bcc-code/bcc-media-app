import 'dart:math';

import 'package:brunstadtv_app/components/misc/horizontal_slider.dart';
import 'package:brunstadtv_app/components/pages/sections/section_item_click_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../graphql/queries/calendar_episode_entries.graphql.dart';
import '../../../../helpers/router/router_utils.dart';
import '../../../../helpers/scroll_behaviors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../models/analytics/sections.dart';

import '../../../../graphql/queries/page.graphql.dart';
import '../../../../models/breakpoints.dart';
import '../../../../theme/design_system/design_system.dart';
import '../../../../helpers/extensions.dart';

import '../../../../helpers/images.dart';
import '../../../../helpers/transparent_image.dart';
import '../../../../providers/todays_calendar_entries.dart';

const marginX = 2.0;

class FeaturedSection extends ConsumerWidget {
  final Fragment$Section$$FeaturedSection data;

  const FeaturedSection(this.data, {super.key});

  List<Fragment$Section$$FeaturedSection$items$items> getItemsWithLiveItem(
    List<Fragment$Section$$FeaturedSection$items$items> items,
    Fragment$CalendarEntryEpisode? curLiveEpisode,
  ) {
    if (data.metadata == null || curLiveEpisode == null || !curLiveEpisode.locked) {
      return items;
    }
    if (data.metadata!.prependLiveElement) {
      return [
        Fragment$Section$$FeaturedSection$items$items(
          id: curLiveEpisode.id,
          title: curLiveEpisode.title,
          image: curLiveEpisode.image,
          description: curLiveEpisode.description,
          $__typename: 'SectionItem',
          item: Fragment$Section$$FeaturedSection$items$items$item$$Episode(
            id: curLiveEpisode.id,
            duration: 0,
            progress: 0,
            publishDate: '',
            $__typename: 'Episode',
            locked: curLiveEpisode.locked,
          ),
        ),
        ...items.where((item) => item.id != curLiveEpisode.id)
      ];
    }
    return items;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Fragment$CalendarEntryEpisode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

    return LayoutBuilder(builder: (context, constraints) {
      final filteredItems = data.items.items.where((e) {
        final episode = e.item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
        return episode == null || !episode.locked;
      }).toList();
      final sectionItems = getItemsWithLiveItem(filteredItems, curLiveEpisode);

      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ScrollConfiguration(
          behavior: AnyPointerScrollBehavior(),
          child: kIsWeb || ResponsiveBreakpoints.of(context).largerThan(BP.lg)
              ? buildSlider(context, sectionItems, constraints, curLiveEpisode)
              : buildPageView(context, sectionItems, constraints, curLiveEpisode),
        ),
      );
    });
  }

  Widget buildPageView(
    BuildContext context,
    List<Fragment$Section$$FeaturedSection$items$items> sectionItems,
    BoxConstraints constraints,
    Fragment$CalendarEntryEpisode? curLiveEpisode,
  ) {
    final viewportFraction = (constraints.maxWidth - (32 - 2 * marginX)) / max(1, constraints.maxWidth);
    return SizedBox(
      height: ResponsiveValue(
        context,
        defaultValue: 325.0,
        conditionalValues: [
          const Condition.equals(name: BP.md, value: 380.0),
          const Condition.largerThan(name: BP.md, value: 470.0),
        ],
      ).value,
      child: PageView.builder(
        physics: const _CustomPageViewScrollPhysics(),
        controller: PageController(viewportFraction: viewportFraction),
        itemCount: sectionItems.length,
        itemBuilder: (context, index) {
          final item = sectionItems[index % sectionItems.length];
          return SectionItemClickWrapper(
            item: item.item,
            analytics: SectionItemAnalytics(id: item.id, position: index, type: item.$__typename, name: item.title),
            child: _FeaturedItem(
              sectionItem: item,
              margin: const EdgeInsets.symmetric(horizontal: marginX),
              isLive: item.id == curLiveEpisode?.id,
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
    Fragment$CalendarEntryEpisode? curLiveEpisode,
  ) {
    final numItems = ResponsiveValue(
      context,
      defaultValue: 1,
      conditionalValues: [
        const Condition.equals(name: BP.xl, value: 2),
        const Condition.largerThan(name: BP.xl, value: 3),
      ],
    ).value!;
    const paddingX = kIsWeb ? 80.0 : 16.0;
    const gap = kIsWeb ? 16.0 : 4.0;
    return HorizontalSlider(
      height: 500,
      gap: gap,
      padding: const EdgeInsets.symmetric(horizontal: paddingX),
      itemCount: sectionItems.length,
      itemBuilder: (context, index) {
        final item = sectionItems[index % sectionItems.length];
        return SizedBox(
          width: (constraints.maxWidth - (2 * paddingX) - gap) / numItems,
          child: SectionItemClickWrapper(
            item: item.item,
            analytics: SectionItemAnalytics(id: item.id, position: index, type: item.$__typename, name: item.title),
            child: _FeaturedItem(
              sectionItem: item,
              margin: const EdgeInsets.symmetric(horizontal: marginX),
              isLive: item.id == curLiveEpisode?.id,
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
  final bool isLive;

  const _FeaturedItem({
    required this.sectionItem,
    this.margin = const EdgeInsets.all(0),
    this.isLive = false,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Container(
      margin: margin,
      height: double.infinity,
      child: Stack(children: [
        _GradientImage(image: sectionItem.image),
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
                  design.colors.background1.withOpacity(0),
                  design.colors.background1,
                ],
                stops: const [0, 0.36],
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
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    sectionItem.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: design.textStyles.body2.copyWith(color: design.colors.label2),
                  ),
                ),
                isLive
                    ? design.buttons.smallRed(
                        image: Image.asset('assets/icons/Play.png'),
                        labelText: S.of(context).liveNow,
                        onPressed: () {
                          handleSectionItemClick(context, sectionItem.item);
                        },
                      )
                    : design.buttons.smallSecondary(
                        image: Image.asset('assets/icons/Play.png'),
                        labelText: S.of(context).watchNow,
                        onPressed: () {
                          handleSectionItemClick(context, sectionItem.item);
                        },
                      ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class _GradientImage extends StatelessWidget {
  final String? image;

  const _GradientImage({this.image});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: design.colors.background2,
        ),
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              design.colors.background1.withOpacity(0.23),
              const Color.fromRGBO(26, 37, 53, 0),
              design.colors.background1,
            ],
            stops: const [0, 0.5, 1],
          ),
        ),
        child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
          if (image == null) {
            return const SizedBox.shrink();
          }
          final imageHeight = (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round();
          final imageUri = image == null ? null : getImageUri(image!, height: imageHeight, cropMode: ImageCropMode.center);
          return ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              height: constraints.maxHeight,
              padding: const EdgeInsets.only(bottom: 32),
              child: imageUri == null
                  ? null
                  : FadeInImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      placeholder: MemoryImage(kTransparentImage),
                      image: networkImageWithRetryAndResize(imageUrl: imageUri.toString(), cacheHeight: imageHeight),
                      imageErrorBuilder: imageErrorBuilder,
                      fadeInDuration: const Duration(milliseconds: 200),
                    ),
            ),
          );
        }));
  }
}

class _CustomPageViewScrollPhysics extends ScrollPhysics {
  const _CustomPageViewScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

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
