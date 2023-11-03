// import 'dart:ui';

// import 'package:brunstadtv_app/theme/design_system/design_system.dart';
// import 'package:collection/collection.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kids/helpers/svg_icons.dart';
// import 'package:responsive_framework/responsive_breakpoints.dart';

// class ContentLanguageList extends StatefulWidget {
//   final List<ContentLanguageListItem> items;
//   final Color? backgroundColor;

//   const ContentLanguageList({Key? key, required this.items, this.backgroundColor}) : super(key: key);

//   @override
//   _ContentLanguageListState createState() => _ContentLanguageListState();
// }

// class _ContentLanguageListState extends State<ContentLanguageList> {
//   @override
//   Widget build(BuildContext context) {
//     final design = DesignSystem.of(context);
//     final bp = ResponsiveBreakpoints.of(context);

//     return ClipRRect(
//       borderRadius: BorderRadius.circular(24),
//       child: ReorderableListView(
//         children: widget.items.map((option) {
//           return _ItemRenderer(
//             key: ValueKey(option),
//             item: option,
//             index: idx,
//             defaultBackgroundColor: widget.backgroundColor ?? DesignSystem.of(context).colors.background2,
//           );
//         }).toList(),
//         onReorder: (oldIndex, newIndex) {
//           setState(() {
//             if (oldIndex < newIndex) {
//               newIndex -= 1;
//             }
//             final item = widget.items.removeAt(oldIndex);
//             widget.items.insert(newIndex, item);
//           });
//         },
//       ),
//     );
//   }
// }

// class _ItemRenderer extends HookWidget {
//   const _ItemRenderer({
//     required Key? key,
//     required this.item,
//     required this.defaultBackgroundColor,
//     required this.index,
//   }) : super(key: key);

//   final ContentLanguageListItem item;
//   final Color defaultBackgroundColor;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     final hovering = useState(false);
//     final animationController = useAnimationController(duration: const Duration(milliseconds: 300), initialValue: 1);
//     final opacityReduction = useAnimation(
//       CurvedAnimation(parent: animationController, curve: Curves.easeIn, reverseCurve: Curves.easeIn).drive(Tween(begin: 0.3, end: 0.0)),
//     );
//     final design = DesignSystem.of(context);
//     final bp = ResponsiveBreakpoints.of(context);
//     final small = bp.smallerThan(TABLET);

//     return Stack(
//       children: [
//         IgnorePointer(
//           ignoring: item.disabled,
//           child: FocusableActionDetector(
//             mouseCursor: MaterialStateMouseCursor.clickable,
//             onShowHoverHighlight: (value) => hovering.value = value,
//             child: GestureDetector(
//               behavior: HitTestBehavior.opaque,
//               onTapDown: (e) {
//                 animationController.value = 0;
//               },
//               onTapUp: (e) {
//                 item.onPressed();
//                 animationController.forward();
//               },
//               onTapCancel: () {
//                 animationController.value = 1;
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: item.disabled
//                       ? defaultBackgroundColor
//                       : defaultBackgroundColor.withOpacity(clampDouble(defaultBackgroundColor.opacity - opacityReduction, 0, 1)),
//                 ),
//                 child: Container(
//                   padding: small ? const EdgeInsets.symmetric(horizontal: 20, vertical: 16) : const EdgeInsets.only(left:24,top: 8,right: 24,bottom: 8),
//                   constraints: const BoxConstraints(minHeight: 56),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               item.title,
//                               style: small ? design.textStyles.body2.copyWith(color: design.colors.label1) : design.textStyles.body1.copyWith(color: design.colors.label1),
//                             ),
//                           ],
//                         ),
//                       ),
//                       if (item.rightText != null)
//                         Text(
//                           item.rightText!,
//                           style: (small ? design.textStyles.body2 : design.textStyles.body1).copyWith(color: design.colors.label1),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         if (!item.disabled) // Don't allow drag if the item is disabled
//           Positioned(
//             right: 8, // Some padding from the right
//             top: 0,
//             bottom: 0,
//             child: Center(
//               child: ReorderableDragStartListener(
//                 index: index,
//                 child: SvgPicture.string(
//                   SvgIcons.holding,
//                   width: 18,
//                   height: 10,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

// class ContentLanguageListItem {
//   final String title;
//   final VoidCallback onPressed;
//   final String? rightText;
//   bool disabled;

//   ContentLanguageListItem({
//     required this.title,
//     required this.onPressed,
//     this.disabled = false,
//     this.rightText,
//   });
// }
import 'dart:ui';

import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class ContentLanguageList extends StatelessWidget {
  final List<ContentLanguageListItem> items;
  final Color? backgroundColor;

  const ContentLanguageList({super.key, required this.items, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Column(
        children: [
          ...items.mapIndexed(
            (index, option) => Column(
              children: [
                if (index > 0)
                  Container(
                    padding: bp.smallerThan(TABLET)
                        ? const EdgeInsets.symmetric(horizontal: 20)
                        : const EdgeInsets.symmetric(horizontal: 24),
                    color: design.colors.background2,
                    child: Container(width: double.infinity, height: 1, color: design.colors.separatorOnLight),
                  ),
                _ItemRenderer(
                  item: option,
                  defaultBackgroundColor: backgroundColor ?? DesignSystem.of(context).colors.background2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemRenderer extends HookWidget {
  const _ItemRenderer({
    required this.item,
    required this.defaultBackgroundColor,
  });

  final ContentLanguageListItem item;
  final Color defaultBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final hovering = useState(false);
    final animationController = useAnimationController(duration: const Duration(milliseconds: 300), initialValue: 1);
    final opacityReduction = useAnimation(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn, reverseCurve: Curves.easeIn).drive(Tween(begin: 0.3, end: 0.0)),
    );
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final small = bp.smallerThan(TABLET);
    return Stack(
      children: [
        IgnorePointer(
          ignoring: item.disabled,
          child: FocusableActionDetector(
            mouseCursor: MaterialStateMouseCursor.clickable,
            onShowHoverHighlight: (value) => hovering.value = value,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: (e) {
                animationController.value = 0;
              },
              onTapUp: (e) {
                item.onPressed();
                animationController.forward();
              },
              onTapCancel: () {
                animationController.value = 1;
              },
              child: Container(
                decoration: BoxDecoration(
                  color: item.disabled
                      ? defaultBackgroundColor
                      : defaultBackgroundColor.withOpacity(clampDouble(defaultBackgroundColor.opacity - opacityReduction, 0, 1)),
                ),
                child: Container(
                  padding: small ? const EdgeInsets.symmetric(horizontal: 20, vertical: 16) : const EdgeInsets.only(left:24,top: 8,right: 24,bottom: 8),
                  constraints: const BoxConstraints(minHeight: 56),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.title,
                              style: small ? design.textStyles.body2.copyWith(color: design.colors.label1) : design.textStyles.body1.copyWith(color: design.colors.label1),
                            ),
                          ],
                        ),
                      ),
                      if (item.rightText != null)
                        Text(
                          item.rightText!,
                          style: (small ? design.textStyles.body2 : design.textStyles.body1).copyWith(color: design.colors.label1),
                        ),
                      if (item.selected)
                        SvgPicture.string(SvgIcons.checked,width:24,height: 24,)

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ContentLanguageListItem {
  final String title;
  final VoidCallback onPressed;
  final String? rightText;
  bool disabled;
  bool selected;

  ContentLanguageListItem({
    required this.title,
    required this.onPressed,
    this.disabled = false,
    this.rightText,
    this.selected = false,
  });
}
