import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';
import 'loading_indicator.dart';

class LoadingGeneric extends ConsumerWidget {
  const LoadingGeneric({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: const LoadingIndicator(),
        ),
        Text(
          S.of(context).loadingContent,
          style: BtvTextStyles.body2,
        ),
      ]),
    );
  }
}
