import 'dart:math';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';

import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/providers/sound_effects.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class ButtonPaddings {
  final double fromLabelToSide;
  final double fromLabelToSideWhenAlone;
  final double fromIconToLabel;
  final double fromIconToSide;
  final double fromIconToSideWhenAlone;

  const ButtonPaddings({
    required this.fromLabelToSide,
    required this.fromLabelToSideWhenAlone,
    required this.fromIconToLabel,
    required this.fromIconToSide,
    required this.fromIconToSideWhenAlone,
  });
}

class Button extends HookConsumerWidget {
  final Widget? icon;
  final String? labelText;
  final VoidCallback? onPressed;
  final double height;
  final double elevationHeight;
  final ButtonPaddings paddings;
  final double iconSize;
  final Color color;
  final Color activeColor;
  final Color? sideColor;
  final Color? shadowColor;
  final TextStyle labelTextStyle;

  const Button.raw({
    super.key,
    this.icon,
    this.labelText,
    this.onPressed,
    required this.iconSize,
    required this.paddings,
    required this.height,
    required this.elevationHeight,
    required this.color,
    required this.activeColor,
    required this.shadowColor,
    required this.sideColor,
    required this.labelTextStyle,
  });

  Button copyWith({
    Widget? icon,
    String? labelText,
    VoidCallback? onPressed,
    double? height,
    double? elevationHeight,
    ButtonPaddings? paddings,
    double? iconSize,
    Color? color,
    Color? activeColor,
    Color? shadowColor,
    Color? sideColor,
    TextStyle? labelTextStyle,
  }) {
    return Button.raw(
      icon: icon ?? this.icon,
      labelText: labelText ?? this.labelText,
      onPressed: onPressed ?? this.onPressed,
      height: height ?? this.height,
      elevationHeight: elevationHeight ?? this.elevationHeight,
      paddings: paddings ?? this.paddings,
      iconSize: iconSize ?? this.iconSize,
      color: color ?? this.color,
      activeColor: activeColor ?? this.activeColor,
      shadowColor: shadowColor ?? this.shadowColor,
      sideColor: sideColor ?? this.sideColor,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
    );
  }

  const Button.rawSmall({
    super.key,
    this.icon,
    this.labelText,
    this.onPressed,
    required this.color,
    required this.activeColor,
    required this.sideColor,
    required this.shadowColor,
    required this.labelTextStyle,
  })  : height = 48,
        elevationHeight = 2,
        iconSize = 24,
        paddings = const ButtonPaddings(
          fromLabelToSide: 20,
          fromLabelToSideWhenAlone: 24,
          fromIconToLabel: 6,
          fromIconToSide: 16,
          fromIconToSideWhenAlone: 12,
        );

  const Button.rawLarge({
    super.key,
    this.icon,
    this.labelText,
    this.onPressed,
    required this.color,
    required this.activeColor,
    required this.sideColor,
    required this.shadowColor,
    required this.labelTextStyle,
  })  : height = 72,
        iconSize = 32,
        elevationHeight = 4,
        paddings = const ButtonPaddings(
          fromLabelToSide: 32,
          fromLabelToSideWhenAlone: 32,
          fromIconToLabel: 12,
          fromIconToSide: 24,
          fromIconToSideWhenAlone: 20,
        );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasLabel = labelText?.isNotEmpty == true;
    final design = DesignSystem.of(context);
    final pressed = useState(false);
    final limitedShadowHeight = max(2.0, elevationHeight / 2);

    void push() {
      pressed.value = true;
      ref.read(soundEffectsProvider).queue(AssetSource(SoundEffects.buttonPush));
    }

    void release() {
      pressed.value = false;
      ref.read(soundEffectsProvider).queue(AssetSource(SoundEffects.buttonRelease));
    }

    void tapWithAnimation() {
      Future.delayed(const Duration(milliseconds: 10), () {
        onPressed?.call();
      });
      pressed.value = true;
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!context.mounted) return;
        pressed.value = false;
      });
    }

    return GestureDetector(
      onTapDown: (e) {
        push();
      },
      onTap: () {
        tapWithAnimation();
      },
      onTapCancel: () {
        release();
      },
      onTapUp: (e) {
        release();
      },
      child: FocusableControlBuilder(
        cursor: SystemMouseCursors.click,
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (intent) {
            return tapWithAnimation();
          }),
        },
        builder: (context, control) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(55),
            boxShadow: pressed.value
                ? null
                : [
                    BoxShadow(
                      color: design.colors.label1.withOpacity(0.1),
                      offset: Offset(0, limitedShadowHeight * 2),
                      spreadRadius: 0,
                      blurRadius: 12,
                    ),
                    BoxShadow(
                      color: shadowColor != null ? shadowColor! : design.colors.label1.withOpacity(0.1),
                      offset: Offset(0, limitedShadowHeight),
                      blurRadius: 0,
                    ),
                  ],
          ),
          child: _InnerShadow(
            offset: pressed.value ? const Offset(0, 0) : Offset(0, -elevationHeight),
            color: sideColor != null ? sideColor! : Colors.black.withOpacity(0.1),
            child: Container(
              decoration: BoxDecoration(
                color: !pressed.value ? color : activeColor,
                borderRadius: BorderRadius.circular(60),
              ),
              height: !pressed.value ? height : height - elevationHeight,
              padding: !pressed.value ? EdgeInsets.only(bottom: elevationHeight / 2) : null,
              margin: !pressed.value ? null : EdgeInsets.only(top: elevationHeight),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (hasLabel)
                    Padding(
                      padding: icon != null
                          ? EdgeInsets.only(
                              left: paddings.fromLabelToSide,
                            )
                          : EdgeInsets.symmetric(
                              horizontal: paddings.fromLabelToSideWhenAlone,
                            ),
                      child: Text(labelText ?? '', style: labelTextStyle),
                    ),
                  if (icon != null)
                    Padding(
                      padding: !hasLabel
                          ? EdgeInsets.symmetric(horizontal: paddings.fromIconToSideWhenAlone)
                          : EdgeInsets.only(left: paddings.fromIconToLabel, right: paddings.fromIconToSide),
                      child: SizedBox(height: iconSize, width: iconSize, child: icon),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Modified version of https://stackoverflow.com/a/62026779
class _InnerShadow extends SingleChildRenderObjectWidget {
  const _InnerShadow({
    Key? key,
    required this.color,
    required this.offset,
    Widget? child,
  }) : super(key: key, child: child);

  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(BuildContext context, _RenderInnerShadow renderObject) {
    renderObject.color = color;
    renderObject.shadowOffset = offset;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  late Color color;
  late Offset shadowOffset;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - shadowOffset.dx,
      size.height,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child!, offset);
    final Paint shadowPaint = Paint()..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, Paint()..blendMode = BlendMode.srcATop)
      ..saveLayer(rectInner, shadowPaint);
    context.canvas.drawPoints(
      PointMode.points,
      [
        rectInner.bottomRight,
      ],
      Paint()
        ..strokeWidth = 4
        ..color = Colors.white,
    );
    context.paintChild(child!, offset + Offset(0, shadowOffset.dy));
    context.canvas
      ..restore()
      ..restore()
      ..restore();
  }
}

extension ResponsiveButton on DesignSystemButtons {
  Widget responsive({
    Key? key,
    required VoidCallback onPressed,
    required String labelText,
    ButtonVariant variant = ButtonVariant.primary,
    Widget? image,
    bool disabled = false,
    bool? autofocus,
  }) {
    return Builder(builder: (context) {
      final bp = ResponsiveBreakpoints.of(context);
      if (bp.smallerThan(TABLET)) {
        return small(
          key: key,
          variant: variant,
          labelText: labelText,
          onPressed: onPressed,
          image: image,
          disabled: disabled,
          autofocus: autofocus,
        );
      } else {
        return large(
          key: key,
          variant: variant,
          labelText: labelText,
          onPressed: onPressed,
          image: image,
          disabled: disabled,
          autofocus: autofocus,
        );
      }
    });
  }
}
