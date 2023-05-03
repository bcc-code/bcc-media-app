import 'package:universal_io/io.dart';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/design_system/design_system.dart';

import '../helpers/widget_keys.dart';
import '../l10n/app_localizations.dart';

const double _iconSize = 28;

class CustomTabBar extends ConsumerStatefulWidget {
  const CustomTabBar({
    Key? key,
    required this.tabsRouter,
    required this.onTabTap,
  }) : super(key: key);

  final TabsRouter tabsRouter;
  final void Function(int) onTabTap;

  @override
  ConsumerState<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends ConsumerState<CustomTabBar> {
  late final Map<String, Image> icons;
  get useMaterial => Platform.isAndroid && ref.watch(isPhysicalDeviceProvider).asData?.valueOrNull != false;

  @override
  void initState() {
    icons = {
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

    super.initState();
  }

  @override
  void didChangeDependencies() {
    for (var icon in icons.entries) {
      precacheImage(icon.value.image, context, size: const Size(_iconSize, _iconSize));
    }
    super.didChangeDependencies();
  }

  Widget _icon(Image? image, {Key? key}) {
    return Padding(key: key, padding: EdgeInsets.only(top: 2, bottom: useMaterial ? 2 : 0), child: SizedBox(height: _iconSize, child: image));
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    var items = [
      BottomNavigationBarItem(label: S.of(context).homeTab, icon: _icon(icons['home_default']), activeIcon: _icon(icons['home_selected'])),
      BottomNavigationBarItem(label: S.of(context).search, icon: _icon(icons['search_default']), activeIcon: _icon(icons['search_selected'])),
    ];
    final guestMode = ref.watch(authStateProvider.select((value) => value.guestMode));
    debugPrint('custom_tab_bar rebuild. guestMode: $guestMode');
    if (!guestMode) {
      items.addAll([
        BottomNavigationBarItem(
          label: S.of(context).liveTab,
          icon: _icon(key: WidgetKeys.liveTabButton, icons['live_default']),
          activeIcon: _icon(key: WidgetKeys.liveTabButton, icons['live_selected']),
        ),
        BottomNavigationBarItem(label: S.of(context).calendar, icon: _icon(icons['calendar_default']), activeIcon: _icon(icons['calendar_selected'])),
      ]);
    }

    if (useMaterial) {
      return Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: design.colors.separatorOnLight))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: design.colors.label3,
          unselectedLabelStyle: design.textStyles.caption3,
          currentIndex: widget.tabsRouter.activeIndex,
          onTap: widget.onTabTap,
          items: items,
        ),
      );
    }
    return CupertinoTabBar(
      iconSize: 24,
      height: 50,
      currentIndex: widget.tabsRouter.activeIndex,
      onTap: widget.onTabTap,
      inactiveColor: design.colors.label3,
      activeColor: design.colors.tint1,
      border: Border(top: BorderSide(width: 1, color: design.colors.separatorOnLight)),
      items: items,
    );
  }
}
