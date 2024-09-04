import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/screens/tabs/home.dart';
import 'package:brunstadtv_app/screens/tabs/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/widget_keys.dart';
import '../../l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';

String? getLocalizedRouteName(S localizations, Type route) {
  switch (route) {
    case SearchScreen:
      return localizations.search;
    case HomeScreen:
      return localizations.homeTab;
  }
  return null;
}

final widgetTitleProvider = StateProvider.autoDispose.family<String?, int>((ref, hashCode) => null);

class CustomBackButton extends ConsumerWidget {
  const CustomBackButton({Key? key, this.color, this.onPressed, this.padding}) : super(key: key ?? WidgetKeys.backButton);

  final Color? color;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stack = context.router.stack;
    if (stack.length < 2) {
      return const SizedBox.shrink();
    }
    final previousInStack = stack[stack.length - 2];
    final previousWidgetHashCode = previousInStack.child.hashCode;
    final previousPageTitle = ref.watch(widgetTitleProvider(previousWidgetHashCode));

    final localizedTitle = getLocalizedRouteName(S.of(context), previousInStack.child.runtimeType);

    final pageTitle = previousPageTitle ?? localizedTitle ?? '';

    return FocusableActionDetector(
      mouseCursor: WidgetStateMouseCursor.clickable,
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
                  colorFilter: ColorFilter.mode(color ?? DesignSystem.of(context).colors.tint1, BlendMode.srcIn),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      pageTitle,
                      semanticsLabel: S.of(context).back,
                      overflow: TextOverflow.ellipsis,
                      style: DesignSystem.of(context).textStyles.button2.copyWith(height: 1, color: color),
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
