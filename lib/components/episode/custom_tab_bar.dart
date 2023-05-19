import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'tab_selector.dart';
import '../../components/fade_indexed_stack.dart';
import '../../theme/design_system/design_system.dart';

class CustomTabBar extends HookWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.children,
    this.padding = const EdgeInsets.all(16),
  });

  final List<String> tabs;
  final List<Widget> children;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final index = useState(0);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: DesignSystem.of(context).colors.separatorOnLight)),
          ),
          child: TabSelector(
            tabs: tabs,
            selectedIndex: index.value,
            onSelectionChange: (newIndex) => index.value = newIndex,
            padding: padding,
          ),
        ),
        Flexible(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragUpdate: (details) {
              // Note: Sensitivity is integer used when you don't want to mess up vertical drag
              int sensitivity = 12;
              if (details.delta.dx > sensitivity && index.value > 0) {
                index.value--;
              } else if (details.delta.dx < -sensitivity && index.value + 1 < tabs.length) {
                index.value++;
              }
            },
            child: FadeIndexedStack(
              index: index.value,
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
