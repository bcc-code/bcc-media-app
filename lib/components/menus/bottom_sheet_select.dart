import 'package:flutter/material.dart';

import 'package:bccm_core/design_system.dart';

import '../../l10n/app_localizations.dart';
import 'option_list.dart';
import '../../helpers/insets.dart';

class BottomSheetSelectResult {
  final bool cancelled;

  BottomSheetSelectResult({required this.cancelled});
}

class BottomSheetSelect<T> extends StatefulWidget {
  final T selectedId;
  final String title;
  final Widget? description;
  final List<Option<T>> items;
  final bool showSelection;
  final void Function(T id) onSelectionChanged;
  final bool popOnChange;

  const BottomSheetSelect({
    super.key,
    required this.title,
    this.description,
    required this.items,
    required this.selectedId,
    this.showSelection = true,
    required this.onSelectionChanged,
    this.popOnChange = true,
  });

  @override
  State<BottomSheetSelect<T>> createState() => _BottomSheetSelectState<T>();
}

class _BottomSheetSelectState<T> extends State<BottomSheetSelect<T>> {
  late T localSelectedId;
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
      child: Padding(
        padding: screenInsets(context) + const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 32),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 8),
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: design.colors.label4,
                  ),
                ),
              ),
              Flexible(
                child: CustomScrollView(
                  primary: false,
                  shrinkWrap: true,
                  scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.only(top: 16, bottom: 24),
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: design.textStyles.title3,
                        ),
                      ),
                    ),
                    if (widget.description != null) SliverToBoxAdapter(child: widget.description!),
                    SliverToBoxAdapter(
                      child: OptionList<T>(
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
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
