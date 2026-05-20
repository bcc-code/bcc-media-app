import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:bccm_core/design_system.dart';
//listFrame.dart

class SettingList extends StatelessWidget {
  final List<SettingsButton> buttons;

  const SettingList({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(
          width: 1,
          color: DesignSystem.of(context).colors.separatorOnLight,
        )),
        color: DesignSystem.of(context).colors.background2,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return buttons[index];
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            thickness: 1,
          );
        },
      ),
    );
  }
}

abstract class SettingsButton extends HookWidget {
  const SettingsButton({super.key});
}

class OptionButton extends SettingsButton {
  final String optionName;
  final String? currentSelection;
  final VoidCallback onPressed;

  const OptionButton({
    super.key,
    required this.optionName,
    required this.onPressed,
    this.currentSelection,
  });

  @override
  Widget build(BuildContext context) {
    final hovering = useState(false);
    final design = DesignSystem.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: FocusableActionDetector(
        mouseCursor: WidgetStateMouseCursor.clickable,
        onShowHoverHighlight: (value) => hovering.value = value,
        child: Container(
          height: 56,
          padding: const EdgeInsets.only(left: 16, right: 16),
          foregroundDecoration: BoxDecoration(color: hovering.value ? design.colors.onTint.withOpacity(0.05) : null),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  optionName,
                  style: design.textStyles.title3,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  currentSelection ?? '',
                  style: design.textStyles.body2,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 13,
                color: design.colors.label4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToggleButton extends SettingsButton {
  final String optionName;
  final bool value;
  final VoidCallback onPressed;

  const ToggleButton({
    super.key,
    required this.optionName,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Container(
        height: 56,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                optionName,
                style: DesignSystem.of(context).textStyles.title3,
              ),
            ),
            Switch(
              value: value,
              onChanged: (_) {
                onPressed();
              },
              trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
                return design.colors.separator2;
              }),
              trackColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return design.colors.tint1;
                }
                return design.colors.background1;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
