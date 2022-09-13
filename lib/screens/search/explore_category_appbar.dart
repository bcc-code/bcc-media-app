import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ExploreCategoryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const ExploreCategoryAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(title));
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
