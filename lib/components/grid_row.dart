import 'package:flutter/material.dart';

class GridRow extends StatelessWidget {
  final int colSize;
  final List<Widget> items;
  final EdgeInsetsGeometry? margin;

  const GridRow({super.key, required this.items, required this.colSize, this.margin});

  List<Widget> get spacedItems {
    final newItems = <Widget>[];
    for (var item in items) {
      newItems.add(Expanded(child: item));
      if (item != items.last) {
        newItems.add(const SizedBox(width: 16));
      }
    }

    var missingColumns = colSize - items.length;
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
