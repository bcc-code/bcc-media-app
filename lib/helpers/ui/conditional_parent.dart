import 'package:flutter/material.dart';

class ConditionalParentWidget extends StatelessWidget {
  const ConditionalParentWidget({
    super.key,
    required this.condition,
    required this.child,
    required this.conditionalBuilder,
  });

  final Widget child;
  final bool condition;
  final Widget Function(Widget child) conditionalBuilder;

  @override
  Widget build(BuildContext context) {
    return condition ? conditionalBuilder(child) : child;
  }
}
