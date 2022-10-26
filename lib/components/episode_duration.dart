import 'package:flutter/material.dart';

class EpisodeDuration extends StatelessWidget {
  final String duration;

  const EpisodeDuration({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(13, 22, 35, 0.7),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        duration,
        style: const TextStyle(
            fontSize: 11, fontWeight: FontWeight.w500, height: 1.1),
      ),
    );
  }
}
