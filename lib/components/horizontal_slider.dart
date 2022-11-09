import 'package:flutter/material.dart';

class HorizontalSlider extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Clip clipBehaviour;
  final EdgeInsetsGeometry padding;
  final double gap;
  final double height;

  const HorizontalSlider({
    super.key,
    this.clipBehaviour = Clip.hardEdge,
    this.padding = EdgeInsets.zero,
    this.gap = 16,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 0, maxHeight: height),
      child: ListView.builder(
        padding: padding,
        cacheExtent: MediaQuery.of(context).size.width * 2,
        addAutomaticKeepAlives: false,
        clipBehavior: clipBehaviour,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(right: index == itemCount - 1 ? 0 : gap),
              child: itemBuilder(context, index));
        },
      ),
    );
  }
}
