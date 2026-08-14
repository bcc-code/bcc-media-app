import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helpers/svg_icons.dart';
import '../../helpers/unavailable_entry_bottom_sheet.dart';

/// A placeholder card shown in the favorites grid when a favorited item is no longer
/// available (e.g. it was unpublished). The entry still carries the item's title, but
/// no image — `UserCollectionEntry` has no thumbnail field — so the artwork is replaced
/// by a plain box. Mirrors `ThumbnailGridEpisode`'s layout so it lines up with the
/// surrounding cards. Tapping it explains the situation and offers to remove the entry.
class UnavailableFavorite extends ConsumerWidget {
  const UnavailableFavorite({super.key, required this.entry, required this.onRemoved});

  final Fragment$MyListEntry entry;
  final void Function() onRemoved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => showUnavailableEntryBottomSheet(context, ref, entryId: entry.id, onRemoved: onRemoved),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: design.colors.background2,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: design.colors.onTint.withOpacity(0.1)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.string(SvgIcons.cameraOff, height: 24, colorFilter: ColorFilter.mode(design.colors.label3, BlendMode.srcIn)),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Text(
                        S.of(context).unavailable,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: design.textStyles.caption1.copyWith(color: design.colors.label3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              entry.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: design.textStyles.caption1.copyWith(color: design.colors.label1),
            ),
          ),
        ],
      ),
    );
  }
}
