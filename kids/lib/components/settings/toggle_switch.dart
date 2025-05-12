import 'dart:io';
import 'dart:ui';

import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final ValueNotifier<bool> controller;
  final Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final isSmall = bp.smallerThan(TABLET);

    return AdvancedSwitch(
      controller: controller,
      initialValue: controller.value,
      onChanged: (value) {
        onChanged?.call(value);
      },
      activeColor: design.colors.tint1,
      inactiveColor: design.colors.separatorOnLight,
      width: isSmall ? 50 : 77,
      height: isSmall ? 32 : 44,
      borderRadius: BorderRadius.circular(100),
      thumb: Container(
        child: _childWrap(
          builder: (child) {
            return Platform.isAndroid
                ? child
                : _InnerShadow(
                    offset: const Offset(0, -2),
                    color: Colors.black.withOpacity(0.2),
                    child: child,
                  );
          },
          child: Container(
            margin: isSmall ? const EdgeInsets.all(2) : const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: design.colors.background1,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(4, 18, 52, 0.2),
                  offset: const Offset(0, 2),
                ),
                BoxShadow(
                  color: Color.fromRGBO(4, 18, 52, 0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _childWrap({
  required Widget Function(Widget child) builder,
  required Widget child,
}) {
  return builder(child);
}

class _InnerShadow extends SingleChildRenderObjectWidget {
  const _InnerShadow({
    required this.color,
    required this.offset,
    super.child,
  });

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
