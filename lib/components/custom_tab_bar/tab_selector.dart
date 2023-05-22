import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../theme/design_system/design_system.dart';

class TabSelector extends StatelessWidget {
  const TabSelector({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onSelectionChange,
    required this.padding,
  });

  final List<String> tabs;
  final int selectedIndex;
  final void Function(int id) onSelectionChange;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: (constraints.maxWidth)),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: padding,
            child: Row(
              children: tabs
                  .mapIndexed(
                    (index, tabName) => Padding(
                      padding: EdgeInsets.only(right: tabName == tabs.last ? 0 : 8),
                      child: TabButton(
                        tabName,
                        selected: selectedIndex == index,
                        onTap: () => onSelectionChange(index),
                      ),
                    ),
                  )
                  .toList(),
            ),
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
            color: !selected ? Colors.transparent : DesignSystem.of(context).colors.separatorOnLight,
            width: 1,
          ),
          color: !selected ? Colors.transparent : DesignSystem.of(context).colors.background2,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        child: Text(
          text.toUpperCase(),
          style: DesignSystem.of(context)
              .textStyles
              .button2
              .copyWith(color: !selected ? DesignSystem.of(context).colors.label4 : DesignSystem.of(context).colors.label1),
        ),
      ),
    );
  }
}
