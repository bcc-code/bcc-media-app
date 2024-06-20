import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: width ?? 32,
        height: height ?? 32,
        child: const CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}
