import 'package:flutter/material.dart';

class HorizontalSlider extends StatelessWidget {
  final List<Widget> items;
  final Clip clipBehaviour;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double gap;

  const HorizontalSlider({
    super.key,
    required this.items,
    this.clipBehaviour = Clip.hardEdge,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.gap = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: SingleChildScrollView(
        clipBehavior: clipBehaviour,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return Container(
                margin: EdgeInsets.only(right: item == items.last ? 0 : gap),
                child: item);
          }).toList(),
        ),
      ),
    );
  }
}
