import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final Widget icon;

  const CategoryButton({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0x19ccddff),
              width: 1,
            ),
            color: const Color(0xff1d2838),
          ),
          padding: const EdgeInsets.all(8),
          child: Container(
            width: 64,
            height: 64,
            padding: const EdgeInsets.only(
              top: 13,
              bottom: 12,
            ),
            child: icon,
          ),
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
    );
  }
}
