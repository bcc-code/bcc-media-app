import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../components/episode_tab_selector.dart';
import '../../components/fade_indexed_stack.dart';
import '../../components/option_list.dart';
import '../../theme/bccm_colors.dart';

class EpisodeTabs extends StatelessWidget {
  const EpisodeTabs({super.key, required this.tabs, required this.children});

  final List<Option> tabs;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: BccmColors.separatorOnLight)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: EpisodeTabSelector(
                  onSelectionChange: (val) {
                    DefaultTabController.of(context).animateTo(val);
                  },
                  selectedId: '',
                  selectedIndex: DefaultTabController.of(context).index,
                  tabs: tabs,
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragUpdate: (details) {
                // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                var controller = DefaultTabController.maybeOf(context);
                if (controller == null) return;
                int sensitivity = 16;
                if (details.delta.dx > sensitivity && controller.index > 0) {
                  controller.animateTo(controller.index - 1);
                } else if (details.delta.dx < -sensitivity && controller.index + 1 < controller.length) {
                  controller.animateTo(controller.index + 1);
                }
              },
              child: FadeIndexedStack(
                index: DefaultTabController.of(context).index,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
