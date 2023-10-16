import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'app_theme.dart';

/// Looks complicated, but its just to get a DesignSystemData instance based on where we are in the widget tree.
/// See https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html
class DesignSystem extends InheritedWidget {
  final DesignSystemData designSystem;
  DesignSystem({
    super.key,
    required Widget Function(BuildContext) child,
    required this.designSystem,
  }) : super(child: Builder(builder: child));
  @override
  bool updateShouldNotify(DesignSystem oldWidget) => designSystem != oldWidget.designSystem;

  static DesignSystemData? read<T>(BuildContext context) =>
      context.getElementForInheritedWidgetOfExactType<DesignSystem>()?.widget.asOrNull<DesignSystem>()?.designSystem;

  static DesignSystemData? maybeOf<T>(BuildContext context) => context.dependOnInheritedWidgetOfExactType<DesignSystem>()?.designSystem;

  static DesignSystemData of<T>(BuildContext context) => context.dependOnInheritedWidgetOfExactType<DesignSystem>()!.designSystem;
}

class DesignSystemData {
  final AppThemeData appThemeData;
  final ThemeData materialThemeData;
  final DesignSystemColors colors;
  final DesignSystemTextStyles textStyles;
  final DesignSystemButtons buttons;
  final DesignSystemInputDecorations inputDecorations;
  const DesignSystemData({
    required this.appThemeData,
    required this.materialThemeData,
    required this.colors,
    required this.textStyles,
    required this.buttons,
    required this.inputDecorations,
  });
}

class DesignSystemTextStyles {
  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle body3;
  final TextStyle caption1;
  final TextStyle caption2;
  final TextStyle caption3;
  final TextStyle button1;
  final TextStyle button2;
  final TextStyle overline;

  DesignSystemTextStyles({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.caption1,
    required this.caption2,
    required this.caption3,
    required this.button1,
    required this.button2,
    required this.overline,
  });
}

class DesignSystemColors {
  final Color tint1;
  final Color tint1Dark;
  final Color tint2;
  final Color tint3;
  final Color onTint;
  final Color label1;
  final Color label2;
  final Color label3;
  final Color label4;
  final Color background1;
  final Color background2;
  final Color separatorOnLight;
  final Color separator2;

  DesignSystemColors({
    required this.tint1,
    required this.tint1Dark,
    required this.tint2,
    required this.tint3,
    required this.onTint,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.label4,
    required this.background1,
    required this.background2,
    required this.separatorOnLight,
    required this.separator2,
  });
}

enum ButtonVariant {
  primary,
  secondary,
  green,
  red,
}

abstract class DesignSystemButtons {
  Widget small({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    ButtonVariant variant,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  });

  Widget medium({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    ButtonVariant variant,
    Widget? image,
    bool disabled = false,
    Color? backgroundColor,
    Border? border,
  });

  Widget large({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    ButtonVariant variant,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  });
}

extension ResponsiveButton on DesignSystemButtons {
  Widget responsive({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    ButtonVariant variant = ButtonVariant.primary,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return Builder(builder: (context) {
      final bp = ResponsiveBreakpoints.of(context);
      if (bp.smallerThan(TABLET)) {
        return small(
          key: key,
          variant: variant,
          labelText: labelText,
          onPressed: onPressed,
          image: image,
          disabled: disabled,
          autofocus: autofocus,
        );
      } else {
        return large(
          key: key,
          variant: variant,
          labelText: labelText,
          onPressed: onPressed,
          image: image,
          disabled: disabled,
          autofocus: autofocus,
        );
      }
    });
  }
}

class DesignSystemInputDecorations {
  DesignSystemInputDecorations({
    required this.textFormField,
  });
  final InputDecoration textFormField;
}

class TypographyListForDebugging extends StatelessWidget {
  const TypographyListForDebugging({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = DesignSystem.of(context).textStyles;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Headline 1', style: textStyles.headline1),
      Text('Headline 2', style: textStyles.headline2),
      Text('Title 1', style: textStyles.title1),
      Text('Title 2', style: textStyles.title2),
      Text('Title 3', style: textStyles.title3),
      Text('Body 1', style: textStyles.body1),
      Text('Body 2', style: textStyles.body2),
      Text('Caption 1', style: textStyles.caption1),
      Text('Caption 2', style: textStyles.caption2),
      Text('Caption 3', style: textStyles.caption3),
      Text('Button 1', style: textStyles.button1),
      Text('Button 2', style: textStyles.button2),
      Text('button 2 upper'.toUpperCase(), style: textStyles.button2),
      Text('overline'.toUpperCase(), style: textStyles.overline),
    ]);
  }
}
