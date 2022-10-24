import 'package:flutter/material.dart';

class BorderedImageContainer extends StatelessWidget {
  final ImageProvider<Object>? image;
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Widget? child;

  const BorderedImageContainer({
    super.key,
    this.image,
    this.width = double.infinity,
    this.height = double.infinity,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        image: image != null
            ? DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              )
            : null,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(255, 255, 255, 0.1),
        ),
        color: const Color.fromRGBO(29, 40, 56, 1),
      ),
      child: child,
    );
  }
}
