import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/button_base.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class ButtonPaddings {
  final double fromLabelToSide;
  final double fromLabelToSideWhenAlone;
  final double fromIconToLabel;
  final double fromIconToSide;
  final double fromIconToSideWhenAlone;

  const ButtonPaddings({
    required this.fromLabelToSide,
    required this.fromLabelToSideWhenAlone,
    required this.fromIconToLabel,
    required this.fromIconToSide,
    required this.fromIconToSideWhenAlone,
  });
}

class Button extends HookConsumerWidget {
  final Widget? icon;
  final String? labelText;
  final VoidCallback? onPressed;
  final double height;
  final double elevationHeight;
  final ButtonPaddings paddings;
  final double iconSize;
  final Color color;
  final Color activeColor;
  final Color? sideColor;
  final Color? shadowColor;
  final TextStyle labelTextStyle;

  const Button.raw({
    super.key,
    this.icon,
    this.labelText,
    this.onPressed,
    required this.iconSize,
    required this.paddings,
    required this.height,
    required this.elevationHeight,
    required this.color,
    required this.activeColor,
    required this.shadowColor,
    required this.sideColor,
    required this.labelTextStyle,
  });

  Button copyWith({
    Widget? icon,
    String? labelText,
    VoidCallback? onPressed,
    double? height,
    double? elevationHeight,
    ButtonPaddings? paddings,
    double? iconSize,
    Color? color,
    Color? activeColor,
    Color? shadowColor,
    Color? sideColor,
    TextStyle? labelTextStyle,
  }) {
    return Button.raw(
      icon: icon ?? this.icon,
      labelText: labelText ?? this.labelText,
      onPressed: onPressed ?? this.onPressed,
      height: height ?? this.height,
      elevationHeight: elevationHeight ?? this.elevationHeight,
      paddings: paddings ?? this.paddings,
      iconSize: iconSize ?? this.iconSize,
      color: color ?? this.color,
      activeColor: activeColor ?? this.activeColor,
      shadowColor: shadowColor ?? this.shadowColor,
      sideColor: sideColor ?? this.sideColor,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
    );
  }

  const Button.rawSmall({
    super.key,
    this.icon,
    this.labelText,
    this.onPressed,
    required this.color,
    required this.activeColor,
    required this.sideColor,
    required this.shadowColor,
    required this.labelTextStyle,
  })  : height = 48,
        elevationHeight = 2,
        iconSize = 24,
        paddings = const ButtonPaddings(
          fromLabelToSide: 20,
          fromLabelToSideWhenAlone: 24,
          fromIconToLabel: 6,
          fromIconToSide: 16,
          fromIconToSideWhenAlone: 12,
        );

  const Button.rawLarge({
    super.key,
    this.icon,
    this.labelText,
    this.onPressed,
    required this.color,
    required this.activeColor,
    required this.sideColor,
    required this.shadowColor,
    required this.labelTextStyle,
  })  : height = 72,
        iconSize = 32,
        elevationHeight = 4,
        paddings = const ButtonPaddings(
          fromLabelToSide: 32,
          fromLabelToSideWhenAlone: 32,
          fromIconToLabel: 12,
          fromIconToSide: 24,
          fromIconToSideWhenAlone: 20,
        );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasLabel = labelText?.isNotEmpty == true;

    return ButtonBase(
      onPressed: onPressed,
      height: height,
      elevationHeight: elevationHeight,
      borderRadius: BorderRadius.circular(55),
      color: color,
      activeColor: activeColor,
      shadowColor: shadowColor,
      sideColor: sideColor,
      builder: (context, pressed) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (hasLabel)
            Padding(
              padding: icon != null
                  ? EdgeInsets.only(
                      left: paddings.fromLabelToSide,
                    )
                  : EdgeInsets.symmetric(
                      horizontal: paddings.fromLabelToSideWhenAlone,
                    ),
              child: Text(labelText ?? '', style: labelTextStyle),
            ),
          if (icon != null)
            Padding(
              padding: !hasLabel
                  ? EdgeInsets.symmetric(horizontal: paddings.fromIconToSideWhenAlone)
                  : EdgeInsets.only(left: paddings.fromIconToLabel, right: paddings.fromIconToSide),
              child: SizedBox(height: iconSize, width: iconSize, child: icon),
            ),
        ],
      ),
    );
  }
}
