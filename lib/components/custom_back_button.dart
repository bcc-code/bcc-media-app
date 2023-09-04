import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/screens/tabs/home.dart';
import 'package:brunstadtv_app/screens/tabs/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/widget_keys.dart';
import '../l10n/app_localizations.dart';
import '../screens/games/games.dart';
import '../screens/page.dart';
import '../theme/design_system/design_system.dart';

String? getLocalizedRouteName(S localizations, Type route) {
  switch (route) {
    case SearchScreen:
      return localizations.search;
    case HomeScreen:
      return localizations.homeTab;
    case GamesScreen:
      return localizations.gamesTab;
  }
  return null;
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, this.color, this.onPressed, this.padding}) : super(key: key ?? WidgetKeys.backButton);

  final Color? color;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final stack = context.router.stack;
    var pageTitle = '';
    if (stack.length >= 2) {
      final previousInStack = stack[stack.length - 2];
      final previousPage = previousInStack.child.asOrNull<PageScreen>();
      final previousPageTitle = previousPage?.key.asOrNull<GlobalKey<PageScreenState>>()?.currentState?.pageTitle;

      final localizedTitle = getLocalizedRouteName(S.of(context), previousInStack.child.runtimeType);

      pageTitle = previousPageTitle ?? localizedTitle ?? '';
    }
    return FocusableActionDetector(
      mouseCursor: MaterialStateMouseCursor.clickable,
      child: Padding(
        padding: padding ?? const EdgeInsets.only(left: 17),
        child: Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (onPressed != null) {
                onPressed!();
              } else {
                Navigator.maybePop(context);
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.string(
                  SvgIcons.chevronLeft,
                  height: 16,
                  colorFilter: ColorFilter.mode(DesignSystem.of(context).colors.tint1, BlendMode.srcIn),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      pageTitle,
                      semanticsLabel: S.of(context).back,
                      overflow: TextOverflow.ellipsis,
                      style: DesignSystem.of(context).textStyles.button2.copyWith(height: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
