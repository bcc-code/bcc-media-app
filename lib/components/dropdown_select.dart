import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:collection/collection.dart';

import '../components/bottom_sheet_select.dart';
import '../components/option_list.dart';
import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';

class DropDownSelect extends StatelessWidget {
  final String selectedId;
  final String title;
  final List<Option> items;
  final void Function(String id) onSelectionChanged;

  const DropDownSelect({
    Key? key,
    required this.items,
    required this.selectedId,
    required this.onSelectionChanged,
    required this.title,
  }) : super(key: key);

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
              return BottomSheetSelect(
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
              style: BccmTextStyles.button2.copyWith(color: BccmColors.label1),
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
