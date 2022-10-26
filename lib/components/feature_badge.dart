import 'package:flutter/material.dart';

class FeatureBadge extends StatelessWidget {
  final String label;
  final Color color;

  const FeatureBadge({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4, bottom: 2, right: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(204, 221, 255, 0.1),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
