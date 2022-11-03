import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BorderedImageContainer extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Widget? child;

  const BorderedImageContainer({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1,
            color: const Color.fromRGBO(255, 255, 255, 0.1),
          ),
          color: const Color.fromRGBO(29, 40, 56, 1),
        ),
        child: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            if (imageUrl != null) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: FadeInImage.memoryNetwork(
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        debugPrint(stackTrace.toString());
                        return Text('error');
                      },
                      placeholderErrorBuilder: (context, error, stackTrace) {
                        debugPrint(stackTrace.toString());
                        return Text('error p');
                      },
                      placeholder: kTransparentImage,
                      image: imageUrl!,
                      fadeInDuration: const Duration(milliseconds: 400),
                      imageCacheHeight: (constraints.maxHeight *
                              MediaQuery.of(context).devicePixelRatio)
                          .round()),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ));
  }
}
