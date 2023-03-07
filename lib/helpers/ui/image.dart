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

Uri? getImageUri(String image, {int? width, int? height, ImageCropMode cropMode = ImageCropMode.faces}) {
  final originalUri = Uri.tryParse(image);
  if (originalUri == null) {
    return null;
  }
  var newQueryParams = Uri.splitQueryString(originalUri.query);
  if (width != null) newQueryParams['w'] = width.toString();
  if (height != null) newQueryParams['h'] = height.toString();
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
