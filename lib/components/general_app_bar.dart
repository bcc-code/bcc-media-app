import 'package:flutter/material.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget> leftActions;
  final List<Widget> rightActions;

  const GeneralAppBar({
    super.key,
    this.title,
    this.leftActions = const [],
    this.rightActions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 44,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(children: [
            Expanded(
              child: Row(children: leftActions),
            ),
            if (title != null) title!,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: rightActions,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
