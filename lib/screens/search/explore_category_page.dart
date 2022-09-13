import 'package:flutter/material.dart';

import 'explore_category_appbar.dart';

class ExploreCategoryScreen extends StatelessWidget {
  final String category;

  const ExploreCategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ExploreCategoryAppBar(title: category),
        body: Container(child: Text('Hello')));
  }
}
