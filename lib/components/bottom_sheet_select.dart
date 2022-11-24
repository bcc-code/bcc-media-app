import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';
import 'option_list.dart';

class BottomSheetSelectResult {
  final bool cancelled;

  BottomSheetSelectResult({required this.cancelled});
}

class BottomSheetSelect extends StatefulWidget {
  final String selectedId;
  final String title;
  final List<Option> items;
  final bool showSelection;
  final void Function(String id) onSelectionChanged;

  const BottomSheetSelect({
    Key? key,
    required this.title,
    required this.items,
    required this.selectedId,
    this.showSelection = true,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  State<BottomSheetSelect> createState() => _BottomSheetSelectState();
}

class _BottomSheetSelectState extends State<BottomSheetSelect> {
  late String localSelectedId;
  @override
  void initState() {
    super.initState();
    localSelectedId = widget.selectedId;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BtvColors.background1,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: BtvColors.label4,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: BtvTextStyles.title3,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: OptionList(
                  optionData: widget.items,
                  currentSelection: localSelectedId,
                  showSelection: widget.showSelection,
                  onSelectionChange: (val) {
                    setState(() {
                      localSelectedId = val;
                    });
                    widget.onSelectionChanged(val);
                    Navigator.pop(context, BottomSheetSelectResult(cancelled: false));
                  },
                  margin: const EdgeInsets.all(0),
                  enableDivider: false,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 52.1,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: BtvColors.separatorOnLight,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                    side: const BorderSide(width: 1, color: BtvColors.separatorOnLight),
                  ),
                  onPressed: () {
                    Navigator.pop(context, BottomSheetSelectResult(cancelled: true));
                  },
                  child: Text(
                    S.of(context).cancel,
                    style: BtvTextStyles.button1.copyWith(color: BtvColors.label1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
