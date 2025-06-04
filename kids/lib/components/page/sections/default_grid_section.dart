import 'package:bccm_core/platform.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultGridSection extends HookConsumerWidget {
  final Fragment$Section$$DefaultGridSection data;

  const DefaultGridSection(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.shrink();
  }
}
