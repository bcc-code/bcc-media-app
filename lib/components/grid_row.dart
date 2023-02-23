import 'package:flutter/material.dart';

class GridRow extends StatelessWidget {
  final int columnCount;
  final List<Widget> items;
  final EdgeInsetsGeometry? margin;
  final double gap;

  const GridRow({
    super.key,
    required this.items,
    required this.columnCount,
    this.margin,
    this.gap = 16.0,
  });

  List<Widget> get spacedItems {
    final newItems = <Widget>[];
    for (var item in items) {
      newItems.add(Expanded(child: item));
      if (item != items.last) {
        newItems.add(SizedBox(width: gap));
      }
    }

    var missingColumns = columnCount - items.length;
    if (missingColumns > 0) {
      newItems.addAll(
        List<Widget>.generate(missingColumns, (_) => const Spacer()),
      );
    }
    return newItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: spacedItems,
      ),
    );
  }
}
