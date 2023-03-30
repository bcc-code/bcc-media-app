import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../theme/bccm_colors.dart';

class BirthYearPicker extends HookWidget {
  const BirthYearPicker({
    super.key,
    required this.focusNode,
    required this.onSelectedYearChanged,
  });

  final FocusNode focusNode;
  final void Function(int year) onSelectedYearChanged;

  @override
  Widget build(BuildContext context) {
    final minYear = DateTime.now().subtract(const Duration(days: 365 * 150)).year;
    final maxYear = DateTime.now().subtract(const Duration(days: 365 * 13)).year;
    final totalItems = (maxYear - minYear + 1);

    // Set initial value
    final startYear = (maxYear / 50).floor() * 50;
    final startIndex = totalItems - 1 - (maxYear - startYear);
    useMemoized(
      () => SchedulerBinding.instance.scheduleFrameCallback((_) => onSelectedYearChanged(startYear)),
      // ignore: exhaustive_keys
      [],
    );

    return Focus(
      focusNode: focusNode,
      child: CupertinoPicker.builder(
        childCount: totalItems,
        itemExtent: 32,
        scrollController: FixedExtentScrollController(initialItem: startIndex),
        onSelectedItemChanged: (index) => onSelectedYearChanged(minYear + index),
        selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(background: BccmColors.separatorOnLight),
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.center,
            child: Text((minYear + index).toString()),
          );
        },
      ),
    );
  }
}
