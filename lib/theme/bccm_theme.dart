import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BccmTheme {
  BccmTheme._();
  static ThemeData getThemeData() {
    return ThemeData(
      //useMaterial3: true,
      cupertinoOverrideTheme: const CupertinoThemeData(
        barBackgroundColor: BccmColors.background1,
        textTheme: CupertinoTextThemeData(
          tabLabelTextStyle: BccmTextStyles.caption3,
        ),
      ),
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: BccmColors.tint1,
        background: BccmColors.background2,
      ),
      fontFamily: 'Barlow',
      canvasColor: BccmColors.background1,
      highlightColor: BccmColors.background2.withOpacity(0.5),
      splashColor: BccmColors.background2.withOpacity(1),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: BccmColors.tint1,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: BccmTextStyles.title3.copyWith(height: 1),
        toolbarTextStyle: BccmTextStyles.button2,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 44,
        iconTheme: const IconThemeData(color: BccmColors.tint1),
        backgroundColor: BccmColors.background1,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: BccmColors.background2,
        contentTextStyle: BccmTextStyles.body1,
        titleTextStyle: BccmTextStyles.title3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      scaffoldBackgroundColor: BccmColors.background1,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: BccmColors.tint1,
        elevation: 0,
        selectedLabelStyle: BccmTextStyles.caption3.copyWith(color: BccmColors.tint1),
        unselectedLabelStyle: BccmTextStyles.caption3,
      ),
      typography: Typography.material2021().copyWith(
        white: Typography.material2021().white.copyWith(
              headlineMedium: BccmTextStyles.headline2,
              bodyLarge: BccmTextStyles.body1,
              bodyMedium: BccmTextStyles.body2,
            ),
      ),
    );
  }

  static void configureSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
      ),
    );

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
