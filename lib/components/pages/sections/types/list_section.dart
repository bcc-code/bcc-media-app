import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/design_system.dart';
import 'package:brunstadtv_app/components/pages/sections/section_item_click_wrapper.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/platform.dart';
import '../../../episode/list/episode_list_episode.dart';

class ListSection extends StatelessWidget {
  final Fragment$Section$$ListSection data;

  const ListSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final limit = data.metadata?.limit;
    String? showMorePage;
    if (limit != null && data.items.items.length == limit) {
      showMorePage = data.metadata?.page?.code;
    }
    final sectionItems = data.items.items.map((i) => i.item).whereType<Fragment$Section$$ListSection$items$items$item$$Episode>().toList();
    final design = DesignSystem.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ...sectionItems.asMap().entries.map(
              (kv) => SectionItemClickWrapper(
                item: kv.value,
                collectionId: data.metadata?.useContext == true && data.metadata?.collectionId != null ? data.metadata!.collectionId : null,
                analytics: SectionItemAnalyticsData(id: kv.value.id, position: kv.key, type: kv.value.$__typename, name: kv.value.title),
                child: EpisodeListEpisode(
                  showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
                  id: kv.value.id,
                  showTitle: kv.value.season?.$show.title,
                  ageRating: kv.value.ageRating,
                  duration: kv.value.duration,
                  title: kv.value.title,
                  image: kv.value.image,
                  publishDate: kv.value.publishDate,
                  locked: kv.value.locked,
                  progress: kv.value.progress,
                ),
              ),
            ),
        if (showMorePage != null)
          SizedBox(
            width: double.infinity,
            child: design.buttons.medium(
              labelText: S.of(context).showMore,
              variant: ButtonVariant.secondary,
              onPressed: () {
                context.navigateTo(PageScreenRoute(pageCode: showMorePage!));
              },
            ),
          ),
      ]),
    );
  }
}
