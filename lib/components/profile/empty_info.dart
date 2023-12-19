import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';

class EmptyInfo extends StatelessWidget {
  const EmptyInfo({
    Key? key,
    required this.icon,
    required this.title,
    required this.details,
  }) : super(key: key);

  final Widget icon;
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: design.colors.background2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            icon,
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                title, // <--- This is the bug. The title variable is used here instead of the constant string.
                style: design.textStyles.title2.copyWith(color: design.colors.label1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                details, // <--- This is the bug. The details variable is used here instead of the constant string.
                style: design.textStyles.body2.copyWith(color: design.colors.label3),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
