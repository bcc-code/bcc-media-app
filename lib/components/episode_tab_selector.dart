import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';
import 'option_list.dart';

class EpisodeTabSelector extends StatelessWidget {
  const EpisodeTabSelector({super.key, required this.tabs, required this.selectedId, required this.selectedIndex, required this.onSelectionChange});

  final List<Option> tabs;
  final String selectedId;
  final int selectedIndex;
  final void Function(int id) onSelectionChange;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: (constraints.maxWidth)),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: tabs
                    .map((tab) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TabButton(tab.title, selected: selectedIndex == tabs.indexOf(tab), onTap: () {
                          onSelectionChange(tabs.indexOf(tab));
                        })))
                    .toList())),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  const TabButton(this.text, {super.key, required this.selected, required this.onTap});

  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: !selected ? Colors.transparent : BtvColors.seperatorOnLight,
            width: 1,
          ),
          color: !selected ? Colors.transparent : BtvColors.background2,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        child: Text(
          text.toUpperCase(),
          style: BtvTextStyles.button2.copyWith(color: !selected ? BtvColors.label4 : BtvColors.label1),
        ),
      ),
    );
  }
}
