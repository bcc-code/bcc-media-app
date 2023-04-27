import 'package:brunstadtv_app/helpers/ui/transparent_image.dart';
import 'package:flutter/material.dart';

const Map<ImageCropMode, String> _imageCropModeQueryParam = {
  ImageCropMode.faces: 'faces',
  ImageCropMode.center: 'center',
};

enum ImageCropMode {
  faces,
  center,
}

final imageWidths = [16, 240, 500, 680, 1024, 1600, 1920];
final imageHeights = [16, 240, 500, 680, 1024, 1600, 1920];

Uri? getImageUri(String image, {int? width, int? height, ImageCropMode cropMode = ImageCropMode.faces}) {
  assert(
    width == null || height == null,
    '''Either width or height needs to be null. Use the dimension that changes least.
    Having one dimension plays better with web and desktop, where the screen can be resized a lot.''',
  );
  final originalUri = Uri.tryParse(image);
  if (originalUri == null) {
    return null;
  }
  int? targetWidth;
  if (width != null) {
    targetWidth = imageWidths.firstWhere((w) => w >= width, orElse: () => imageWidths.last);
  }
  int? targetHeight;
  if (height != null) {
    targetHeight = imageHeights.firstWhere((h) => h >= height, orElse: () => imageHeights.last);
  }

  var newQueryParams = Uri.splitQueryString(originalUri.query);
  if (targetWidth != null) newQueryParams['w'] = targetWidth.toString();
  if (targetHeight != null) newQueryParams['h'] = targetHeight.toString();
  newQueryParams['fit'] = 'crop';

  final cropModeString = _imageCropModeQueryParam[cropMode];
  if (cropModeString != null) newQueryParams['crop'] = cropModeString;

  return Uri(
      fragment: originalUri.fragment,
      host: originalUri.host,
      path: originalUri.path,
      port: originalUri.port,
      scheme: originalUri.scheme,
      queryParameters: newQueryParams);
}

Widget simpleFadeInImage({required String url, Duration? duration}) => LayoutBuilder(
      builder: (context, constraints) {
        return FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            placeholder: kTransparentImage,
            image: url,
            fadeInDuration: const Duration(milliseconds: 400),
            imageCacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round());
      },
    );
