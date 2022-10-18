import 'dart:ui';

import 'package:flutter/material.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> leftActions;
  final List<Widget> rightActions;
  // final double statusBarHeight;
  double totalHeight = 0;

  GeneralAppBar({
    super.key,
    required this.title,
    // this.statusBarHeight = 100,
    this.leftActions = const [],
    this.rightActions = const [],
  }) /*: totalHeight = statusBarHeight + kToolbarHeight*/;

  @override
  Widget build(BuildContext context) {
    print(kToolbarHeight);
    return /* ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: */
        Container(
      // padding: EdgeInsets.only(top: statusBarHeight),
      height: 44 /* totalHeight,*/,
      child: Row(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 11),
            child: Row(children: leftActions),
          ),
        ),
        title,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: rightActions,
            ),
          ),
        ),
      ]),
    ) /*,
      ),
    )*/
        ;
  }

  // @override
  // Size get preferredSize => Size.fromHeight(totalHeight);
  @override
  Size get preferredSize => const Size.fromHeight(44);
}
