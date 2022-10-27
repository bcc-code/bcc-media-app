import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../helpers/btv_typography.dart';

class Section extends StatelessWidget {
  const Section({super.key, this.title, required this.child});

  final String? title;
  final Widget child;

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
              top: 19,
              right: 16,
              bottom: 5,
            ),
            child: Text(
              title!,
              style: BtvTextStyles.title2,
            ),
          ),
        child
      ],
    );
  }
}
