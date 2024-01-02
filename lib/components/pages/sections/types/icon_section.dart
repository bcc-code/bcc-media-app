import 'package:brunstadtv_app/components/pages/sections/section_item_click_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../models/breakpoints.dart';
import '../icons/icon_section_button.dart';
import '../../../misc/horizontal_slider.dart';
import 'package:bccm_core/platform.dart';

class IconSection extends StatelessWidget {
  final Fragment$Section$$IconSection data;

  const IconSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalSlider(
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 12),
      height: ResponsiveBreakpoints.of(context).largerThan(BP.sm) ? 170 : 148,
      itemCount: data.items.items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = data.items.items[index];
        return SectionItemClickWrapper(
          item: item.item,
          collectionId: data.metadata?.useContext == true && data.metadata?.collectionId != null ? data.metadata!.collectionId : null,
          analytics: SectionItemAnalytics(id: item.id, position: index, type: item.$__typename, name: item.title),
          child: IconSectionButton(
            label: item.title,
            networkImage: item.image,
            width: ResponsiveBreakpoints.of(context).largerThan(BP.sm) ? 180 : 80,
            aspectRatio: ResponsiveBreakpoints.of(context).largerThan(BP.sm) ? 16 / 9 : 1,
            padding: const EdgeInsets.all(8),
          ),
        );
      },
    );
  }
}
