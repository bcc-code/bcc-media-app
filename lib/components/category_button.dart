import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final double width;
  final VoidCallback? onTap;
  double? height;
  double? _imageWidth;

  CategoryButton({
    super.key,
    required this.label,
    required this.imagePath,
    this.width = 82,
    this.height,
    this.onTap,
  }) {
    height = height ?? width * (9 / 16);
    _imageWidth = width * 0.39;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: const Color(0x19ccddff)),
              color: const Color(0xff1d2838),
            ),
            child: Center(
                child: Image.asset(imagePath,
                    width: _imageWidth, height: _imageWidth, fit: BoxFit.fill)),
          ),
          SizedBox(
            width: width,
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
    );
  }
}
