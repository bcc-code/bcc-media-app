import 'package:brunstadtv_app/theme/design_system/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:brunstadtv_app/theme/bccm_gradients.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:brunstadtv_app/theme/design_system/bccmedia/buttons.dart';
import 'package:brunstadtv_app/theme/design_system/bccmedia/decorations.dart';
import 'package:kids/components/buttons/button.dart';

class BibleKidsDesignSystem extends DesignSystemData {
  BibleKidsDesignSystem._raw({
    required super.colors,
    required super.textStyles,
    required super.appThemeData,
    required super.materialThemeData,
    required super.buttons,
    required super.inputDecorations,
  });
  factory BibleKidsDesignSystem() {
    final colors = _Colors();
    final textStyles = BibleKidsTextStyles(colors: colors);
    return BibleKidsDesignSystem._raw(
      colors: colors,
      textStyles: textStyles,
      buttons: BibleKidsButtons(colors: colors, textStyles: textStyles),
      inputDecorations: BccMediaInputDecorations(colors: colors, textStyles: textStyles),
      appThemeData: AppThemeData(
        studyGradient: BccmGradients.greenYellow,
        genericBackgroundGradient: BccmGradients.purpleTransparentTopBottom,
        achievementBackgroundGradient: BccmGradients.purpleTransparent,
        appBarTransparent: false,
        tabTheme: AppTabThemeData(
          activeColor: colors.tint3,
          iconActiveGradient: LinearGradient(
            colors: [colors.tint3, colors.tint3],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      materialThemeData: ThemeData(
        useMaterial3: true,
        cupertinoOverrideTheme: CupertinoThemeData(
          barBackgroundColor: colors.background1,
          textTheme: CupertinoTextThemeData(
            tabLabelTextStyle: textStyles.caption3,
          ),
        ),
        dividerTheme: DividerThemeData(
          color: colors.separatorOnLight,
          thickness: 1,
        ),
        sliderTheme: SliderThemeData(inactiveTrackColor: colors.separatorOnLight),
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: colors.tint1,
          background: colors.background2,
        ),
        fontFamily: 'Noto Sans',
        canvasColor: colors.background1,
        highlightColor: colors.background2.withOpacity(0.5),
        splashColor: colors.background2.withOpacity(1),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: colors.tint1,
        ),
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.resolveWith((state) => state.contains(MaterialState.selected) ? colors.tint1 : colors.separatorOnLight),
          thumbColor: MaterialStateProperty.resolveWith((state) => colors.onTint),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: textStyles.title3.copyWith(height: 1),
          toolbarTextStyle: textStyles.button2,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 44,
          iconTheme: IconThemeData(color: colors.tint1),
          backgroundColor: colors.background1,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: colors.background2,
          contentTextStyle: textStyles.body1,
          titleTextStyle: textStyles.title3,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        scaffoldBackgroundColor: colors.background1,
        typography: Typography.material2021().copyWith(
          white: Typography.material2021().white.copyWith(
                headlineMedium: textStyles.headline2,
                bodyLarge: textStyles.body1,
                bodyMedium: textStyles.body2,
              ),
        ),
      ),
    );
  }
}

class _Colors extends DesignSystemColors {
  _Colors()
      : super(
          tint1: const Color(0xFFFDCA4E),
          tint1Dark: const Color(0xFFF2AE00),
          tint2: const Color(0xFFFDCA4E),
          tint3: const Color(0xFFFDCA4E),
          onTint: const Color(0xffFFFFFF),
          label1: const Color(0xFF041234),
          label2: const Color(0x99041234),
          label3: const Color(0x66041234),
          label4: const Color(0x66041234),
          background1: const Color(0xFFFFFFFF),
          background2: const Color(0xFFEFF3F9),
          separatorOnLight: const Color(0x1A051335),
          separator2: const Color(0xFFE9ECF4),
        );
}

/// WARNING: We can only ensure pixel-perfect designs when these constants match figma 1-to-1.
/// These constants are manually set based on figma, so if you are going to do changes, remember to update both places.
///
/// Flutter docs about TextStyle.height:
/// When [height] is non-null, the line height of the span of text will be a
/// multiple of [fontSize] and be exactly `fontSize * height` logical pixels
/// tall.
///
/// So if figma says font size 34, spacing 40 we do: 40/34=1.17647059

class BibleKidsTextStyles extends DesignSystemTextStyles {
  BibleKidsTextStyles({required DesignSystemColors colors})
      : super(
          headline1: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w800,
            fontSize: 44,
            height: 1.1764705882352942,
          ),
          headline2: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w800,
            fontSize: 32,
            height: 1.1428571428571428,
          ),
          headline3: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w800,
            fontSize: 24,
            height: 1.1428571428571428,
          ),
          title1: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w800,
            fontSize: 20,
            height: 1.1666666666666667,
          ),
          title2: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            height: 1.2,
            letterSpacing: -0.3,
          ),
          title3: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w700,
            fontSize: 13,
            height: 1.1764705882352942,
          ),
          body1: TextStyle(
            color: colors.label4,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w400,
            fontSize: 19,
            height: 1.263157894736842,
          ),
          body2: TextStyle(
            color: colors.label2,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            fontSize: 15,
            height: 1.25,
          ),
          body3: TextStyle(
            color: colors.label4,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 1.25,
          ),
          caption1: TextStyle(
            color: colors.label4,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 1.1428571428571428,
          ),
          caption2: TextStyle(
            color: colors.label4,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 1.1666666666666667,
          ),
          caption3: TextStyle(
            color: colors.label4,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            fontSize: 11,
            height: 1.0909090909090908,
            letterSpacing: -0.27,
          ),
          button1: TextStyle(
            color: colors.tint1,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            height: 1.3333333333333333,
          ),
          button2: TextStyle(
            color: colors.tint1,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w700,
            fontSize: 15,
            height: 1.6,
          ),
          overline: TextStyle(
            color: colors.label4,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            height: 1.3333333333333333,
            letterSpacing: 1,
          ),
        );
}

class BibleKidsButtons extends DesignSystemButtons {
  BibleKidsButtons({
    required this.colors,
    required this.textStyles,
  });

  final DesignSystemColors colors;
  final DesignSystemTextStyles textStyles;

  @override
  Widget large({Key? key, required VoidCallback onPressed, required String labelText, Widget? image, bool disabled = false, bool? autofocus}) {
    return Button.rawLarge(
      key: key,
      color: colors.tint1,
      activeColor: colors.tint1,
      icon: image,
      labelText: labelText,
      onPressed: onPressed,
      shadowColor: colors.label1.withOpacity(0.1),
      sideColor: const Color(0xFFF1B826),
    );
  }

  @override
  Widget largeGreen({Key? key, required VoidCallback onPressed, required String labelText, Widget? image, bool disabled = false, bool? autofocus}) {
    return large(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      disabled: disabled,
      image: image,
      autofocus: autofocus,
    );
  }

  @override
  Widget largeRed({Key? key, required VoidCallback onPressed, required String labelText, Widget? image, bool disabled = false, bool? autofocus}) {
    return large(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      disabled: disabled,
      image: image,
      autofocus: autofocus,
    );
  }

  @override
  Widget largeSecondary(
      {Key? key, required VoidCallback onPressed, required String labelText, Widget? image, bool disabled = false, bool? autofocus}) {
    return Button.rawLarge(
      key: key,
      color: colors.background1,
      activeColor: colors.background2,
      icon: image,
      labelText: labelText,
      onPressed: onPressed,
      shadowColor: colors.label1.withOpacity(0.2),
      sideColor: const Color(0xFFE9ECF4),
    );
  }

  @override
  Widget medium(
      {Key? key,
      required VoidCallback onPressed,
      required String labelText,
      Widget? image,
      bool disabled = false,
      Color? backgroundColor,
      Border? border}) {
    return small(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      disabled: disabled,
      image: image,
    );
  }

  @override
  Widget mediumGreen({Key? key, required VoidCallback onPressed, required String labelText, Widget? image, bool disabled = false, bool? autofocus}) {
    return small(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      disabled: disabled,
      image: image,
      autofocus: autofocus,
    );
  }

  @override
  Widget mediumRed({Key? key, required VoidCallback onPressed, required String labelText, Widget? image, bool disabled = false}) {
    return small(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      disabled: disabled,
      image: image,
    );
  }

  @override
  Widget mediumSecondary(
      {Key? key, required VoidCallback onPressed, required String labelText, Widget? image, bool disabled = false, bool? autofocus}) {
    return smallSecondary(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      autofocus: autofocus,
      disabled: disabled,
      image: image,
    );
  }

  @override
  Widget small({Key? key, required VoidCallback onPressed, required String labelText, Widget? image, bool disabled = false, bool? autofocus}) {
    return Button.rawSmall(
      key: key,
      color: colors.tint1,
      activeColor: colors.tint1,
      icon: image,
      labelText: labelText,
      onPressed: onPressed,
      shadowColor: colors.label1.withOpacity(0.1),
      sideColor: const Color(0xFFF1B826),
    );
  }

  @override
  Widget smallGreen({Key? key, required VoidCallback onPressed, required String labelText, Widget? image, bool disabled = false, bool? autofocus}) {
    return small(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      autofocus: autofocus,
      disabled: disabled,
      image: image,
    );
  }

  @override
  Widget smallRed({Key? key, required VoidCallback onPressed, required String labelText, Widget? image, bool disabled = false, bool? autofocus}) {
    return small(
      key: key,
      onPressed: onPressed,
      labelText: labelText,
      autofocus: autofocus,
      disabled: disabled,
      image: image,
    );
  }

  @override
  Widget smallSecondary(
      {Key? key, required VoidCallback onPressed, required String labelText, Widget? image, bool disabled = false, bool? autofocus}) {
    return Button.rawSmall(
      key: key,
      color: colors.background1,
      activeColor: colors.background1,
      icon: image,
      labelText: labelText,
      onPressed: onPressed,
      shadowColor: colors.label1.withOpacity(0.2),
      sideColor: const Color(0xFFE9ECF4),
    );
  }
}
