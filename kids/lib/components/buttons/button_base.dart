import 'dart:math';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';

import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/providers/sound_effects.dart';

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

class ButtonBase extends HookConsumerWidget {
  final Widget Function(BuildContext context, bool isPressed) builder;
  final VoidCallback? onPressed;
  final double height;
  final double elevationHeight;
  final Color color;
  final Color activeColor;
  final Color? sideColor;
  final Color? shadowColor;
  final BorderRadius borderRadius;

  const ButtonBase({
    super.key,
    this.onPressed,
    required this.builder,
    required this.height,
    required this.elevationHeight,
    required this.color,
    required this.activeColor,
    required this.shadowColor,
    required this.sideColor,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            borderRadius: borderRadius,
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
                borderRadius: borderRadius,
              ),
              height: !pressed.value ? height : height - elevationHeight,
              padding: !pressed.value ? EdgeInsets.only(bottom: elevationHeight / 2) : null,
              margin: !pressed.value ? null : EdgeInsets.only(top: elevationHeight),
              child: builder(context, pressed.value),
            ),
          ),
        ),
      ),
    );
  }
}

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

/// Note, this is intentionally complicated, because of
/// multiple blending mode bugs on impeller.
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
    // Draw a point to force the layer size to be retained.
    // Otherwise, the layer will be collapsed to the size of the child.
    // Only happens on impeller.
    context.canvas.drawPoints(
      PointMode.points,
      [
        rectInner.bottomLeft,
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
