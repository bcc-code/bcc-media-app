import 'dart:ui';

import 'package:brunstadtv_app/helpers/btv_colors.dart';
import 'package:flutter/material.dart';

/// Flutter docs about TextStyle.height:
/// When [height] is non-null, the line height of the span of text will be a
/// multiple of [fontSize] and be exactly `fontSize * height` logical pixels
/// tall.
///
/// So if figma says font size 34, spacing 40 we do: 40/34=1.17647059

class BtvTextStyles {
  static const headline1 = TextStyle(
      color: BtvColors.label1,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w800,
      fontSize: 34,
      height: 1.1764705882352942);
  static const headline2 = TextStyle(
      color: BtvColors.label1,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w800,
      fontSize: 28,
      height: 1.1428571428571428);
  static const title1 = TextStyle(
      color: BtvColors.label1,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w800,
      fontSize: 24,
      height: 1.1666666666666667);
  static const title2 = TextStyle(
      color: BtvColors.label1,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w700,
      fontSize: 20,
      height: 1.2,
      letterSpacing: -0.3);
  static const title3 = TextStyle(
      color: BtvColors.label1,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w700,
      fontSize: 17,
      height: 1.1764705882352942);
  static const body1 = TextStyle(
      color: BtvColors.label4,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w400,
      fontSize: 19,
      height: 1.263157894736842);
  static const body2 = TextStyle(
      color: BtvColors.label4,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.25);
  static const caption1 = TextStyle(
      color: BtvColors.label4,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.1428571428571428);
  static const caption2 = TextStyle(
      color: BtvColors.label4,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 1.1666666666666667);
  static const caption3 = TextStyle(
      color: BtvColors.label4,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w500,
      fontSize: 11,
      height: 1.0909090909090908,
      letterSpacing: -0.27);
  static const button1 = TextStyle(
      color: BtvColors.tint1,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w700,
      fontSize: 18,
      height: 1.3333333333333333);
  static const button2 = TextStyle(
      color: BtvColors.tint1,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w700,
      fontSize: 15,
      height: 1.6);
  static const overline = TextStyle(
      color: BtvColors.label4,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w600,
      fontSize: 15,
      height: 1.3333333333333333,
      letterSpacing: 1);
}

class TypographyListForDebugging extends StatelessWidget {
  const TypographyListForDebugging({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Headline 1', style: BtvTextStyles.headline1),
      const Text('Headline 2', style: BtvTextStyles.headline2),
      const Text('Title 1', style: BtvTextStyles.title1),
      const Text('Title 2', style: BtvTextStyles.title2),
      const Text('Title 3', style: BtvTextStyles.title3),
      const Text('Body 1', style: BtvTextStyles.body1),
      const Text('Body 2', style: BtvTextStyles.body2),
      const Text('Caption 1', style: BtvTextStyles.caption1),
      const Text('Caption 2', style: BtvTextStyles.caption2),
      const Text('Caption 3', style: BtvTextStyles.caption3),
      const Text('Button 1', style: BtvTextStyles.button1),
      const Text('Button 2', style: BtvTextStyles.button2),
      Text('button 2 upper'.toUpperCase(), style: BtvTextStyles.button2),
      Text('overline'.toUpperCase(), style: BtvTextStyles.overline),
    ]);
  }
}
