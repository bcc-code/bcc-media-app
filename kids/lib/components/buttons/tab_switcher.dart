import 'dart:math';

import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kids/components/buttons/button.dart';

class TabSwitcher extends HookWidget {
  const TabSwitcher.large({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelectionChanged,
  }) : _small = false;

  const TabSwitcher.small({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelectionChanged,
  }) : _small = true;

  final List<String> options;
  final int selectedIndex;
  final void Function(int id) onSelectionChanged;
  final bool _small;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final button = _small
        ? Button.rawSmall(
            key: key,
            color: design.colors.tint1,
            activeColor: design.colors.tint1,
            labelText: ' ',
            onPressed: () {},
            shadowColor: design.colors.label1.withOpacity(0.1),
            sideColor: const Color(0xFFF1B826),
            labelTextStyle: design.textStyles.title2,
          )
        : Button.rawLarge(
            key: key,
            color: design.colors.tint1,
            activeColor: design.colors.tint1,
            labelText: ' ',
            onPressed: () {},
            shadowColor: design.colors.label1.withOpacity(0.1),
            sideColor: const Color(0xFFF1B826),
            labelTextStyle: design.textStyles.headline3,
          );

    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 4, right: 4, left: 4),
      decoration: BoxDecoration(color: design.colors.background2, borderRadius: BorderRadius.circular(56)),
      height: _small ? 56 : 72,
      width: 200.0 * options.length,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: LayoutBuilder(builder: (context, constraints) {
              final width = constraints.biggest.width * (1 / options.length);
              final padding = min(constraints.biggest.width - width, max(0.0, width * selectedIndex));
              return Align(
                alignment: Alignment.centerLeft,
                child: TweenAnimationBuilder(
                  tween: Tween(begin: padding, end: padding),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutExpo,
                  builder: (context, tweenedPadding, child) {
                    return Container(
                      margin: EdgeInsets.only(left: tweenedPadding),
                      width: width,
                      child: IgnorePointer(child: button),
                    );
                  },
                ),
              );
            }),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: options
                .mapIndexed(
                  (index, option) => Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onSelectionChanged(index),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: button.paddings.fromLabelToSide, right: button.paddings.fromLabelToSide),
                          child: Text(
                            option,
                            style: button.labelTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
