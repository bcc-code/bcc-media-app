import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:flutter/material.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/btv_colors.dart';

class PageDetailsSection extends StatelessWidget {
  final Fragment$Section$$PageDetailsSection data;

  const PageDetailsSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    if (data.title?.isEmpty == true && data.description?.isEmpty == true) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.title?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 20,
              right: 16,
              bottom: 6,
            ),
            child: Text(
              data.title!,
              style: BtvTextStyles.headline1,
            ),
          ),
        if (data.description?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 8,
            ),
            child: Text(
              data.description!,
              style: BtvTextStyles.body2.copyWith(color: BtvColors.label3),
            ),
          ),
      ],
    );
  }
}
