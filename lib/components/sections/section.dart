import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/see_more.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../graphql/queries/page.graphql.dart';
import '../../router/router.gr.dart';
import 'achievement_section.dart';
import 'icon_section.dart';
import 'page_section.dart';
import 'card_section.dart';
import 'featured_section.dart';
import 'message_section.dart';
import 'page_details_section.dart';
import 'label_section.dart';
import 'icon_grid_section.dart';
import 'list_section.dart';
import 'web_section.dart';
import 'thumbnail_grid/item_section_thumbnail_grid.dart';
import 'thumbnail_slider/item_section_thumbnail_slider.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.section,
    this.extraItems,
  });

  final Fragment$Section section;
  final List<Fragment$ItemSectionItem>? extraItems;

  @override
  Widget build(BuildContext context) {
    final iconSection = section.asOrNull<Fragment$Section$$IconSection>();
    if (iconSection != null) {
      return PageSection.fromFragment(iconSection, child: IconSection(iconSection));
    }
    final labelSection = section.asOrNull<Fragment$Section$$LabelSection>();
    if (labelSection != null) {
      return PageSection.fromFragment(labelSection, child: LabelSection(labelSection));
    }
    final defaultSection = section.asOrNull<Fragment$Section$$DefaultSection>();
    if (defaultSection != null) {
      return PageSection.fromFragment(defaultSection, child: ItemSectionThumbnailSlider.fromDefaultSection(defaultSection));
    }
    final posterSection = section.asOrNull<Fragment$Section$$PosterSection>();
    if (posterSection != null) {
      return PageSection.fromFragment(posterSection, child: ItemSectionThumbnailSlider.fromPosterSection(posterSection));
    }
    var defaultGridSection = section.asOrNull<Fragment$Section$$DefaultGridSection>();
    if (defaultGridSection != null) {
      defaultGridSection = defaultGridSection.copyWith(
        items: defaultGridSection.items.copyWith(items: [
          ...defaultGridSection.items.items,
          ...(extraItems?.whereType<Fragment$Section$$DefaultGridSection$items$items>().toList() ?? [])
        ]),
      );
      return PageSection.fromFragment(defaultGridSection, child: ItemSectionThumbnailGrid.fromDefaultGridSection(defaultGridSection));
    }
    var posterGridSection = section.asOrNull<Fragment$Section$$PosterGridSection>();
    if (posterGridSection != null) {
      posterGridSection = posterGridSection.copyWith(
        items: posterGridSection.items.copyWith(
            items: [...posterGridSection.items.items, ...(extraItems?.whereType<Fragment$Section$$PosterGridSection$items$items>().toList() ?? [])]),
      );
      return PageSection.fromFragment(posterGridSection, child: ItemSectionThumbnailGrid.fromPosterGridSection(posterGridSection));
    }
    final featuredSection = section.asOrNull<Fragment$Section$$FeaturedSection>();
    if (featuredSection != null) {
      return PageSection.fromFragment(featuredSection, child: FeaturedSection(featuredSection));
    }
    final iconGridSection = section.asOrNull<Fragment$Section$$IconGridSection>();
    if (iconGridSection != null) {
      return PageSection.fromFragment(iconGridSection, child: IconGridSection(iconGridSection));
    }
    var listSection = section.asOrNull<Fragment$Section$$ListSection>();
    if (listSection != null) {
      listSection = listSection.copyWith(
          items: listSection.items
              .copyWith(items: [...listSection.items.items, ...(extraItems?.whereType<Fragment$Section$$ListSection$items$items>().toList() ?? [])]));
      return PageSection.fromFragment(listSection, child: ListSection(listSection));
    }
    final webSection = section.asOrNull<Fragment$Section$$WebSection>();
    if (webSection != null) {
      return PageSection.fromFragment(webSection, child: WebSection(webSection));
    }
    final messageSection = section.asOrNull<Fragment$Section$$MessageSection>();
    if (messageSection != null) {
      return Padding(padding: const EdgeInsets.only(top: 4), child: PageSection.fromFragment(messageSection, child: MessageSection(messageSection)));
    }
    final cardSection = section.asOrNull<Fragment$Section$$CardSection>();
    if (cardSection != null && cardSection.items.items.isNotEmpty) {
      return Padding(padding: const EdgeInsets.only(top: 4), child: PageSection.fromFragment(cardSection, child: CardSection(cardSection)));
    }
    final pageDetailsSection = section.asOrNull<Fragment$Section$$PageDetailsSection>();
    if (pageDetailsSection != null) {
      return Padding(padding: const EdgeInsets.only(top: 4), child: PageDetailsSection(pageDetailsSection));
    }
    final achievementsSection = section.asOrNull<Fragment$Section$$AchievementSection>();
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
    return const SizedBox.shrink();
  }
}
