import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../theme/design_system/design_system.dart';

String getFormattedAgeRating(String ageRating) {
  return ageRating == 'A' ? '0+' : '$ageRating+';
}

FutureBuilder simpleFutureBuilder<T>({
  required Future<T>? future,
  required Widget Function() loading,
  required Widget Function(T) ready,
  Widget Function(Object?)? error,
  Widget Function()? noData,
}) {
  loadingWidget() => loading();
  readyWidget(T data) => ready(data);
  errorWidget(Object? err) => error != null ? error(err) : const SizedBox.shrink();
  noDataWidget() => noData != null ? noData() : errorWidget(null);
  return FutureBuilder<T>(
    future: future,
    builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return loadingWidget();
      }
      if (snapshot.hasError) {
        return errorWidget(snapshot.error);
      }
      final data = snapshot.data;
      if (data != null) {
        return readyWidget(data);
      } else {
        return noDataWidget();
      }
    },
  );
}

Completer<T> wrapInCompleter<T>(Future<T> future) {
  final completer = Completer<T>();
  future.then(completer.complete).catchError(completer.completeError);
  return completer;
}

void tryCatchRecordError(dynamic Function() fn) {
  try {
    fn();
  } catch (e) {
    FlutterError.reportError(FlutterErrorDetails(exception: e, stack: StackTrace.current));
  }
}

Rect iPadSharePositionOrigin(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  return Rect.fromLTWH(0, 0, size.width, size.height / 2);
}

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
