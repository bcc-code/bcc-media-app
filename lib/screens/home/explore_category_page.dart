import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../components/icon_label_button.dart';
import '../../components/general_app_bar.dart';
import '../../components/page/page.dart';

class HomeExploreCategoryScreen extends StatelessWidget {
  final String category;

  const HomeExploreCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: GeneralAppBar(
        title: Text(
          category,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leftActions: [
          IconLabelButton(
            imagePath: 'assets/icons/Left.png',
            labelText: 'Home',
            onPressed: () => context.router.pop(),
          ),
        ],
      ),
      body: BccmPage(
        code: 'explore_categories',
        parentPageName: category,
      ),
    );
  }
}
