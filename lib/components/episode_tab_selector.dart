import 'package:flutter/material.dart';

import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';
import 'option_list.dart';

class EpisodeTabSelector extends StatelessWidget {
  const EpisodeTabSelector({super.key, required this.tabs, required this.selectedIndex, required this.onSelectionChange});

  final List<Option> tabs;
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
                .map(
                  (tab) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TabButton(
                      tab.title,
                      selected: selectedIndex == tabs.indexOf(tab),
                      onTap: () {
                        onSelectionChange(tabs.indexOf(tab));
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
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
            color: !selected ? Colors.transparent : BccmColors.separatorOnLight,
            width: 1,
          ),
          color: !selected ? Colors.transparent : BccmColors.background2,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        child: Text(
          text.toUpperCase(),
          style: BccmTextStyles.button2.copyWith(color: !selected ? BccmColors.label4 : BccmColors.label1),
        ),
      ),
    );
  }
}
