import 'package:brunstadtv_app/helpers/ui/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_image/network.dart';

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
        return FadeInImage(
          fit: BoxFit.cover,
          placeholder: MemoryImage(kTransparentImage),
          image: networkImageWithRetryAndResize(
            imageUrl: url,
            cacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round(),
          ),
          imageErrorBuilder: imageErrorBuilder,
          fadeInDuration: const Duration(milliseconds: 400),
        );
      },
    );

ImageProvider<Object> networkImageWithRetryAndResize({
  required String imageUrl,
  int? cacheHeight,
}) =>
    ResizeImage.resizeIfNeeded(
      null,
      cacheHeight,
      NetworkImageWithRetry(
        imageUrl,
        headers: const {'Keep-Alive': 'timeout=20, max=5'},
      ),
    );

Widget imageErrorBuilder(context, error, stack) {
  return HookBuilder(builder: (context) {
    useEffect(() {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: Exception(['Image load failed', error]),
          stack: stack != StackTrace.empty ? stack : StackTrace.current,
        ),
      );
      return null;
    }, []);
    return const SizedBox.shrink();
  });
}
