import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

MarkdownStyleSheet getMarkdownStyleSheet(BuildContext context) {
  final design = DesignSystem.of(context);
  return MarkdownStyleSheet.fromTheme(
    Theme.of(context).copyWith(
      textTheme: Theme.of(context).textTheme.apply(bodyColor: design.colors.label3, displayColor: design.colors.label3),
    ),
  ).copyWith(
    horizontalRuleDecoration: BoxDecoration(border: Border.all(width: 1, color: design.colors.separatorOnLight)),
    h1: design.textStyles.headline1.copyWith(color: design.colors.label3),
    h2: design.textStyles.headline2.copyWith(color: design.colors.label3),
    h3: design.textStyles.title1.copyWith(color: design.colors.label3),
    h4: design.textStyles.title2.copyWith(color: design.colors.label3),
    h5: design.textStyles.title3.copyWith(color: design.colors.label3),
    h6: design.textStyles.body1.copyWith(color: design.colors.label3),
    a: design.textStyles.body2.copyWith(color: DesignSystem.of(context).colors.tint1, decoration: TextDecoration.underline),
    blockquoteDecoration: BoxDecoration(
      color: Colors.transparent,
      border: Border(
        left: BorderSide(width: 4, color: design.colors.separatorOnLight),
      ),
    ),
    blockquotePadding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
  );
}
