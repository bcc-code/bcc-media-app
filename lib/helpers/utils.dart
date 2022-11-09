import 'package:extended_image/extended_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/video_state.dart';

T? cast<T>(x) => x is T ? x : null;

extension AsExtension on Object? {
  X as<X>() => this as X;
  X? asOrNull<X>() {
    var self = this;
    return self is X ? self : null;
  }
}

ImageProvider cacheOptimizedImage(
    {required BuildContext context,
    required String imageUrl,
    required double height}) {
  return ExtendedResizeImage.resizeIfNeeded(
      provider: ExtendedNetworkImageProvider(imageUrl),
      cacheHeight: (height * MediaQuery.of(context).devicePixelRatio).round());
}

String getFormattedAgeRating(String ageRating) {
  return ageRating == 'A' ? 'A' : '$ageRating+';
}

FutureBuilder simpleFutureBuilder<T>(
    {required Future<T> future,
    required Widget Function() loading,
    required Widget Function(Object?) error,
    required Widget Function() noData,
    required Widget Function(T) ready}) {
  return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return error(snapshot.error);
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return loading();
        }
        final data = snapshot.data;
        if (data != null) {
          return ready(data);
        } else {
          return noData();
        }
      });
}
