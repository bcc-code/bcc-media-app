import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Button extends HookWidget {
  const Button({
    super.key,
    this.icon,
    this.labelText,
    this.onPressed,
  });

  final Widget? icon;
  final String? labelText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final hasLabel = labelText?.isNotEmpty == true;
    final design = DesignSystem.of(context);
    final pressed = useState(false);
    return GestureDetector(
      onTapDown: (e) {
        pressed.value = true;
      },
      onTap: () {
        pressed.value = true;
        Future.delayed(Duration(milliseconds: 100), () {
          onPressed?.call();
          if (!context.mounted) return;
          pressed.value = false;
        });
      },
      onTapCancel: () {
        pressed.value = false;
      },
      onTapUp: (e) {
        pressed.value = false;
      },
      child: FocusableControlBuilder(
        builder: (context, control) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(55),
            boxShadow: [
              if (!pressed.value)
                BoxShadow(
                  color: design.colors.label1.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                  blurRadius: 12,
                ),
              if (!pressed.value)
                BoxShadow(
                  color: design.colors.label1.withOpacity(0.1),
                  offset: const Offset(0, 2),
                  blurRadius: 0,
                ),
            ],
          ),
          child: InnerShadow(
            offset: pressed.value ? const Offset(0, 0) : const Offset(0, -4),
            color: const Color(0xFFF1B826),
            child: Container(
              decoration: BoxDecoration(
                color: !pressed.value ? design.colors.tint1 : design.colors.tint1Dark,
                borderRadius: BorderRadius.circular(60),
              ),
              height: !pressed.value ? 72 : 68,
              padding: !pressed.value ? const EdgeInsets.only(bottom: 2) : null,
              margin: !pressed.value ? null : const EdgeInsets.only(top: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (hasLabel)
                    Padding(
                      padding: icon != null ? const EdgeInsets.only(left: 32.0) : const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(labelText ?? '', style: design.textStyles.headline3),
                    ),
                  if (icon != null)
                    Padding(
                      padding: !hasLabel ? const EdgeInsets.symmetric(horizontal: 20) : const EdgeInsets.only(left: 12, right: 24),
                      child: icon,
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
class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
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
    final bounds = offset & size;

    context.canvas.saveLayer(bounds, Paint());
    context.paintChild(child!, offset);

    final shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);
    context.canvas.saveLayer(bounds, shadowPaint);
    context.paintChild(child!, offset + shadowOffset);

    context.canvas.restore();
    context.canvas.restore();
  }
}
