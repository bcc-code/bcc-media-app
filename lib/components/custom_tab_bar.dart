import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';

final bool android = Platform.isAndroid;

const double _iconSize = 28;

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    Key? key,
    required this.tabsRouter,
  }) : super(key: key);

  final TabsRouter tabsRouter;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late final Map<String, Image> icons;
  @override
  void initState() {
    icons = {
      'home_default': Image.asset(
        'assets/icons/Home_Default.png',
        gaplessPlayback: true,
      ),
      'home_selected':
          Image.asset('assets/icons/Home_Selected.png', gaplessPlayback: true),
      'search_default':
          Image.asset('assets/icons/Search_Default.png', gaplessPlayback: true),
      'search_selected': Image.asset('assets/icons/Search_Selected.png',
          gaplessPlayback: true),
      'live_default':
          Image.asset('assets/icons/Live_Default.png', gaplessPlayback: true),
      'live_selected':
          Image.asset('assets/icons/Live_Selected.png', gaplessPlayback: true),
      'calendar_default': Image.asset('assets/icons/Calendar_Default.png',
          gaplessPlayback: true),
      'calendar_selected': Image.asset('assets/icons/Calendar_Selected.png',
          gaplessPlayback: true),
    };
    super.initState();
  }

  @override
  void didChangeDependencies() {
    for (var icon in icons.entries) {
      precacheImage(icon.value.image, context,
          size: const Size(_iconSize, _iconSize));
    }
    super.didChangeDependencies();
  }

  Widget _icon(Image? image) {
    return Padding(
        padding: EdgeInsets.only(top: 2, bottom: android ? 2 : 0),
        child: SizedBox(height: _iconSize, child: image));
  }

  @override
  Widget build(BuildContext context) {
    var items = [
      BottomNavigationBarItem(
          label: 'Home',
          icon: _icon(icons['home_default']),
          activeIcon: _icon(icons['home_selected'])),
      BottomNavigationBarItem(
          label: 'Search',
          icon: _icon(icons['search_default']),
          activeIcon: _icon(icons['search_selected'])),
      BottomNavigationBarItem(
          label: 'Live',
          icon: _icon(icons['live_default']),
          activeIcon: _icon(icons['live_selected'])),
      BottomNavigationBarItem(
          label: 'Calendar',
          icon: _icon(icons['calendar_default']),
          activeIcon: _icon(icons['calendar_selected'])),
    ];

    if (android) {
      return Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: BtvColors.seperatorOnLight))),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: BtvColors.label3,
            unselectedLabelStyle: BtvTextStyles.caption3,
            currentIndex: widget.tabsRouter.activeIndex,
            onTap: (index) {
              // here we switch between tabs
              if (widget.tabsRouter.activeIndex == index) {
                widget.tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
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
            widget.tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
          }
          widget.tabsRouter.setActiveIndex(index);
        },
        inactiveColor: BtvColors.label3,
        activeColor: BtvColors.tint1,
        border: const Border(
            top: BorderSide(width: 1, color: BtvColors.seperatorOnLight)),
        items: items);
  }
}
