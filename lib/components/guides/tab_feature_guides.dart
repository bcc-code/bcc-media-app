import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuideController {
  late VoidCallback dismiss;
}

GuideController createTabFeaturePopover(
  BuildContext context, {
  required GlobalKey iconKey,
  required String title,
  required String description,
  required String analyticsName,
  VoidCallback? onSkip,
  VoidCallback? onContinue,
}) {
  final rb = iconKey.currentContext?.findRenderObject().asOrNull<RenderBox>();
  if (rb == null) {
    throw Exception('The widget referenced by `iconKey` is not mounted. iconKey: $iconKey');
  }
  final size = rb.size;

  final position = rb.localToGlobal(Offset.zero);
  final positionFromBottom = MediaQuery.sizeOf(context).height - position.dy + 12;
  final positionFromRight = MediaQuery.sizeOf(context).width - position.dx - size.width;
  final width = (positionFromRight - 16) * 2;

  final controller = GuideController();
  late OverlayEntry entry;
  entry = OverlayEntry(
      opaque: false,
      builder: (context) {
        return FeatureGuideOverlay(
          controller: controller,
          position: Offset(position.dx + size.width / 2 - width / 2, positionFromBottom),
          size: size,
          width: width,
          entry: entry,
          title: title,
          description: description,
          analyticsName: analyticsName,
        );
      });

  Overlay.of(context, rootOverlay: true).insert(entry);
  return controller;
}

class FeatureGuideOverlay extends HookWidget {
  const FeatureGuideOverlay({
    super.key,
    required this.controller,
    required this.position,
    required this.size,
    required this.width,
    required this.entry,
    required this.title,
    required this.description,
    required this.analyticsName,
    this.onSkip,
  });

  final GuideController controller;
  final Offset position;
  final Size size;
  final double width;
  final OverlayEntry entry;
  final String title;
  final String description;
  final String analyticsName;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    final exitAnim = useAnimationController();
    final design = DesignSystem.of(context);

    void dismiss() {
      debugPrint('GUIDE: dismiss');
      onSkip?.call();
      if (!context.mounted) return;
      ProviderScope.containerOf(context, listen: false).read(analyticsProvider).interaction(
            InteractionEvent(
              interaction: 'guide-skip',
              contextElementType: 'guide',
              contextElementId: analyticsName,
            ),
          );
      exitAnim.forward(from: 0);
      exitAnim.addStatusListener((status) {
        debugPrint(status.toString());
        if (status == AnimationStatus.completed) {
          entry.remove();
        }
      });
    }

    controller.dismiss = dismiss;

    return Positioned(
      bottom: position.dy,
      left: position.dx,
      child: Animate(
        controller: exitAnim,
        autoPlay: false,
        effects: [
          FadeEffect(
            begin: 1,
            end: 0,
            duration: 1000.ms,
            curve: Curves.easeOutExpo,
          ),
          SlideEffect(
            begin: const Offset(0, 0),
            end: const Offset(0, -0.1),
            duration: 1000.ms,
            curve: Curves.easeOutExpo,
          ),
        ],
        child: Animate(
          effects: [
            FadeEffect(
              delay: 0.ms,
              begin: 0,
              duration: 300.ms,
              curve: Curves.easeOut,
            ),
            SlideEffect(
              delay: 0.ms,
              begin: const Offset(0, -0.2),
              duration: 4000.ms,
              curve: Curves.easeOutExpo,
            ),
          ],
          child: GestureDetector(
            onTap: () {
              debugPrint('GUIDE: onTap');
              onSkip?.call();
              if (!context.mounted) return;
              ProviderScope.containerOf(context, listen: false).read(analyticsProvider).interaction(
                    InteractionEvent(
                      interaction: 'guide-skip',
                      contextElementType: 'guide',
                      contextElementId: analyticsName,
                    ),
                  );
              exitAnim.forward();
              exitAnim.addStatusListener((status) {
                if (status == AnimationStatus.dismissed) {
                  entry.remove();
                }
              });
            },
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: design.colors.tint1,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: design.colors.background1.withOpacity(0.7),
                          blurRadius: 10,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    width: width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          title,
                          style: design.textStyles.title2,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          description,
                          style: design.textStyles.body2.copyWith(color: design.colors.label1),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  // Triangle in the middle bottom like a speech bubble
                  Animate(
                    delay: 100.ms,
                    effects: [
                      SlideEffect(
                        begin: const Offset(0, -0.2),
                        duration: 500.ms,
                        curve: Curves.easeOutExpo,
                      ),
                    ],
                    child: Container(
                      width: 20,
                      height: 10,
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: design.colors.background1.withOpacity(0.7),
                            blurRadius: 10,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: CustomPaint(
                        size: const Size(20, 10),
                        painter: TrianglePainter(
                          strokeColor: design.colors.tint1,
                          strokeWidth: 1,
                          paintingStyle: PaintingStyle.fill,
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
  }
}

class TrianglePainter extends CustomPainter {
  TrianglePainter({
    required this.strokeColor,
    required this.strokeWidth,
    required this.paintingStyle,
  });

  final Color strokeColor;
  final double strokeWidth;
  final PaintingStyle paintingStyle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    final path = Path();
    path.moveTo(0, -1);
    path.lineTo(size.width, -1);
    path.lineTo(size.width / 2, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor || oldDelegate.strokeWidth != strokeWidth || oldDelegate.paintingStyle != paintingStyle;
  }
}
