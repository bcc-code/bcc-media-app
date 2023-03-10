import 'package:flutter/material.dart';
import '../../theme/bccm_colors.dart';
import '../../theme/bccm_typography.dart';

class SignupPageWrapper extends StatelessWidget {
  const SignupPageWrapper({super.key, required this.body, this.bottomArea, this.title, this.description});

  final List<Widget> body;
  final List<Widget>? bottomArea;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (title != null)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(title!, style: BccmTextStyles.headline1),
                            ),
                          if (description != null)
                            Text(
                              description!,
                              style: BccmTextStyles.body1.copyWith(color: BccmColors.label3),
                            ),
                          ...body
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            ...?bottomArea
          ],
        ),
      ),
    );
  }
}
