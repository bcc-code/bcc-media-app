import 'package:responsive_framework/responsive_framework.dart';

class BP {
  static const String sm = MOBILE;
  static const String md = TABLET;
  static const String lg = DESKTOP;
  static const String xl = 'extraLarge';
  static const String xxl = 'extraExtraLarge';
}

const breakpoints = [
  Breakpoint(start: 0, end: 450, name: BP.sm),
  Breakpoint(start: 451, end: 800, name: BP.md),
  Breakpoint(start: 801, end: 1024, name: BP.lg),
  Breakpoint(start: 1025, end: 1920, name: BP.xl),
  Breakpoint(start: 1921, end: double.infinity, name: BP.xxl),
];
