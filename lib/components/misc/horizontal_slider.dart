import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/svg_icons.dart';
import 'package:bccm_core/design_system.dart';
import 'dart:math' as math;

class HorizontalSlider extends HookWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Clip clipBehaviour;
  final EdgeInsetsGeometry padding;
  final double gap;
  final double height;
  final double? itemWidth;
  final ScrollController? controller;

  const HorizontalSlider({
    super.key,
    this.clipBehaviour = Clip.hardEdge,
    this.padding = EdgeInsets.zero,
    this.gap = 16,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
    this.itemWidth,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final actualController = useMemoized(() {
      return controller ?? scrollController;
    }, [controller]);

    final moreToLeft = useState(false);
    final moreToRight = useState(false);
    final scrollOffset = useState(actualController.hasClients ? actualController.offset : 0);

    final onScrollChanged = useCallback(() {
      if (!actualController.hasClients) return;
      moreToLeft.value = actualController.position.pixels != actualController.position.minScrollExtent;
      moreToRight.value = actualController.position.pixels != actualController.position.maxScrollExtent;
      scrollOffset.value = actualController.offset;
    }, [actualController]);

    useEffect(() {
      final c = actualController;
      c.addListener(onScrollChanged);
      return () => c.removeListener(onScrollChanged);
    }, [actualController, onScrollChanged]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (actualController.hasClients) onScrollChanged();
    });

    double findPageScrollOffset(double maxWidth) {
      final width = (maxWidth - padding.resolve(TextDirection.ltr).left);
      var distanceToScroll = scrollOffset.value + width;
      if (itemWidth != null) {
        final maxVisibleItems = (width / itemWidth!).floor();
        distanceToScroll = -(scrollOffset.value % (itemWidth! + gap)) + (maxVisibleItems * itemWidth!) + (maxVisibleItems * gap);
      }
      return distanceToScroll;
    }

    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints(minHeight: 0, maxHeight: height),
        child: Stack(
          children: [
            ScrollConfiguration(
              behavior: AnyPointerScrollBehavior(),
              child: ListView.builder(
                controller: actualController,
                padding: padding,
                cacheExtent: 0,
                addAutomaticKeepAlives: false,
                clipBehavior: clipBehaviour,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int index) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 0, maxHeight: height),
                    child: Container(margin: EdgeInsets.only(right: index == itemCount - 1 ? 0 : gap), child: itemBuilder(context, index)),
                  );
                },
              ),
            ),
            if (kIsWeb)
              Positioned.fill(
                child: Padding(
                  padding: padding,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 64),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (moreToLeft.value)
                          GestureDetector(
                            onTap: () {
                              final prevPageOffset = scrollOffset.value - findPageScrollOffset(constraints.maxWidth);
                              final distanceToScroll = math.max(prevPageOffset, 0.0);
                              actualController.animateTo(
                                distanceToScroll,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeOutExpo,
                              );
                            },
                            child: const SliderNavButton(SliderNavButtonDirection.previous),
                          ),
                        const Spacer(),
                        if (moreToRight.value)
                          GestureDetector(
                            onTap: () {
                              final nextPageOffset = scrollOffset.value + findPageScrollOffset(constraints.maxWidth);
                              final distanceToScroll = math.min(nextPageOffset, actualController.position.maxScrollExtent);
                              actualController.animateTo(
                                distanceToScroll,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeOutExpo,
                              );
                            },
                            child: const SliderNavButton(SliderNavButtonDirection.next),
                          ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

enum SliderNavButtonDirection { previous, next }

class SliderNavButton extends HookWidget {
  const SliderNavButton(this.direction, {super.key});

  final SliderNavButtonDirection direction;

  static const _directionIcons = <SliderNavButtonDirection, String>{
    SliderNavButtonDirection.previous: SvgIcons.chevronLeft,
    SliderNavButtonDirection.next: SvgIcons.chevronRight,
  };

  @override
  Widget build(BuildContext context) {
    final hovering = useState(false);
    return FocusableActionDetector(
      mouseCursor: WidgetStateMouseCursor.clickable,
      onShowHoverHighlight: (value) => hovering.value = value,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOutExpo,
        opacity: hovering.value ? 1 : 0.5,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: DesignSystem.of(context).colors.separatorOnLight, width: 1),
            color: DesignSystem.of(context).colors.background2,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.string(
            _directionIcons[direction]!,
            height: 24,
            colorFilter: ColorFilter.mode(DesignSystem.of(context).colors.label1, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
