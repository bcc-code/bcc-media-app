import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../graphql/queries/page.graphql.dart';
import 'package:bccm_core/design_system.dart';

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
              left: kIsWeb ? 80 : 16,
              top: 20,
              right: kIsWeb ? 80 : 16,
              bottom: 6,
            ),
            child: Text(
              data.title!,
              style: DesignSystem.of(context).textStyles.headline1,
            ),
          ),
        if (data.description?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(
              left: kIsWeb ? 80 : 16,
              right: kIsWeb ? 80 : 16,
              bottom: 8,
            ),
            child: Text(
              data.description!,
              style: DesignSystem.of(context).textStyles.body2.copyWith(color: DesignSystem.of(context).colors.label3),
            ),
          ),
      ],
    );
  }
}
