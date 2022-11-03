import 'package:extended_image/extended_image.dart';
import 'package:flutter/widgets.dart';

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
