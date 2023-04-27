import 'package:flutter/widgets.dart';

class NavigationOverride extends InheritedWidget {
  const NavigationOverride({super.key, required this.pushInsteadOfReplace, required super.child});

  final bool pushInsteadOfReplace;

  static NavigationOverride? of(BuildContext context) {
    final NavigationOverride? result = context.dependOnInheritedWidgetOfExactType<NavigationOverride>();
    return result;
  }

  @override
  bool updateShouldNotify(NavigationOverride oldWidget) => pushInsteadOfReplace != oldWidget.pushInsteadOfReplace;
}
