import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List<Widget> children;
  final int columnCount;
  final double verticalSpacing;
  final double horizontalSpacing;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const CustomGridView({
    super.key,
    required this.children,
    this.columnCount = 2,
    this.horizontalSpacing = 16,
    this.verticalSpacing = 24,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.physics = const NeverScrollableScrollPhysics(),
    this.shrinkWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    final rowCount = (children.length / columnCount).ceil();
    return ListView.builder(
      primary: true,
      shrinkWrap: shrinkWrap,
      physics: physics,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = (constraints.maxWidth - gap * (columnCount - 1)) / columnCount;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
                .map(
                  (child) => Container(
                    width: itemWidth,
                    margin: child != children.last ? EdgeInsets.only(right: gap) : null,
                    child: child,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
