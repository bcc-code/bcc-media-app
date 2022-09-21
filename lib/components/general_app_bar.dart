import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:my_app/components/icon_label_button.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> leftActions;
  final List<Widget> rightActions;

  const GeneralAppBar({
    required this.title,
    this.leftActions = const [],
    this.rightActions = const [],
  });

  openSortOptionsPane() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(204, 221, 255, 0.1),
          ),
        ),
      ),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
