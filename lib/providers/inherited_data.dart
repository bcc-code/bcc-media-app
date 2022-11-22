import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/widgets.dart';

class InheritedData<T> extends InheritedWidget {
  final T inheritedData;
  InheritedData({
    super.key,
    required Widget Function(BuildContext) child,
    required this.inheritedData,
  }) : super(child: Builder(builder: child));
  @override
  bool updateShouldNotify(InheritedData oldWidget) => inheritedData != oldWidget.inheritedData;

  static T? read<T>(BuildContext context) =>
      context.getElementForInheritedWidgetOfExactType<InheritedData<T>>()?.widget.asOrNull<InheritedData<T>>()?.inheritedData;

  static T? listen<T>(BuildContext context) => context.dependOnInheritedWidgetOfExactType<InheritedData<T>>()?.inheritedData;
}
