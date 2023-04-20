import 'dart:math';

import 'package:brunstadtv_app/components/horizontal_slider.dart';
import 'package:brunstadtv_app/components/section_item_click_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/queries/calendar_episode_entries.graphql.dart';
import '../helpers/navigation/navigation_utils.dart';
import '../helpers/scroll_behaviors.dart';
import '../l10n/app_localizations.dart';
import '../models/analytics/sections.dart';

import '../graphql/queries/page.graphql.dart';
import '../theme/bccm_colors.dart';
import '../helpers/extensions.dart';
import '../helpers/ui/btv_buttons.dart';
import '../theme/bccm_typography.dart';
import '../helpers/ui/image.dart';
import '../helpers/ui/transparent_image.dart';
import '../providers/todays_calendar_entries.dart';

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
          child: kIsWeb ? buildSlider(sectionItems, constraints, curLiveEpisode) : buildPageView(sectionItems, constraints, curLiveEpisode),
        ),
      );
    });
  }

  Widget buildPageView(
    List<Fragment$Section$$FeaturedSection$items$items> sectionItems,
    BoxConstraints constraints,
    Fragment$CalendarEntryEpisode? curLiveEpisode,
  ) {
    final viewportFraction = (constraints.maxWidth - (32 - 2 * marginX)) / max(1, constraints.maxWidth);
    return SizedBox(
      height: 313,
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
    List<Fragment$Section$$FeaturedSection$items$items> sectionItems,
    BoxConstraints constraints,
    Fragment$CalendarEntryEpisode? curLiveEpisode,
  ) {
    final numItems = constraints.maxWidth > 1000 ? 2 : 1;
    return HorizontalSlider(
      height: 500,
      padding: const EdgeInsets.symmetric(horizontal: 80),
      itemCount: sectionItems.length,
      itemBuilder: (context, index) {
        final item = sectionItems[index % sectionItems.length];
        return SizedBox(
          width: (constraints.maxWidth - (32 - 2 * marginX) - 160) / numItems,
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
                  BccmColors.background1.withOpacity(0),
                  BccmColors.background1,
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
                    style: BccmTextStyles.title1,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    sectionItem.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: BccmTextStyles.body2.copyWith(color: BccmColors.label2),
                  ),
                ),
                isLive
                    ? BtvButton.smallRed(
                        image: Image.asset('assets/icons/Play.png'),
                        labelText: S.of(context).liveNow,
                        onPressed: () {
                          handleSectionItemClick(context, sectionItem.item);
                        },
                      )
                    : BtvButton.smallSecondary(
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
  final height = kIsWeb ? 800.0 : 290.0;

  const _GradientImage({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: BccmColors.background2,
        ),
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              BccmColors.background1.withOpacity(0.23),
              const Color.fromRGBO(26, 37, 53, 0),
              BccmColors.background1,
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
            child: SizedBox(
              height: constraints.maxHeight,
              child: imageUri == null
                  ? null
                  : FadeInImage.memoryNetwork(
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      placeholder: kTransparentImage,
                      image: imageUri.toString(),
                      fadeInDuration: const Duration(milliseconds: 200),
                      imageCacheHeight: imageHeight,
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
