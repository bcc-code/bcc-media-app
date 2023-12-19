import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/api.dart';
import 'package:bccm_core/design_system.dart';

class SectionWithHeader extends StatelessWidget {
  final String? title;
  final String? description;
  final Widget child;
  final Widget? rightSlot;
  const SectionWithHeader({super.key, this.title, this.description, required this.child, this.rightSlot});
  factory SectionWithHeader.fromFragment(Fragment$Section section, {required Widget child}) {
    return SectionWithHeader(title: section.title, description: section.description, child: child);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(
              left: kIsWeb ? 80 : 16,
              top: 20,
              right: 16,
              bottom: 6,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title!,
                    style: DesignSystem.of(context).textStyles.title2,
                  ),
                ),
                if (rightSlot != null) rightSlot!
              ],
            ),
          ),
        if (description?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(
              left: kIsWeb ? 80 : 16,
              right: 16,
              bottom: 8,
            ),
            child: Text(
              description!,
              style: DesignSystem.of(context).textStyles.body2.copyWith(color: DesignSystem.of(context).colors.label3),
            ),
          ),
        child,
      ],
    );
  }
}
