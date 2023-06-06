import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

EdgeInsets screenInsets(BuildContext context) => !kIsWeb
    ? EdgeInsets.zero
    : MediaQuery.of(context).size.width > 2200
        ? const EdgeInsets.symmetric(horizontal: 800)
        : MediaQuery.of(context).size.width > 1800
            ? const EdgeInsets.symmetric(horizontal: 500)
            : MediaQuery.of(context).size.width > 1200
                ? const EdgeInsets.symmetric(horizontal: 300)
                : MediaQuery.of(context).size.width > 900
                    ? const EdgeInsets.symmetric(horizontal: 150)
                    : const EdgeInsets.symmetric(horizontal: 80);

class ScreenInsetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScreenInsetAppBar({super.key, required this.appBar});

  final Widget appBar;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: screenInsets(context), child: appBar);
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
