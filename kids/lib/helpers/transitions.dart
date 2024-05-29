import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

var currentMorphKey = GlobalKey();

class MorphTransitionInfo {
  final Duration duration;
  final bool active;
  MorphTransitionInfo({required this.duration, required this.active});
}

typedef MorphTransitionHostBuilder = Widget Function(BuildContext context);

class MorphTransitionHost extends StatelessWidget {
  const MorphTransitionHost({
    super.key,
    required this.builder,
    this.borderRadius = BorderRadius.zero,
  });

  final MorphTransitionHostBuilder builder;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
    );
  }
}

class MorphTransition extends HookWidget {
  const MorphTransition({
    super.key,
    required this.primary,
    required this.secondary,
    required this.fallbackTransitionBuilder,
    required this.child,
    required this.duration,
  });

  final Animation<double> primary;
  final Animation<double> secondary;
  final RouteTransitionsBuilder fallbackTransitionBuilder;
  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    useListenable(primary);
    // get rect of currentMorphKey
    final c = currentMorphKey.currentContext;
    if (c?.mounted != true) {
      return fallbackTransitionBuilder(context, primary, secondary, child);
    }
    RenderBox? box;
    try {
      box = c?.findRenderObject()?.asOrNull<RenderBox>();
    } catch (e) {
      return fallbackTransitionBuilder(context, primary, secondary, child);
    }
    final morphHost = c!.widget.asOrNull<MorphTransitionHost>();
    if (box == null || !box.hasSize) {
      return fallbackTransitionBuilder(context, primary, secondary, child);
    }
    final offsetA = box.localToGlobal(Offset.zero);
    final sizeA = box.size;

    return LayoutBuilder(
      builder: (context, constraints) => AnimatedBuilder(
        animation: primary,
        child: child,
        builder: (context, child) {
          final active = primary.status == AnimationStatus.forward || primary.status == AnimationStatus.reverse;
          final curvedAnimation = CurvedAnimation(
            parent: primary,
            curve: primary.status == AnimationStatus.forward ? Curves.ease : Curves.easeInExpo,
          );
          final offsetTween = Tween<Offset>(begin: offsetA, end: Offset.zero);
          final sizeTween = Tween<Size>(begin: sizeA, end: constraints.biggest);
          final offset = offsetTween.evaluate(curvedAnimation);
          final size = sizeTween.evaluate(curvedAnimation);
          final borderRadius = Tween<BorderRadius>(
            begin: morphHost?.borderRadius ?? BorderRadius.zero,
            end: BorderRadius.zero,
          ).evaluate(curvedAnimation);

          return AbsorbPointer(
            absorbing: active,
            child: Align(
              alignment: Alignment.topLeft,
              child: Transform.translate(
                offset: offset,
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Stack(
                      children: [
                        Positioned.fill(child: Container(color: Colors.white)),
                        if (morphHost?.builder != null)
                          Positioned.fill(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tight(sizeA),
                                child: morphHost!.builder(context),
                              ),
                            ),
                          ),
                        Align(
                          alignment: Alignment.center,
                          child: OverflowBox(
                            maxHeight: constraints.biggest.height,
                            minHeight: constraints.biggest.height,
                            maxWidth: constraints.biggest.width,
                            minWidth: constraints.biggest.width,
                            child: Opacity(
                              opacity: curvedAnimation.value,
                              child: InheritedData(
                                inheritedData: MorphTransitionInfo(
                                  duration: duration,
                                  active: active,
                                ),
                                builder: (context) => child!,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
