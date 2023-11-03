import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:kids/components/settings/applanguage_list.dart';
import 'package:kids/components/settings/contentlanguage_list.dart';
import 'package:brunstadtv_app/helpers/languages.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

@RoutePage<void>()
class ContentLanguageScreen extends HookConsumerWidget {
  const ContentLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 24.0 : 48.0;
    final selectedLanguageIndex = useState(0);

    void doNothing(BuildContext context) {
      // Intentionally left blank.
    }

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverSafeArea(
                bottom: true,
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: basePadding, top: basePadding, right: basePadding, bottom: basePadding),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 544),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: basePadding,
                                  top: bp.smallerThan(TABLET) ? 12 : 16,
                                  right: basePadding,
                                  bottom: (bp.smallerThan(TABLET) ? 12 : 16) + 24),
                              child: Center(
                                child: Text(
                                  'App Language',
                                  style: design.textStyles.title1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text('Select', style: design.textStyles.body2),
                            ),
                            const ReorderableExample(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: 0,
              left: 0,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(basePadding),
                  child: design.buttons.responsive(
                    labelText: '',
                    onPressed: () => context.router.pop(),
                    image: SvgPicture.string(SvgIcons.close),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({super.key});

  @override
  State<ReorderableExample> createState() => _ReorderableListViewExampleState();
}

class _ReorderableListViewExampleState extends State<ReorderableExample> {
  final List<int> _items = List<int>.generate(50, (int index) => index);
  final List<String> _languageCodes = appLanuageCodes;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);

    void doNothing(BuildContext context) {
      // Intentionally left blank.
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
          color: design.colors.background2,
          child: Stack(
            children: [
              ReorderableListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  for (int index = 0; index < _languageCodes.length; index++)
                    _CustomReorderableItem(
                      key: Key(_languageCodes[index]),
                      index: index,
                      title: languages[_languageCodes[index]]!.nativeName,
                      onDelete: () {
                        setState(() {
                          _languageCodes.removeAt(index);
                        });
                      },
                    ),
                  // )
                ],
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final String item = _languageCodes.removeAt(oldIndex);
                    _languageCodes.insert(newIndex, item);
                  });
                },
              ),
              for (int index = 0; index < _languageCodes.length; index++)
                if (index > 0)
                  Positioned(
                    top: 57 * index.toDouble() - 1,
                    left: 20,
                    right: 20,
                    child: SizedBox(
                      height: 1,
                      child: Container(color: design.colors.separatorOnLight),
                    ),
                  ),
            ],
          )),
    );
  }
}

class _CustomReorderableItem extends StatelessWidget {
  final int index;
  final String title;
  final Function onDelete;

  _CustomReorderableItem({
    required Key key,
    required this.index,
    required this.title,
    required this.onDelete,
  }) : super(key: key);

  void doNothing(BuildContext context) {
    // Intentionally left blank.
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final small = bp.smallerThan(TABLET);

    return Container(
      decoration: BoxDecoration(
        color: design.colors.background2,
      ),
      constraints: index == 0 ? const BoxConstraints(minHeight: 56) : const BoxConstraints(minHeight: 57),
      child: Column(
        children: [
          index == 0
              ? SizedBox(
                  height: 0,
                )
              : SizedBox(
                  height: 1,
                ),
          Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    onDelete();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title removed')));
                  },
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.white,
                  label: 'Remove',
                ),
              ],
            ),
            child: Container(
              height: 56,
              padding:
                  small ? const EdgeInsets.symmetric(horizontal: 20, vertical: 16) : const EdgeInsets.only(left: 24, top: 8, right: 24, bottom: 8),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: small
                              ? design.textStyles.body2.copyWith(color: design.colors.label1)
                              : design.textStyles.body1.copyWith(color: design.colors.label1),
                        ),
                      ),
                      ReorderableDragStartListener(
                        index: index,
                        child: SvgPicture.string(
                          SvgIcons.holding,
                          width: 18,
                          height: 10,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
