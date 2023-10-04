import 'package:brunstadtv_app/theme/design_system/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bccm_gradients.dart';
import '../design_system.dart';
import '../bccmedia/buttons.dart';
import '../bccmedia/decorations.dart';
import '../bccmedia/text_styles.dart';

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
    final textStyles = BccMediaTextStyles(colors: colors);
    return BibleKidsDesignSystem._raw(
      colors: colors,
      textStyles: textStyles,
      buttons: BccMediaButtons(colors: colors, textStyles: textStyles),
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
        fontFamily: 'Barlow',
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
          tint1: const Color(0xffA1D1DD),
          tint2: const Color(0xffE26E86),
          tint3: const Color(0xffF4CC5C),
          onTint: const Color(0xffFFFFFF),
          label1: const Color(0xffFEFEFE),
          label2: const Color(0xffE4EEF1),
          label3: const Color(0xffD3DCDE),
          label4: const Color(0xffA9B7BC),
          background1: const Color(0xFFFFFFFF),
          background2: const Color(0xff255F74),
          separatorOnLight: const Color.fromRGBO(204, 221, 255, 0.1),
        );
}
