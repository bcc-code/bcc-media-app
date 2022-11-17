import 'package:flutter/material.dart';

import '../helpers/btv_typography.dart';

class PageSection extends StatelessWidget {
  final String? title;
  final Widget child;
  const PageSection({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              top: 20,
              right: 16,
              bottom: 6,
            ),
            child: Text(
              title!,
              style: BtvTextStyles.title2,
            ),
          ),
        child,
      ],
    );
  }
}
