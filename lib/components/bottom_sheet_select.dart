import 'package:flutter/material.dart';

import '../theme/design_system/design_system.dart';

import '../l10n/app_localizations.dart';
import 'option_list.dart';
import '../helpers/insets.dart';

class BottomSheetSelectResult {
  final bool cancelled;

  BottomSheetSelectResult({required this.cancelled});
}

class BottomSheetSelect extends StatefulWidget {
  final String selectedId;
  final String title;
  final Widget? description;
  final List<Option> items;
  final bool showSelection;
  final void Function(String id) onSelectionChanged;
  final bool popOnChange;

  const BottomSheetSelect({
    Key? key,
    required this.title,
    this.description,
    required this.items,
    required this.selectedId,
    this.showSelection = true,
    required this.onSelectionChanged,
    this.popOnChange = true,
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
    final design = DesignSystem.of(context);
    return Container(
      color: design.colors.background1,
      child: SafeArea(
        child: Padding(
          padding: screenInsets(context) + const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 32),
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
                    color: design.colors.label4,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: design.textStyles.title3,
                ),
              ),
              if (widget.description != null) widget.description!,
              Flexible(
                child: OptionList(
                  optionData: widget.items,
                  currentSelection: localSelectedId,
                  showSelection: widget.showSelection,
                  onSelectionChange: (val) {
                    if (val == null) return;
                    setState(() {
                      localSelectedId = val;
                    });
                    widget.onSelectionChanged(val);
                    if (widget.popOnChange) {
                      Navigator.pop(context, BottomSheetSelectResult(cancelled: false));
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                width: double.infinity,
                height: 52.1,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: design.colors.separatorOnLight,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                    side: BorderSide(width: 1, color: design.colors.separatorOnLight),
                  ),
                  onPressed: () {
                    Navigator.pop(context, BottomSheetSelectResult(cancelled: true));
                  },
                  child: Text(
                    S.of(context).cancel,
                    style: design.textStyles.button1.copyWith(color: design.colors.label1),
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
