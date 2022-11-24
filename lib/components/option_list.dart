import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';

class OptionList extends StatelessWidget {
  final List<Option> optionData;
  final String currentSelection;
  final void Function(String) onSelectionChange;
  final EdgeInsetsGeometry margin;
  final bool enableDivider;
  final bool showSelection;

  const OptionList({
    super.key,
    required this.optionData,
    required this.currentSelection,
    required this.onSelectionChange,
    this.enableDivider = true,
    this.showSelection = true,
    this.margin = const EdgeInsets.only(top: 16, left: 16, right: 16),
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: BtvColors.background2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        cacheExtent: 100000,
        shrinkWrap: true,
        itemCount: optionData.length,
        itemBuilder: (context, index) {
          final option = optionData[index];
          final isOptionSelected = showSelection && (currentSelection.isNotEmpty && currentSelection == option.id);
          return _getOption(option, isOptionSelected);
        },
        separatorBuilder: (context, index) {
          return Visibility(
            visible: enableDivider,
            child: const Divider(
              height: 1,
              thickness: 1,
              indent: 16,
            ),
          );
        },
      ),
    );
  }

  SizedBox _getOption(Option option, bool isSelected) {
    return SizedBox(
      child: InkWell(
        onTapDown: (e) {
          onSelectionChange(option.id);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(minHeight: 56),
          child: Row(
            children: [
              if (option.icon != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3.2),
                  margin: const EdgeInsets.only(right: 16),
                  child: option.icon,
                ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.title,
                      style: BtvTextStyles.title3,
                    ),
                    (option.subTitle != null)
                        ? Container(
                            margin: const EdgeInsets.only(top: 2),
                            child: Text(
                              option.subTitle as String,
                              style: BtvTextStyles.caption1.copyWith(color: const Color.fromRGBO(235, 235, 245, 0.6)),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              if (isSelected) Image.asset('assets/icons/Check_circle.png', gaplessPlayback: true),
            ],
          ),
        ),
      ),
    );
  }
}

class Option {
  final String id;
  final String title;
  final Widget? icon;
  String? subTitle;

  Option({
    required this.id,
    required this.title,
    this.icon,
    this.subTitle,
  });
}
