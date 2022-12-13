import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:brunstadtv_app/screens/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';
import '../providers/analytics.dart';
import '../providers/app_config.dart';

final _indexToNameMap = ['home', 'search', 'livestream', 'calendar'];
const double _iconSize = 28;

class CustomTabBar extends ConsumerStatefulWidget {
  const CustomTabBar({
    Key? key,
    required this.tabsRouter,
  }) : super(key: key);

  final TabsRouter tabsRouter;

  @override
  ConsumerState<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends ConsumerState<CustomTabBar> {
  late final Map<String, Image> icons;
  final useMaterial = Platform.isAndroid;

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

  Widget _icon(Image? image) {
    return Padding(padding: EdgeInsets.only(top: 2, bottom: useMaterial ? 2 : 0), child: SizedBox(height: _iconSize, child: image));
  }

  void sendAnalytics(int index) {
    if (index < 0 || index > _indexToNameMap.length - 1) return;
    final tabName = _indexToNameMap[index];
    final appConfig = ref.read(appConfigProvider);
    appConfig.then((value) {
      String? pageCode;
      if (tabName == 'home') {
        pageCode = value?.application.page?.code;
      } else if (tabName == 'search') {
        pageCode = value?.application.searchPage?.code;
      }
      Map<String, dynamic> extraProperties = {};
      if (pageCode != null) {
        extraProperties['pageCode'] = pageCode;
      }
      ref.read(analyticsProvider).screen(tabName, properties: extraProperties);
    });
  }

  @override
  Widget build(BuildContext context) {
    var items = [
      BottomNavigationBarItem(label: S.of(context).homeTab, icon: _icon(icons['home_default']), activeIcon: _icon(icons['home_selected'])),
      BottomNavigationBarItem(label: S.of(context).search, icon: _icon(icons['search_default']), activeIcon: _icon(icons['search_selected'])),
    ];

    if (!ref.watch(authStateProvider).guestMode) {
      items.addAll([
        BottomNavigationBarItem(label: S.of(context).liveTab, icon: _icon(icons['live_default']), activeIcon: _icon(icons['live_selected'])),
        BottomNavigationBarItem(label: S.of(context).calendar, icon: _icon(icons['calendar_default']), activeIcon: _icon(icons['calendar_selected'])),
      ]);
    }

    if (useMaterial) {
      return Container(
        decoration: const BoxDecoration(border: Border(top: BorderSide(width: 1, color: BtvColors.separatorOnLight))),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: BtvColors.label3,
            unselectedLabelStyle: BtvTextStyles.caption3,
            currentIndex: widget.tabsRouter.activeIndex,
            onTap: (index) {
              // here we switch between tabs
              if (widget.tabsRouter.activeIndex == index) {
                final current = widget.tabsRouter.current;
                widget.tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
              } else {
                sendAnalytics(index);
              }
              widget.tabsRouter.setActiveIndex(index);
            },
            items: items),
      );
    }
    return CupertinoTabBar(
        iconSize: 24,
        height: 50,
        currentIndex: widget.tabsRouter.activeIndex,
        onTap: (index) {
          // here we switch between tabs
          if (widget.tabsRouter.activeIndex == index) {
            final searchState =
                widget.tabsRouter.topPage?.child.asOrNull<SearchScreen>()?.key?.asOrNull<GlobalKey<SearchScreenState>>()?.currentState;
            if (searchState != null) {
              searchState.clear();
            }
            widget.tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
          }
          widget.tabsRouter.setActiveIndex(index);
        },
        inactiveColor: BtvColors.label3,
        activeColor: BtvColors.tint1,
        border: const Border(top: BorderSide(width: 1, color: BtvColors.separatorOnLight)),
        items: items);
  }
}
