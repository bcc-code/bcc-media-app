import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/misc/see_more.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/components/pages/sections/types/avatar_section.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/platform.dart';
import '../../../router/router.gr.dart';
import 'types/achievement_section.dart';
import 'types/icon_section.dart';
import 'section_with_header.dart';
import 'types/card_section.dart';
import 'types/featured_section.dart';
import 'types/message_section.dart';
import 'types/page_details_section.dart';
import 'types/label_section.dart';
import 'types/icon_grid_section.dart';
import 'types/list_section.dart';
import 'types/web_section.dart';
import 'types/item_section_thumbnail_grid.dart';
import 'types/item_section_thumbnail_slider.dart';

class SectionRenderer extends StatelessWidget {
  const SectionRenderer({
    super.key,
    required this.section,
    this.extraItems,
  });

  final Fragment$Section section;
  final List<Fragment$ItemSectionItem>? extraItems;

  @override
  Widget build(BuildContext context) {
    if (section.asOrNull<Fragment$ItemSection>()?.items.items.isEmpty == true) {
      return const SizedBox.shrink();
    }

    final avatarSection = section.asOrNull<Fragment$Section$$AvatarSection>();
    if (avatarSection != null) {
      return SectionWithHeader.fromFragment(avatarSection, child: AvatarSection(avatarSection));
    }
    final iconSection = section.asOrNull<Fragment$Section$$IconSection>();
    if (iconSection != null) {
      return SectionWithHeader.fromFragment(iconSection, child: IconSection(iconSection));
    }
    final labelSection = section.asOrNull<Fragment$Section$$LabelSection>();
    if (labelSection != null) {
      return SectionWithHeader.fromFragment(labelSection, child: LabelSection(labelSection));
    }
    final defaultSection = section.asOrNull<Fragment$Section$$DefaultSection>();
    if (defaultSection != null) {
      return SectionWithHeader.fromFragment(defaultSection, child: ItemSectionThumbnailSlider.fromDefaultSection(defaultSection));
    }
    final posterSection = section.asOrNull<Fragment$Section$$PosterSection>();
    if (posterSection != null) {
      return SectionWithHeader.fromFragment(posterSection, child: ItemSectionThumbnailSlider.fromPosterSection(posterSection));
    }
    var defaultGridSection = section.asOrNull<Fragment$Section$$DefaultGridSection>();
    if (defaultGridSection != null) {
      defaultGridSection = defaultGridSection.copyWith(
        items: defaultGridSection.items.copyWith(items: [
          ...defaultGridSection.items.items,
          ...(extraItems?.whereType<Fragment$Section$$DefaultGridSection$items$items>().toList() ?? [])
        ]),
      );
      return SectionWithHeader.fromFragment(defaultGridSection, child: ItemSectionThumbnailGrid.fromDefaultGridSection(defaultGridSection));
    }
    var posterGridSection = section.asOrNull<Fragment$Section$$PosterGridSection>();
    if (posterGridSection != null) {
      posterGridSection = posterGridSection.copyWith(
        items: posterGridSection.items.copyWith(
            items: [...posterGridSection.items.items, ...(extraItems?.whereType<Fragment$Section$$PosterGridSection$items$items>().toList() ?? [])]),
      );
      return SectionWithHeader.fromFragment(posterGridSection, child: ItemSectionThumbnailGrid.fromPosterGridSection(posterGridSection));
    }
    final featuredSection = section.asOrNull<Fragment$Section$$FeaturedSection>();
    if (featuredSection != null) {
      return SectionWithHeader.fromFragment(featuredSection, child: FeaturedSection(featuredSection));
    }
    final iconGridSection = section.asOrNull<Fragment$Section$$IconGridSection>();
    if (iconGridSection != null) {
      return SectionWithHeader.fromFragment(iconGridSection, child: IconGridSection(iconGridSection));
    }
    var listSection = section.asOrNull<Fragment$Section$$ListSection>();
    if (listSection != null) {
      listSection = listSection.copyWith(
          items: listSection.items
              .copyWith(items: [...listSection.items.items, ...(extraItems?.whereType<Fragment$Section$$ListSection$items$items>().toList() ?? [])]));
      return SectionWithHeader.fromFragment(listSection, child: ListSection(listSection));
    }
    final webSection = section.asOrNull<Fragment$Section$$WebSection>();
    if (webSection != null) {
      //if (isTablet) return const SizedBox.shrink();
      return SectionWithHeader.fromFragment(webSection, child: WebSection(webSection));
    }
    final messageSection = section.asOrNull<Fragment$Section$$MessageSection>();
    if (messageSection != null) {
      return Padding(
          padding: const EdgeInsets.only(top: 4), child: SectionWithHeader.fromFragment(messageSection, child: MessageSection(messageSection)));
    }
    final cardSection = section.asOrNull<Fragment$Section$$CardSection>();
    if (cardSection != null && cardSection.items.items.isNotEmpty) {
      return Padding(padding: const EdgeInsets.only(top: 4), child: SectionWithHeader.fromFragment(cardSection, child: CardSection(cardSection)));
    }
    final pageDetailsSection = section.asOrNull<Fragment$Section$$PageDetailsSection>();
    if (pageDetailsSection != null) {
      return Padding(padding: const EdgeInsets.only(top: 4), child: PageDetailsSection(pageDetailsSection));
    }
    final achievementsSection = section.asOrNull<Fragment$Section$$AchievementSection>();
    if (achievementsSection != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: SectionWithHeader(
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
