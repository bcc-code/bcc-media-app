import 'package:flutter/material.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> leftActions;
  final List<Widget> rightActions;

  const GeneralAppBar({
    super.key,
    required this.title,
    this.leftActions = const [],
    this.rightActions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
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
