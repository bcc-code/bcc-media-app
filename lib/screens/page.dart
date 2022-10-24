import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../components/icon_label_button.dart';
import '../components/general_app_bar.dart';
import '../components/page/page.dart';

class PageScreen extends StatelessWidget {
  final String pageCode;
  final String pageTitle;

  const PageScreen({
    super.key,
    @PathParam() required this.pageCode,
    required this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        title: Text(
          pageTitle,
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
        pageCode: pageCode,
      ),
    );
  }
}
