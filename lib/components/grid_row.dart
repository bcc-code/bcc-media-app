import 'package:flutter/material.dart';

class GridRow extends StatelessWidget {
  final int colSize;
  final List<Widget> items;

  const GridRow({required this.items, required this.colSize});

  List<Widget> get spacedItems {
    if (items.length < colSize) {
      items.addAll(
        List<Container>.generate(
            colSize - items.length, (index) => Container()),
      );
    }

    final newItems = <Widget>[];
    for (var item in items) {
      newItems.add(Expanded(child: item));
      if (item != items.last) {
        newItems.add(const SizedBox(width: 16));
      }
    }
    return newItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: spacedItems,
      ),
    );
  }
}
