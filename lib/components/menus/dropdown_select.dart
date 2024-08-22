import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:collection/collection.dart';

import 'bottom_sheet_select.dart';
import 'option_list.dart';
import 'package:bccm_core/design_system.dart';

class DropDownSelect<T> extends StatelessWidget {
  final T selectedId;
  final String title;
  final List<Option<T>> items;
  final dynamic Function(T id) onSelectionChanged;

  const DropDownSelect({
    super.key,
    required this.items,
    required this.selectedId,
    required this.onSelectionChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }
    final selectedItem = items.firstWhereOrNull((element) => element.id == selectedId);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            builder: (ctx) {
              return BottomSheetSelect<T>(
                title: title,
                items: items,
                selectedId: selectedId,
                onSelectionChanged: onSelectionChanged,
              );
            });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (selectedItem != null)
            Text(
              selectedItem.title.toUpperCase(),
              style: DesignSystem.of(context).textStyles.button2.copyWith(color: DesignSystem.of(context).colors.label1),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Center(
              child: SvgPicture.string(SvgIcons.chevronDown),
            ),
          )
        ],
      ),
    );
  }
}
