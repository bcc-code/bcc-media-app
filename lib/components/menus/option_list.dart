import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/svg_icons.dart';
import '../../theme/design_system/design_system.dart';

import '../../l10n/app_localizations.dart';

class OptionList extends StatelessWidget {
  final List<Option> optionData;
  final String? currentSelection;
  final void Function(String?) onSelectionChange;
  final bool enableDivider;
  final bool showSelection;
  final Color? backgroundColor;
  final bool showNoneOption;

  const OptionList({
    super.key,
    required this.optionData,
    required this.currentSelection,
    required this.onSelectionChange,
    this.enableDivider = false,
    this.showSelection = true,
    this.showNoneOption = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    List<Option> optionData = showNoneOption
        ? [
            Option(id: null, title: S.of(context).none),
            ...this.optionData,
          ]
        : this.optionData;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          ...optionData.map(
            (option) => _OptionListOption(
              onSelectionChange: onSelectionChange,
              option: option,
              isSelected: showSelection && currentSelection == option.id,
              backgroundColor: backgroundColor ?? DesignSystem.of(context).colors.background2,
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionListOption extends HookWidget {
  const _OptionListOption({
    required this.onSelectionChange,
    required this.option,
    required this.isSelected,
    required this.backgroundColor,
  });

  final void Function(String? p1) onSelectionChange;
  final Option option;
  final bool isSelected;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final hovering = useState(false);
    final animationController = useAnimationController(duration: const Duration(milliseconds: 300), initialValue: 1);
    final opacityReduction = useAnimation(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn, reverseCurve: Curves.easeIn).drive(Tween(begin: 0.3, end: 0.0)));
    return IgnorePointer(
      ignoring: option.disabled,
      child: FocusableActionDetector(
        mouseCursor: MaterialStateMouseCursor.clickable,
        onShowHoverHighlight: (value) => hovering.value = value,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (e) {
            animationController.value = 0;
          },
          onTapUp: (e) {
            onSelectionChange(option.id);
            animationController.forward();
          },
          onTapCancel: () {
            animationController.value = 1;
          },
          child: Container(
            decoration: BoxDecoration(
              color: option.disabled ? backgroundColor : backgroundColor.withOpacity(clampDouble(backgroundColor.opacity - opacityReduction, 0, 1)),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              constraints: const BoxConstraints(minHeight: 56),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          style: DesignSystem.of(context).textStyles.title3,
                        ),
                        (option.subTitle != null)
                            ? Container(
                                margin: const EdgeInsets.only(top: 2),
                                child: Text(
                                  option.subTitle as String,
                                  style: DesignSystem.of(context).textStyles.caption1.copyWith(color: const Color.fromRGBO(235, 235, 245, 0.6)),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  if (isSelected) SvgPicture.string(SvgIcons.checkIcon),
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