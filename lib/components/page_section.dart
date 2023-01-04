import 'package:flutter/material.dart';

import '../helpers/btv_typography.dart';

class PageSection extends StatelessWidget {
  final String? title;
  final Widget child;
  final Widget? rightSlot;
  const PageSection({super.key, this.title, required this.child, this.rightSlot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 20,
              right: 16,
              bottom: 6,
            ),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: Text(
                    title!,
                    style: BtvTextStyles.title2,
                  ),
                )),
                if (rightSlot != null) rightSlot!
              ],
            ),
          ),
        child,
      ],
    );
  }
}
