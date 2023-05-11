import 'package:brunstadtv_app/theme/bccm_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../flavors.dart';
import '../theme/design_system/design_system.dart';

import '../l10n/app_localizations.dart';

const double _iconSize = 28;

class CustomTabBar extends HookConsumerWidget {
  const CustomTabBar({
    Key? key,
    required this.tabsRouter,
    required this.onTabTap,
  }) : super(key: key);

  final TabsRouter tabsRouter;
  final void Function(int) onTabTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useMaterial = Platform.isAndroid && ref.watch(isPhysicalDeviceProvider).asData?.valueOrNull != false;
    final design = DesignSystem.of(context);
    final icons = FlavorConfig.current.flavorImages;

    Widget icon(ImageProvider image, bool active) {
      final imageWidget = Image(
        image: image,
        gaplessPlayback: true,
      );
      final gradient = FlavorConfig.current.flavorGradients.tabIconActive;
      return Padding(
        padding: EdgeInsets.only(top: 2, bottom: useMaterial ? 2 : 0),
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

    var items = [
      BottomNavigationBarItem(
        label: S.of(context).homeTab,
        icon: icon(icons.home.image, false),
        activeIcon: icon(icons.home.activeImage, true),
      ),
      BottomNavigationBarItem(
        label: S.of(context).search,
        icon: icon(icons.search.image, false),
        activeIcon: icon(icons.search.activeImage, true),
      ),
    ];
    final guestMode = ref.watch(authStateProvider.select((value) => value.guestMode));
    debugPrint('custom_tab_bar rebuild. guestMode: $guestMode');
    if (!guestMode) {
      items.addAll([
        BottomNavigationBarItem(
          label: S.of(context).liveTab,
          icon: icon(icons.live.image, false),
          activeIcon: icon(icons.live.activeImage, true),
        ),
        BottomNavigationBarItem(
          label: S.of(context).calendar,
          icon: icon(icons.calendar.image, false),
          activeIcon: icon(icons.calendar.activeImage, true),
        ),
      ]);
    }

    if (useMaterial) {
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
      activeColor: design.colors.tint1,
      border: Border(top: BorderSide(width: 1, color: design.colors.separatorOnLight)),
      items: items,
    );
  }
}
