import 'package:brunstadtv_app/components/pages/sections/avatar/avatar_section_button.dart';
import 'package:brunstadtv_app/components/pages/sections/section_item_click_wrapper.dart';
import 'package:flutter/material.dart';

import '../../../misc/horizontal_slider.dart';
import 'package:bccm_core/platform.dart';

class AvatarSection extends StatelessWidget {
  final Fragment$Section$$AvatarSection data;

  const AvatarSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalSlider(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 170,
      itemCount: data.items.items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = data.items.items[index];
        return SectionItemClickWrapper(
          item: item.item,
          collectionId: data.metadata?.useContext == true && data.metadata?.collectionId != null ? data.metadata!.collectionId : null,
          analytics: SectionItemAnalyticsData(id: item.id, position: index, type: item.$__typename, name: item.title),
          child: AvatarSectionButton(
            name: item.title,
            networkImage: item.image,
            width: 80,
            padding: const EdgeInsets.all(8),
          ),
        );
      },
    );
  }
}
