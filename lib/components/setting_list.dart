import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../theme/bccm_colors.dart';
//listFrame.dart

class SettingList extends StatelessWidget {
  final List<OptionButton> buttons;

  const SettingList({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(
          width: 1,
          color: BccmColors.separatorOnLight,
        )),
        color: BccmColors.background2,
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
          foregroundDecoration: BoxDecoration(color: hovering.value ? BccmColors.onTint.withOpacity(0.05) : null),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  optionName,
                  style: BccmTextStyles.title3,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  currentSelection ?? '',
                  style: BccmTextStyles.body2,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 13,
                color: BccmColors.label4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
