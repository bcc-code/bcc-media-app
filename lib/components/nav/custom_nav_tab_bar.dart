import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/providers/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../providers/tabs.dart';
import 'package:bccm_core/design_system.dart';

const double _iconSize = 28;

class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon(
    this.image,
    this.active, {
    super.key,
  });

  final ImageProvider image;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final imageWidget = Image(
      image: image,
      gaplessPlayback: true,
    );
    final gradient = DesignSystem.of(context).appThemeData.tabTheme?.iconActiveGradient;
    return Padding(
      padding: EdgeInsets.only(top: 2, bottom: Platform.isAndroid ? 2 : 0),
      child: SizedBox(
        height: _iconSize,
        child: !active || gradient == null
            ? imageWidget
            : ShaderMask(
                shaderCallback: (bounds) {
                  return gradient.createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: imageWidget,
              ),
      ),
    );
  }
}

class CustomNavTabBar extends HookConsumerWidget {
  const CustomNavTabBar({
    Key? key,
    required this.tabsRouter,
    required this.onTabTap,
  }) : super(key: key);

  final TabsRouter tabsRouter;
  final void Function(int) onTabTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final tabInfos = ref.watch(tabInfosProvider);
    final currentTabIds = ref.watch(currentTabIdsProvider);

    final guestMode = ref.watch(authStateProvider.select((value) => value.guestMode));
    final items = currentTabIds
        .map((tabId) => tabInfos.getFor(tabId))
        .map(
          (tabInfo) => BottomNavigationBarItem(
            label: tabInfo.title(context),
            icon: BottomNavIcon(tabInfo.icon.image, false, key: tabInfo.iconKey),
            activeIcon: BottomNavIcon(tabInfo.icon.activeImage, true, key: tabInfo.iconKey),
          ),
        )
        .toList();
    debugPrint('custom_tab_bar rebuild. guestMode: $guestMode');

    if (Platform.isAndroid) {
      return Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: design.colors.separatorOnLight))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: design.colors.label3,
          unselectedLabelStyle: design.textStyles.caption3,
          currentIndex: tabsRouter.activeIndex,
          onTap: onTabTap,
          items: items,
        ),
      );
    }
    return CupertinoTabBar(
      iconSize: 24,
      height: 50,
      currentIndex: tabsRouter.activeIndex,
      onTap: onTabTap,
      inactiveColor: design.colors.label3,
      activeColor: design.appThemeData.tabTheme?.activeColor,
      border: Border(top: BorderSide(width: 1, color: design.colors.separatorOnLight)),
      items: items,
    );
  }
}
