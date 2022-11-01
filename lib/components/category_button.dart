import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final String? assetImage;
  final String? networkImage;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final double width;
  final double aspectRatio;

  const CategoryButton({
    super.key,
    required this.label,
    this.assetImage,
    this.networkImage,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(8),
    this.onTap,
    this.width = double.infinity,
    this.aspectRatio = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: width,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: padding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border:
                      Border.all(width: 1, color: BtvColors.seperatorOnLight),
                  color: BtvColors.background2,
                ),
                child: Center(
                  child: assetImage != null
                      ? Image.asset(
                          assetImage!,
                          height: double.infinity,
                          fit: BoxFit.fitHeight,
                        )
                      : Image.network(
                          networkImage!,
                          height: double.infinity,
                          fit: BoxFit.fitHeight,
                        ),
                ),
              ),
            ),
            SizedBox(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: BtvTextStyles.body2.copyWith(color: BtvColors.label1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
