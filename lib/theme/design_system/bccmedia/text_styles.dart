import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';

/// WARNING: We can only ensure pixel-perfect designs when these constants match figma 1-to-1.
/// These constants are manually set based on figma, so if you are going to do changes, remember to update both places.
///
/// Flutter docs about TextStyle.height:
/// When [height] is non-null, the line height of the span of text will be a
/// multiple of [fontSize] and be exactly `fontSize * height` logical pixels
/// tall.
///
/// So if figma says font size 34, spacing 40 we do: 40/34=1.17647059

class BccMediaTextStyles extends DesignSystemTextStyles {
  BccMediaTextStyles({required DesignSystemColors colors})
      : super(
          headline1: TextStyle(
            color: colors.label1,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w800,
            fontSize: 34,
            height: 1.1764705882352942,
          ),
          headline2: TextStyle(
            color: colors.label1,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w800,
            fontSize: 28,
            height: 1.1428571428571428,
          ),
          headline3: TextStyle(
            color: colors.label1,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w800,
            fontSize: 28,
            height: 1.1428571428571428,
          ),
          title1: TextStyle(
            color: colors.label1,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w800,
            fontSize: 24,
            height: 1.1666666666666667,
          ),
          title2: TextStyle(
            color: colors.label1,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            height: 1.2,
            letterSpacing: -0.3,
          ),
          title3: TextStyle(
            color: colors.label1,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w700,
            fontSize: 17,
            height: 1.1764705882352942,
          ),
          body1: TextStyle(
            color: colors.label4,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w400,
            fontSize: 19,
            height: 1.263157894736842,
          ),
          body2: TextStyle(
            color: colors.label4,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 1.25,
          ),
          body3: TextStyle(
            color: colors.label4,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 1.25,
          ),
          caption1: TextStyle(
            color: colors.label4,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 1.1428571428571428,
          ),
          caption2: TextStyle(
            color: colors.label4,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 1.1666666666666667,
          ),
          caption3: TextStyle(
            color: colors.label4,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w500,
            fontSize: 11,
            height: 1.0909090909090908,
            letterSpacing: -0.27,
          ),
          button1: TextStyle(
            color: colors.tint1,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            height: 1.3333333333333333,
          ),
          button2: TextStyle(
            color: colors.tint1,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w700,
            fontSize: 15,
            height: 1.6,
          ),
          overline: TextStyle(
            color: colors.label4,
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            height: 1.3333333333333333,
            letterSpacing: 1,
          ),
        );
}
