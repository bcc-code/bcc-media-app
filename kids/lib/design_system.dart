import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/design_system.dart';
import 'package:kids/components/buttons/button.dart';

class BibleKidsDesignSystem extends DesignSystemData {
  BibleKidsDesignSystem._raw({
    required super.colors,
    required super.textStyles,
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
      inputDecorations: _InputDecorations(colors: colors, textStyles: textStyles),
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
          surface: colors.background2,
        ),
        fontFamily: 'Noto Sans',
        canvasColor: colors.background1,
        highlightColor: colors.background2.withOpacity(0.5),
        splashColor: colors.background2.withOpacity(1),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: colors.tint1,
        ),
        switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.resolveWith((state) => state.contains(WidgetState.selected) ? colors.tint1 : colors.separatorOnLight),
          thumbColor: WidgetStateProperty.resolveWith((state) => colors.onTint),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: textStyles.title1.copyWith(height: 1),
          toolbarTextStyle: textStyles.button2,
          centerTitle: false,
          elevation: 0,
          toolbarHeight: 88,
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
          onTint: const Color(0xFF041234),
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
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
            fontSize: 44,
            height: 48 / 44,
          ),
          headline2: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            fontSize: 32,
            height: 40 / 32,
          ),
          headline3: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            fontSize: 24,
            height: 28 / 24,
          ),
          title1: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            height: 24 / 20,
          ),
          title2: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 20 / 16,
            letterSpacing: -0.3,
          ),
          title3: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w600,
            fontSize: 13,
            height: 16 / 13,
          ),
          body1: TextStyle(
            color: colors.label4,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            fontSize: 19,
            height: 24 / 19,
          ),
          body2: TextStyle(
            color: colors.label2,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            fontSize: 15,
            height: 20 / 15,
          ),
          body3: TextStyle(
            color: colors.label4,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 16 / 12,
          ),
          caption1: TextStyle(
            color: colors.label4,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            fontSize: 15,
            height: 20 / 15,
          ),
          caption2: TextStyle(
            color: colors.label4,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 16 / 12,
          ),
          caption3: TextStyle(
            color: colors.label4,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 16 / 12,
          ),
          button1: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 20 / 16,
            letterSpacing: -0.3,
          ),
          button2: TextStyle(
            color: colors.label1,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 20 / 16,
            letterSpacing: -0.3,
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
  Widget large({
    Key? key,
    required VoidCallback onPressed,
    String? labelText,
    ButtonVariant variant = ButtonVariant.primary,
    Widget? image,
    ButtonImagePosition? imagePosition,
    bool disabled = false,
    bool? autofocus,
  }) {
    final button = Button.rawLarge(
      key: key,
      color: colors.tint1,
      activeColor: colors.tint1,
      icon: image,
      labelText: labelText,
      onPressed: onPressed,
      shadowColor: colors.label1.withOpacity(0.1),
      sideColor: const Color(0xFFF1B826),
      labelTextStyle: textStyles.headline3,
    );

    return switch (variant) {
      ButtonVariant.secondary => button.copyWith(
          color: colors.background1,
          activeColor: colors.background1,
          shadowColor: colors.label1.withOpacity(0.2),
          sideColor: const Color(0xFFE9ECF4),
        ),
      _ => button
    };
  }

  @override
  Widget medium(
      {Key? key,
      required VoidCallback onPressed,
      String? labelText,
      ButtonVariant variant = ButtonVariant.primary,
      Widget? image,
      ButtonImagePosition? imagePosition,
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
  Widget small({
    Key? key,
    required VoidCallback onPressed,
    String? labelText,
    ButtonVariant variant = ButtonVariant.primary,
    Widget? image,
    ButtonImagePosition? imagePosition,
    bool disabled = false,
    bool? autofocus,
  }) {
    final button = Button.rawSmall(
      key: key,
      color: colors.tint1,
      activeColor: colors.tint1,
      icon: image,
      labelText: labelText,
      onPressed: onPressed,
      shadowColor: colors.label1.withOpacity(0.1),
      sideColor: const Color(0xFFF1B826),
      labelTextStyle: textStyles.title2,
    );

    return switch (variant) {
      ButtonVariant.secondary => button.copyWith(
          color: colors.background1,
          activeColor: colors.background1,
          shadowColor: colors.label1.withOpacity(0.2),
          sideColor: const Color(0xFFE9ECF4),
        ),
      _ => button
    };
  }
}

class _InputDecorations extends DesignSystemInputDecorations {
  _InputDecorations({
    required DesignSystemColors colors,
    required DesignSystemTextStyles textStyles,
  }) : super(
          textFormField: InputDecoration(
            filled: true,
            isDense: true,
            fillColor: colors.background2,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            contentPadding: const EdgeInsets.all(20),
            suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.tint1, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            hintStyle: textStyles.body1.copyWith(
              color: colors.label4,
              height: 1.45,
            ),
          ),
        );
}
