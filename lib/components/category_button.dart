import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final double width;
  final double padding;

  const CategoryButton({
    super.key,
    required this.label,
    required this.icon,
    this.width = 82,
    this.padding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: const Color(0x19ccddff)),
              color: const Color(0xff1d2838),
            ),
            padding: EdgeInsets.all(padding),
            child: icon,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Barlow',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
