import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List<Widget> children;
  final int columnCount;
  final double verticalSpacing;
  final double horizontalSpacing;
  final EdgeInsets? padding;

  const CustomGridView({
    super.key,
    required this.children,
    this.columnCount = 2,
    this.horizontalSpacing = 16,
    this.verticalSpacing = 24,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    final rowCount = (children.length / columnCount).ceil();
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      itemCount: rowCount,
      itemBuilder: (context, rowIndex) {
        final firstIndex = rowIndex * columnCount;
        final rowItems =
            (firstIndex + columnCount <= children.length) ? children.sublist(firstIndex, firstIndex + columnCount) : children.sublist(firstIndex);
        return GridRow(
          margin: (rowIndex < rowCount - 1) ? EdgeInsets.only(bottom: verticalSpacing) : null,
          gap: horizontalSpacing,
          columnCount: columnCount,
          children: rowItems,
        );
      },
    );
  }
}

class GridRow extends StatelessWidget {
  final int columnCount;
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  final double gap;

  const GridRow({
    super.key,
    required this.children,
    required this.columnCount,
    this.margin,
    this.gap = 16.0,
  });

  List<Widget> get spacedChildren {
    final newChildren = <Widget>[];
    for (var child in children) {
      newChildren.add(Expanded(child: child));
      if (child != children.last) {
        newChildren.add(SizedBox(width: gap));
      }
    }

    var missingColumns = columnCount - children.length;
    if (missingColumns > 0) {
      newChildren.addAll(
        List<Widget>.generate(missingColumns, (_) => const Spacer()),
      );
    }
    return newChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: spacedChildren,
      ),
    );
  }
}
