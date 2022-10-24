import 'package:flutter/material.dart';

class Watched extends StatelessWidget {
  const Watched({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(13, 22, 35, 0.7),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Image.asset('assets/icons/Seen.png'),
    );
  }
}
