import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;

  const CategoryButton({
    super.key,
    required this.label,
    required this.imagePath,
    this.margin = const EdgeInsets.all(0),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: const Color(0x19ccddff)),
                  color: const Color(0xff1d2838),
                ),
                child: Center(
                  child: Image.asset(
                    imagePath,
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
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
