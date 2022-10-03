import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final Map<String, dynamic> data;

  const ErrorMessage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(110, 176, 230, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        data['errorMessage']!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
