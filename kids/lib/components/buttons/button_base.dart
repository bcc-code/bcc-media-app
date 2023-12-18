import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:brunstadtv_app/helpers/haptic_feedback.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';

import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/providers/sound_effects.dart';
import 'package:universal_io/io.dart';

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
  final double transition;

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
    this.transition = 1.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final pressed = useState(false);
    final limitedShadowHeight = max(2.0, elevationHeight / 2);
    final tapTimer = useMemoized(() => Stopwatch());
    final handlingRelease = useState(false);

    Future<void> push() async {
      if (tapTimer.isRunning) return;
      tapTimer.start();
      pressed.value = true;
      ref.read(soundEffectsProvider).queue(SoundEffects.buttonPush);
      CustomHapticFeedback.selectionClick();
    }

    Future<void> release() async {
      if (handlingRelease.value) return;
      handlingRelease.value = true;
      debugPrint("handling release");

      if (tapTimer.elapsedMilliseconds < 200) await Future.delayed(100.ms);
      if (!context.mounted) return;

      pressed.value = false;
      ref.read(soundEffectsProvider).queue(SoundEffects.buttonRelease);
      CustomHapticFeedback.heavyImpact();
      onPressed?.call();

      debugPrint("handling release DONE");
      await Future.delayed(100.ms);
      if (!context.mounted) return;
      tapTimer.stop();
      tapTimer.reset();
      handlingRelease.value = false;
    }

    return RepaintBoundary(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (e) {
          push();
        },
        onTapCancel: () {
          pressed.value = false;
          ref.read(soundEffectsProvider).queue(SoundEffects.buttonRelease);
          CustomHapticFeedback.selectionClick();
          tapTimer.stop();
          tapTimer.reset();
        },
        onTapUp: (e) {
          release();
        },
        child: FocusableControlBuilder(
          cursor: SystemMouseCursors.click,
          actions: {
            ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (intent) async {
              await push();
              release();
              return null;
            }),
          },
          builder: (context, control) => Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              boxShadow: pressed.value
                  ? null
                  : [
                      BoxShadow(
                        color: design.colors.label1.withOpacity(0.1 * transition),
                        offset: Offset(0, limitedShadowHeight * 2),
                        spreadRadius: 0,
                        blurRadius: 12,
                      ),
                      BoxShadow(
                        color: shadowColor != null
                            ? shadowColor!.withOpacity(shadowColor!.opacity * transition)
                            : design.colors.label1.withOpacity(0.1 * transition),
                        offset: Offset(0, limitedShadowHeight * transition),
                        blurRadius: 0,
                      ),
                    ],
            ),
            child: _InnerShadow(
              offset: pressed.value ? const Offset(0, 0) : Offset(0, -elevationHeight * transition),
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
    if (Platform.isAndroid) {
      final renderObject = _RenderInnerShadow();
      updateRenderObject(context, renderObject);
      return renderObject;
    }
    final renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    if (renderObject is _RenderInnerShadow) {
      renderObject.color = color;
      renderObject.shadowOffset = offset;
    } else if (renderObject is _RenderInnerShadowSkia) {
      renderObject.color = color;
      renderObject.shadowOffset = offset;
    }
  }
}

/// Note, this is intentionally complicated, because of
/// multiple blending mode bugs on impeller.
class _RenderInnerShadowSkia extends RenderProxyBox {
  late Color color;
  late Offset shadowOffset;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - offset.dx,
      size.height - offset.dy,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child!, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(offset.dx, offset.dy);
    context.paintChild(child!, offset);
    context.canvas
      ..restore()
      ..restore()
      ..restore();
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
