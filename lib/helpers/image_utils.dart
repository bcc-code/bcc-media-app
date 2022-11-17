const Map<ImageCropMode, String> _imageCropModeQueryParam = {ImageCropMode.faces: 'faces'};

enum ImageCropMode {
  faces,
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
