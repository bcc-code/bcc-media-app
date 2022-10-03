import 'package:flutter/material.dart';

class HorizontalSlider extends StatelessWidget {
  final List<Widget> items;
  final EdgeInsets margin;
  final Clip clipBehaviour;

  const HorizontalSlider({
    required this.items,
    this.margin = EdgeInsets.zero,
    this.clipBehaviour = Clip.hardEdge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SingleChildScrollView(
        clipBehavior: clipBehaviour,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child:
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: items),
      ),
    );
  }
}
