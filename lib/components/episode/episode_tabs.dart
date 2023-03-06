import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../components/episode_tab_selector.dart';
import '../../components/fade_indexed_stack.dart';
import '../../components/option_list.dart';
import '../../theme/bccm_colors.dart';

class EpisodeTabs extends HookWidget {
  const EpisodeTabs({super.key, required this.tabs, required this.children});

  final List<Option> tabs;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final index = useState(0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: BccmColors.separatorOnLight)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: EpisodeTabSelector(
              tabs: tabs,
              selectedIndex: index.value,
              onSelectionChange: (newIndex) => index.value = newIndex,
            ),
          ),
        ),
        GestureDetector(
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
      ],
    );
  }
}
