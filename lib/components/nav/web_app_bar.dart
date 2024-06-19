import 'package:auto_route/auto_route.dart';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helpers/svg_icons.dart';
import '../../l10n/app_localizations.dart';

import 'package:bccm_core/design_system.dart';

final logo = Image.asset('assets/flavors/prod/logo.png');
final icons = {
  'home_default': Image.asset(
    'assets/icons/Home_Default.png',
    gaplessPlayback: true,
  ),
  'home_selected': Image.asset('assets/icons/Home_Selected.png', gaplessPlayback: true),
  'search_default': Image.asset('assets/icons/Search_Default.png', gaplessPlayback: true),
  'search_selected': Image.asset('assets/icons/Search_Selected.png', gaplessPlayback: true),
  'live_default': Image.asset('assets/icons/Live_Default.png', gaplessPlayback: true),
  'live_selected': Image.asset('assets/icons/Live_Selected.png', gaplessPlayback: true),
  'calendar_default': Image.asset('assets/icons/Calendar_Default.png', gaplessPlayback: true),
  'calendar_selected': Image.asset('assets/icons/Calendar_Selected.png', gaplessPlayback: true),
};

class WebAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const WebAppBar({
    super.key,
    required this.tabsRouter,
    required this.onTabTap,
  });

  final TabsRouter tabsRouter;
  final void Function(int) onTabTap;
  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tabs = [
      BottomNavigationBarItem(label: S.of(context).homeTab, icon: icons['home_default']!, activeIcon: icons['home_selected']),
      BottomNavigationBarItem(label: S.of(context).search, icon: icons['search_default']!, activeIcon: icons['search_selected']),
    ];
    return AppBar(
      toolbarHeight: 64,
      shadowColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 64),
        child: FocusableActionDetector(
          mouseCursor: WidgetStateMouseCursor.clickable,
          child: GestureDetector(
            onTap: () => onTabTap(0),
            child: logo,
          ),
        ),
      ),
      flexibleSpace: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ...tabs.mapIndexed(
            (i, tab) => GestureDetector(
              onTap: () {
                onTabTap(i);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: WebTabButton(
                  tab: tab,
                  active: i == tabsRouter.activeIndex,
                ),
              ),
            ),
          )
        ]),
      ),
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: FocusableActionDetector(
            mouseCursor: WidgetStateMouseCursor.clickable,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                context.router.pushNamed('/profile');
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 32, top: 12, bottom: 12, right: kIsWeb ? 80 : 18),
                child: SvgPicture.string(
                  SvgIcons.profile,
                  semanticsLabel: S.of(context).profileTab,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class WebTabButton extends HookWidget {
  const WebTabButton({
    super.key,
    required this.active,
    required this.tab,
  });

  final bool active;
  final BottomNavigationBarItem tab;

  @override
  Widget build(BuildContext context) {
    final hovering = useState(false);
    final highlighted = hovering.value || active;
    return MouseRegion(
      cursor: WidgetStateMouseCursor.clickable,
      onEnter: (_) => hovering.value = true,
      onExit: (_) => hovering.value = false,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(height: 40, child: highlighted ? tab.activeIcon : tab.icon),
            Text(
              tab.label ?? '',
              style: highlighted
                  ? DesignSystem.of(context).textStyles.button2.copyWith(color: DesignSystem.of(context).colors.tint1)
                  : DesignSystem.of(context).textStyles.button2.copyWith(color: DesignSystem.of(context).colors.label3),
            ),
          ],
        ),
      ),
    );
  }
}
