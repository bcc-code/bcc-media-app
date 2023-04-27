import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';
import '../l10n/app_localizations.dart';

class OptionList extends StatelessWidget {
  final List<Option> optionData;
  final String? currentSelection;
  final void Function(String?) onSelectionChange;
  final EdgeInsetsGeometry margin;
  final bool enableDivider;
  final bool showSelection;
  final Color backgroundColor;
  final bool showNoneOption;

  const OptionList({
    super.key,
    required this.optionData,
    required this.currentSelection,
    required this.onSelectionChange,
    this.enableDivider = false,
    this.showSelection = true,
    this.showNoneOption = false,
    this.margin = const EdgeInsets.only(top: 16, left: 16, right: 16),
    this.backgroundColor = BccmColors.background2,
  });

  @override
  Widget build(BuildContext context) {
    List<Option> optionData = showNoneOption
        ? [
            Option(id: null, title: S.of(context).none),
            ...this.optionData,
          ]
        : this.optionData;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false), // Disable over-scroll glow effect
        child: ListView.separated(
          cacheExtent: 100000,
          shrinkWrap: true,
          itemCount: optionData.length,
          itemBuilder: (context, index) {
            final option = optionData[index];
            final isOptionSelected = showSelection && currentSelection == option.id;
            return _OptionListOption(onSelectionChange: onSelectionChange, option: option, isSelected: isOptionSelected);
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
      ),
    );
  }
}

class _OptionListOption extends HookWidget {
  const _OptionListOption({
    required this.onSelectionChange,
    required this.option,
    required this.isSelected,
  });

  final void Function(String? p1) onSelectionChange;
  final Option option;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final hovering = useState(false);
    return IgnorePointer(
      ignoring: option.disabled,
      child: FocusableActionDetector(
        mouseCursor: MaterialStateMouseCursor.clickable,
        onShowHoverHighlight: (value) => hovering.value = value,
        child: Container(
          foregroundDecoration: BoxDecoration(
            color: option.disabled
                ? BccmColors.background1.withAlpha(100)
                : hovering.value
                    ? null // BccmColors.onTint.withOpacity(0.05)
                    : null,
          ),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
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
                          style: BccmTextStyles.title3,
                        ),
                        (option.subTitle != null)
                            ? Container(
                                margin: const EdgeInsets.only(top: 2),
                                child: Text(
                                  option.subTitle as String,
                                  style: BccmTextStyles.caption1.copyWith(color: const Color.fromRGBO(235, 235, 245, 0.6)),
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
        ),
      ),
    );
  }
}

class Option {
  final String? id;
  final String title;
  final Widget? icon;
  bool disabled;
  String? subTitle;

  Option({
    required this.id,
    required this.title,
    this.disabled = false,
    this.icon,
    this.subTitle,
  });
}
