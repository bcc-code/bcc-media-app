import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:brunstadtv_app/screens/home.dart';
import 'package:brunstadtv_app/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/btv_typography.dart';
import '../helpers/widget_keys.dart';
import '../l10n/app_localizations.dart';
import '../screens/page.dart';

String? getLocalizedRouteName(S localizations, Type route) {
  switch (route) {
    case SearchScreen:
      return localizations.search;
    case HomeScreen:
      return localizations.homeTab;
  }
  return null;
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, this.color, this.onPressed}) : super(key: key ?? WidgetKeys.backButton);

  final Color? color;

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
    return Padding(
      padding: const EdgeInsets.only(left: 17),
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
              SvgPicture.string(SvgIcons.chevronLeft, height: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    pageTitle,
                    semanticsLabel: S.of(context).back,
                    overflow: TextOverflow.ellipsis,
                    style: BtvTextStyles.button2.copyWith(height: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
