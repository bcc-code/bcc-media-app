import 'package:flutter/material.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KidsSearchBar extends StatelessWidget {
  const KidsSearchBar({
    super.key,
    required this.controller,
    this.autofocus = false,
  });

  final TextEditingController controller;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: design.colors.background2,
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.string(SvgIcons.search),
          ),
          Expanded(
            child: TextField(
              autofocus: autofocus,
              controller: controller,
              style: design.textStyles.body1.copyWith(color: design.colors.label1),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintMaxLines: 1,
                hintStyle: design.textStyles.body1.copyWith(color: design.colors.label3),
              ),
              cursorWidth: 2,
              cursorHeight: 24,
              cursorColor: design.colors.label1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0).copyWith(right: 0),
            child: Button.rawSmall(
              color: design.colors.background1,
              activeColor: design.colors.background1,
              shadowColor: design.colors.label1.withOpacity(0.2),
              labelTextStyle: const TextStyle(),
              sideColor: const Color(0xFFE9ECF4),
              labelText: '',
              onPressed: () {
                controller.clear();
              },
              icon: SvgPicture.string(SvgIcons.close),
            ).copyWith(height: 40, paddings: const ButtonPaddings.small().copyWith(fromIconToSideWhenAlone: 8)),
          ),
        ],
      ),
    );
  }
}
