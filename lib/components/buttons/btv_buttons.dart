import 'package:flutter/material.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';

import 'package:bccm_core/design_system.dart';

class BtvButton extends StatelessWidget {
  final Widget? image;
  final String? labelText;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double gap;
  final double imageDimension;
  final Color backgroundColor;
  final BoxBorder? border;
  final TextStyle? textStyle;
  final bool disabled;
  final bool? autofocus;
  final ButtonImagePosition imagePosition;

  const BtvButton({
    super.key,
    required this.onPressed,
    this.labelText,
    this.backgroundColor = Colors.transparent,
    this.image,
    this.imageDimension = 24,
    this.border,
    double? gap,
    this.textStyle,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(0),
    this.disabled = false,
    this.autofocus,
    ButtonImagePosition? imagePosition,
  })  : imagePosition = imagePosition ?? ButtonImagePosition.left,
        gap = gap ?? (labelText == null ? 0 : 6);

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
    ButtonImagePosition? imagePosition,
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
      imagePosition: imagePosition ?? this.imagePosition,
    );
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final disabledBorder = Border.all(color: design.colors.separatorOnLight, width: 1);
    final disabledBackgroundColor = design.colors.background1;
    final disabledTextColor = design.colors.label4;
    final safeTextStyle = textStyle ?? design.textStyles.button2;

    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: FocusableControlBuilder(
          autoFocus: autofocus ?? false,
          cursor: SystemMouseCursors.click,
          actions: {
            ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (intent) {
              return onPressed();
            }),
          },
          builder: (_, state) => AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
            padding: labelText != null ? padding : const EdgeInsets.all(12),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: state.isFocused
                  ? Border.all(
                      width: 1,
                      color: design.colors.onTint.withOpacity(1),
                    )
                  : null,
            ),
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
                if (image != null && imagePosition == ButtonImagePosition.left)
                  Container(
                    margin: EdgeInsets.only(right: gap),
                    child: SizedBox(width: imageDimension, height: imageDimension, child: image),
                  ),
                if (labelText?.isNotEmpty == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        labelText!,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: safeTextStyle.copyWith(color: disabled ? disabledTextColor : safeTextStyle.color),
                      ),
                    ),
                  ),
                if (image != null && imagePosition == ButtonImagePosition.right)
                  Container(
                    margin: EdgeInsets.only(left: gap),
                    child: SizedBox(width: imageDimension, height: imageDimension, child: image),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
