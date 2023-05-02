import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../theme/design_system/design_system.dart';
import '../theme/design_system/design_system.dart';
//listFrame.dart

class SettingList extends StatelessWidget {
  final List<OptionButton> buttons;

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
            indent: 16,
          );
        },
      ),
    );
  }
}

class OptionButton extends HookWidget {
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: FocusableActionDetector(
        mouseCursor: MaterialStateMouseCursor.clickable,
        onShowHoverHighlight: (value) => hovering.value = value,
        child: Container(
          height: 56,
          padding: const EdgeInsets.only(left: 16, right: 16),
          foregroundDecoration: BoxDecoration(color: hovering.value ? DesignSystem.of(context).colors.onTint.withOpacity(0.05) : null),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  optionName,
                  style: DesignSystem.of(context).textStyles.title3,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  currentSelection ?? '',
                  style: DesignSystem.of(context).textStyles.body2,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 13,
                color: DesignSystem.of(context).colors.label4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
