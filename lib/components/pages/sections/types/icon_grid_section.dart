import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:brunstadtv_app/components/pages/sections/section_item_click_wrapper.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:bccm_core/platform.dart';
import '../../../../models/breakpoints.dart';
import '../../../misc/custom_grid_view.dart';
import '../icons/icon_section_button.dart';

const Map<Enum$GridSectionSize, int> _columnSize = {
  Enum$GridSectionSize.half: 2,
};

class IconGridSection extends StatelessWidget {
  final Fragment$Section$$IconGridSection data;

  const IconGridSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 12),
      child: _IconGridSectionList(
        size: data.gridSize,
        sectionItems: data.items.items,
        collectionId: data.metadata?.useContext == true && data.metadata?.collectionId != null ? data.metadata!.collectionId : null,
      ),
    );
  }
}

class _IconGridSectionList extends ConsumerWidget {
  const _IconGridSectionList({
    required this.size,
    required this.sectionItems,
    this.collectionId,
  });

  final Enum$GridSectionSize size;
  final List<Fragment$ItemSectionItem> sectionItems;
  final String? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colSize = ResponsiveValue(
      context,
      conditionalValues: [
        const Condition.equals(name: BP.md, value: 3),
        const Condition.equals(name: BP.lg, value: 4),
        const Condition.equals(name: BP.xl, value: 5),
        const Condition.largerThan(name: BP.xl, value: 6),
      ],
      defaultValue: _columnSize[size] ?? _columnSize[Enum$GridSectionSize.half]!,
    ).value;

    final iconSectionVariant = ref.watch(featureFlagsProvider.select((s) => s.iconSectionVariant));

    return CustomGridView(
      verticalSpacing: 12,
      padding: null,
      columnCount: colSize,
      children: sectionItems
          .mapIndexed(
            (index, item) => SectionItemClickWrapper(
              item: item.item,
              collectionId: collectionId,
              analytics: SectionItemAnalyticsData(id: item.id, position: index, type: item.$__typename, name: item.title),
              child: iconSectionVariant == 'v2'
                  ? _IconSectionButtonV2(
                      label: item.title,
                      networkImage: 'https://imgix.bcc.media/efe38076-11fe-415a-af56-61f49f43177c.png?w=160&h=160&fit=crop&crop=faces',
                      width: 80,
                      aspectRatio: 175 / 48,
                      padding: const EdgeInsets.all(8),
                    )
                  : IconSectionButton(
                      label: item.title,
                      networkImage: item.image,
                      width: 80,
                      aspectRatio: 16 / 9,
                      padding: const EdgeInsets.all(8),
                    ),
            ),
          )
          .toList(),
    );
  }
}

class _IconSectionButtonV2 extends StatelessWidget {
  final String label;
  final String? networkImage;
  final EdgeInsetsGeometry padding;
  final double width;
  final double aspectRatio;

  const _IconSectionButtonV2({
    required this.label,
    this.networkImage,
    this.padding = const EdgeInsets.all(8),
    this.width = double.infinity,
    this.aspectRatio = 1,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: width,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: design.colors.separatorOnLight),
              color: design.colors.background2,
            ),
            child: Row(
              children: [
                if (networkImage != null)
                  LayoutBuilder(builder: (context, constraints) {
                    return Center(
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        fadeInDuration: const Duration(milliseconds: 200),
                        image: networkImageWithRetryAndResize(
                          imageUrl: networkImage!,
                          cacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round(),
                        ),
                        imageErrorBuilder: imageErrorBuilder,
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  }),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      label,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: design.textStyles.caption1.copyWith(color: design.colors.label1),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
