import 'dart:ui';

import 'package:bccm_core/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SettingList extends StatelessWidget {
  final List<SettingListItem> items;
  final Color? backgroundColor;

  const SettingList({
    super.key,
    required this.items,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Column(
        children: [
          ...items.mapIndexed(
            (index, option) => Column(
              children: [
                if (index > 0)
                  Container(
                    padding: bp.smallerThan(TABLET) ? const EdgeInsets.symmetric(horizontal: 20) : const EdgeInsets.symmetric(horizontal: 24),
                    color: design.colors.background2,
                    child: Container(width: double.infinity, height: 1, color: design.colors.separatorOnLight),
                  ),
                _ItemRenderer(
                  item: option,
                  defaultBackgroundColor: backgroundColor ?? DesignSystem.of(context).colors.background2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemRenderer extends HookWidget {
  const _ItemRenderer({
    required this.item,
    required this.defaultBackgroundColor,
  });

  final SettingListItem item;
  final Color defaultBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final hovering = useState(false);
    final animationController = useAnimationController(duration: const Duration(milliseconds: 300), initialValue: 1);
    final opacityReduction = useAnimation(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn, reverseCurve: Curves.easeIn).drive(Tween(begin: 0.3, end: 0.0)),
    );
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final small = bp.smallerThan(TABLET);
    return Stack(
      children: [
        IgnorePointer(
          ignoring: item.disabled,
          child: FocusableActionDetector(
            mouseCursor: WidgetStateMouseCursor.clickable,
            onShowHoverHighlight: (value) => hovering.value = value,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: (e) {
                animationController.value = 0;
              },
              onTapUp: (e) {
                item.onPressed();
                animationController.forward();
              },
              onTapCancel: () {
                animationController.value = 1;
              },
              child: Container(
                decoration: BoxDecoration(
                  color: item.disabled
                      ? defaultBackgroundColor
                      : defaultBackgroundColor.withOpacity(clampDouble(defaultBackgroundColor.opacity - opacityReduction, 0, 1)),
                ),
                child: Container(
                  padding: small ? const EdgeInsets.symmetric(horizontal: 20, vertical: 16) : const EdgeInsets.all(24),
                  constraints: const BoxConstraints(minHeight: 56),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // If there is a right widget, make the text 2/3 of the row, otherwise 1/2
                        Expanded(
                          flex: item.rightWidget != null ? 2 : 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: small ? design.textStyles.title2 : design.textStyles.title1,
                              ),
                              if (item.subtitle != null)
                                Text(
                                  item.subtitle!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: (small ? design.textStyles.body2 : design.textStyles.body1).copyWith(color: design.colors.label1),
                                )
                            ],
                          ),
                        ),
                        // If there is a right widget, make it 1/3 of the row, otherwise 1/2
                        if (item.rightText != null && item.rightWidget == null)
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                item.rightText!,
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                                style: (small ? design.textStyles.body2 : design.textStyles.body1).copyWith(color: design.colors.label1),
                              ),
                            ),
                          ),
                        if (item.rightWidget != null)
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: item.rightWidget!,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SettingListItem {
  final String title;
  final String? subtitle;
  final VoidCallback onPressed;
  final String? rightText;
  bool disabled;
  final Widget? rightWidget;

  SettingListItem({
    required this.title,
    required this.onPressed,
    this.subtitle,
    this.disabled = false,
    this.rightText,
    this.rightWidget,
  });
}
