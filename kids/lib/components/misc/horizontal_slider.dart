import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_framework/responsive_framework.dart';

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

    final bp = ResponsiveBreakpoints.of(context);
    final safePadding = MediaQuery.of(context).padding;
    final double basePadding = bp.smallerThan(TABLET) ? 20 : 48;

    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints(minHeight: 0, maxHeight: height),
        child: ScrollConfiguration(
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
                child: Container(
                  margin: EdgeInsets.only(right: index == itemCount - 1 ? 0 : gap),
                  padding: EdgeInsets.only(
                    left: index == 0 ? safePadding.left + basePadding : 0,
                    right: index == itemCount - 1 ? safePadding.right + basePadding : 0,
                  ),
                  child: itemBuilder(context, index),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
