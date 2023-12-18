import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';
import 'loading_indicator.dart';

class LoadingGeneric extends ConsumerWidget {
  const LoadingGeneric({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: const LoadingIndicator(),
        ),
        Text(
          text ?? S.of(context).loadingContent,
          style: DesignSystem.of(context).textStyles.body2,
        ),
      ]),
    );
  }
}
