import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/components/buttons/button_base.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

TextPainter _useTextPainter(TextDirection textDirection) {
  final textPainter = useState<TextPainter?>(null);
  useEffect(() {
    textPainter.value = TextPainter(textDirection: textDirection);
    return () => textPainter.value!.dispose();
    //ignore: exhaustive_keys
  }, [textDirection]);
  return textPainter.value!;
}

class KidsSearchBar extends HookWidget {
  const KidsSearchBar({
    super.key,
    required this.controller,
    required this.morphState,
    this.autofocus = false,
    this.onTapAsButton,
  });

  final TextEditingController controller;
  final double morphState;
  final bool autofocus;
  final VoidCallback? onTapAsButton;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final design = DesignSystem.of(context);
    final small = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    final animation = AlwaysStoppedAnimation(max(0.0, min(1.0, morphState)));

    final textStyle =
        small ? design.textStyles.body1.copyWith(color: design.colors.label1) : design.textStyles.title1.copyWith(color: design.colors.label1);
    final textPainter = _useTextPainter(Directionality.of(context));

    final textSpanSize = useMemoized(
      () {
        textPainter.text = TextSpan(text: controller.text, style: textStyle);
        textPainter.layout();
        return textPainter.size;
      },
      [textPainter, controller.text, textStyle],
    );

    return Stack(
      children: [
        Positioned.fill(
          child: ButtonBase(
              height: small ? 48 : 64,
              elevationHeight: 2,
              transition: animation.value,
              borderRadius: BorderRadius.circular(100),
              color: ColorTween(begin: design.colors.background2, end: design.colors.background1).evaluate(animation)!,
              activeColor: design.colors.background1,
              shadowColor: design.colors.label1.withOpacity(0.2),
              sideColor: const Color(0xFFE9ECF4),
              onPressed: () {
                focusNode.requestFocus();
                onTapAsButton?.call();
              },
              builder: (context, pressed) => Container()),
        ),
        IgnorePointer(
          ignoring: animation.value > 0.1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Stack(
              children: [
                Container(
                  height: small ? 48 : 64,
                  width: Tween(begin: small ? 400.0 : 480.0, end: textSpanSize.width + (small ? 80 : 100)).evaluate(animation),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(small ? 8 : 16).copyWith(right: small ? 8 : 12),
                        child: SvgPicture.string(SvgIcons.search),
                      ),
                      Expanded(
                        child: TextField(
                          focusNode: focusNode,
                          autofocus: autofocus,
                          controller: controller,
                          style: textStyle,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintMaxLines: 1,
                            hintStyle: small
                                ? design.textStyles.body1.copyWith(color: design.colors.label3)
                                : design.textStyles.title1.copyWith(color: design.colors.label3),
                          ),
                          cursorWidth: 2,
                          cursorHeight: 24,
                          cursorColor: design.colors.label1,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  right: 0,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.all(small ? 4 : 8),
                      child: Transform.translate(
                        offset: Offset(CurvedAnimation(parent: animation, curve: Curves.easeOut).value * 100, 0),
                        child: Transform.scale(
                          scale: 1.0 - CurvedAnimation(parent: animation, curve: Curves.easeOut).value,
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
                          ).copyWith(
                            height: small ? 40 : 48,
                            paddings: const ButtonPaddings.small().copyWith(fromIconToSideWhenAlone: small ? 8 : 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
