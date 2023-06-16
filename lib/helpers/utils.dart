import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';

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
    FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
  }
}

Rect iPadSharePositionOrigin(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  return Rect.fromLTWH(0, 0, size.width, size.height / 2);
}
