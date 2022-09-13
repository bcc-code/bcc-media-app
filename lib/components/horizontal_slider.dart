import 'package:flutter/material.dart';

class HorizontalSlider extends StatelessWidget {
  final List<Widget> items;
  final EdgeInsets margin;

  const HorizontalSlider({required this.items, this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(children: items),
      ),
    );
  }
}
