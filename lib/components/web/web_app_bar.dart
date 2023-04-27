import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helpers/ui/svg_icons.dart';
import '../../helpers/widget_keys.dart';
import '../../l10n/app_localizations.dart';
import 'dart:ui';

import '../../providers/auth_state/auth_state.dart';
import '../../theme/bccm_colors.dart';

final logo = Image.asset('assets/images/logo.png');
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
    final guestMode = ref.watch(authStateProvider.select((value) => value.guestMode));
    debugPrint('custom_tab_bar rebuild. guestMode: $guestMode');
    if (!guestMode) {
      tabs.addAll([
        BottomNavigationBarItem(
          label: S.of(context).liveTab,
          icon: icons['live_default']!,
          activeIcon: icons['live_selected'],
        ),
        BottomNavigationBarItem(label: S.of(context).calendar, icon: icons['calendar_default']!, activeIcon: icons['calendar_selected']),
      ]);
    }
    return AppBar(
      toolbarHeight: 64,
      shadowColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 64),
        child: FocusableActionDetector(
          mouseCursor: MaterialStateMouseCursor.clickable,
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
            mouseCursor: MaterialStateMouseCursor.clickable,
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
      cursor: MaterialStateMouseCursor.clickable,
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
              style:
                  highlighted ? BccmTextStyles.button2.copyWith(color: BccmColors.tint1) : BccmTextStyles.button2.copyWith(color: BccmColors.label3),
            ),
          ],
        ),
      ),
    );
  }
}
