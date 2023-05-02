import 'package:flutter/material.dart';

import '../../theme/design_system/design_system.dart';

class BtvButton extends StatelessWidget {
  final Widget? image;
  final String labelText;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double gap;
  final double imageDimension;
  final Color backgroundColor;
  final BoxBorder? border;
  final TextStyle? textStyle;
  final bool disabled;

  const BtvButton({
    super.key,
    required this.onPressed,
    required this.labelText,
    this.backgroundColor = Colors.transparent,
    this.image,
    this.imageDimension = 24,
    this.border,
    this.gap = 6,
    this.textStyle,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(0),
    this.disabled = false,
  });

  BtvButton copyWith({
    Key? key,
    VoidCallback? onPressed,
    String? labelText,
    Color? backgroundColor,
    Widget? image,
    double? imageDimension,
    BoxBorder? border,
    double? gap,
    TextStyle? textStyle,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    bool? disabled,
  }) {
    return BtvButton(
      key: key ?? this.key,
      onPressed: onPressed ?? this.onPressed,
      labelText: labelText ?? this.labelText,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      image: image ?? this.image,
      imageDimension: imageDimension ?? this.imageDimension,
      border: border ?? this.border,
      gap: gap ?? this.gap,
      textStyle: textStyle ?? this.textStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    final disabledBorder = Border.all(color: DesignSystem.of(context).colors.separatorOnLight, width: 1);
    final disabledBackgroundColor = DesignSystem.of(context).colors.background1;
    final disabledTextColor = DesignSystem.of(context).colors.label4;
    final safeTextStyle = textStyle ?? DesignSystem.of(context).textStyles.button2;

    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: FocusableActionDetector(
          mouseCursor: MaterialStateMouseCursor.clickable,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: padding,
            decoration: BoxDecoration(
              border: disabled ? disabledBorder : border,
              borderRadius: BorderRadius.circular(borderRadius),
              color: disabled ? disabledBackgroundColor : backgroundColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (image != null)
                  Container(
                    margin: EdgeInsets.only(right: gap),
                    child: SizedBox(width: imageDimension, height: imageDimension, child: image),
                  ),
                Text(
                  labelText,
                  textAlign: TextAlign.center,
                  style: safeTextStyle.copyWith(color: disabled ? disabledTextColor : safeTextStyle.color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
