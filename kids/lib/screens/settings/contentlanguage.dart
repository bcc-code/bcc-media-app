import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:brunstadtv_app/helpers/languages.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kids/router/router.gr.dart';

@RoutePage<void>()
class ContentLanguageScreen extends HookConsumerWidget {
  const ContentLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 24.0 : 48.0;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverSafeArea(
                bottom: true,
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: basePadding, right: 20, bottom: basePadding),
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
                                  'Content Language',
                                  style: design.textStyles.title1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Preferred languages', style: design.textStyles.title2),
                                  Text('Reorder the languages to match your preference for audio & subtitle language',
                                      style: design.textStyles.body2),
                                ],
                              ),
                            ),
                            const ContentLanguageList(),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: design.buttons.responsive(
                                        variant: ButtonVariant.secondary,
                                        onPressed: () {
                                          context.router.push(const AddLanguageScreenRoute());
                                        },
                                        labelText: 'Add language',
                                        image: SvgPicture.string(SvgIcons.add)),
                                  ),
                                ],
                              ),
                            )
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

class ContentLanguageList extends ConsumerStatefulWidget {
  const ContentLanguageList({super.key});

  @override
  ConsumerState<ContentLanguageList> createState() => _ContentLanguageListState();
}

class _ContentLanguageListState extends ConsumerState<ContentLanguageList> {
  // final List<String> _languageCodes = appLanuageCodes;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final List<String> selected = List.from(ref.watch(settingsProvider).audioLanguages);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        color: design.colors.background2,
        child: Stack(
          children: [
            SlidableAutoCloseBehavior(
              child: ReorderableListView(
                shrinkWrap: true,
                buildDefaultDragHandles: selected.length != 1,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  for (int index = 0; index < selected.length; index++)
                    _CustomReorderableItem(
                      key: Key(selected[index]),
                      index: index,
                      title: languages[selected[index]]!.nativeName,
                      onDelete: () {
                        setState(() {
                          selected.removeAt(index);
                          ref.read(settingsProvider.notifier).setAudioLanguages(selected);
                        });
                      },
                    ),
                ],
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final String item = selected.removeAt(oldIndex);
                    selected.insert(newIndex, item);
                    ref.read(settingsProvider.notifier).setAudioLanguages(selected);
                  });
                },
              ),
            ),
            for (int index = 0; index < selected.length; index++)
              if (index > 0)
                Positioned(
                  top: 53 * index.toDouble() - 1,
                  left: 20,
                  right: 20,
                  child: SizedBox(
                    height: 1,
                    child: Container(color: design.colors.separatorOnLight),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class _CustomReorderableItem extends StatelessWidget {
  final int index;
  final String title;
  final Function onDelete;

  const _CustomReorderableItem({
    required Key key,
    required this.index,
    required this.title,
    required this.onDelete,
  }) : super(key: key);

  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final small = bp.smallerThan(TABLET);

    return Container(
      decoration: BoxDecoration(
        color: design.colors.background2,
      ),
      constraints: index == 0 ? const BoxConstraints(minHeight: 52) : const BoxConstraints(minHeight: 53),
      child: Column(
        children: [
          index == 0
              ? const SizedBox(
                  height: 0,
                )
              : const SizedBox(
                  height: 1,
                ),
          Slidable(
            key: ValueKey(title),
            endActionPane: ActionPane(
              dismissible: DismissiblePane(
                onDismissed: () {
                  onDelete();
                },
                resizeDuration: Duration.zero,
              ),
              extentRatio: bp.smallerThan(TABLET) ? 99 / (MediaQuery.of(context).size.width - 40) : 99 / 544,
              motion: const ScrollMotion(),
              children: [
                CustomSlidableAction(
                  padding: const EdgeInsets.all(0),
                  onPressed: (context) {
                    onDelete();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title removed')));
                  },
                  backgroundColor: design.colors.tint1,
                  foregroundColor: design.colors.label1,
                  child: Text(
                    'Remove',
                    style: design.textStyles.title2,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
            child: Container(
              height: 52,
              padding:
                  small ? const EdgeInsets.symmetric(horizontal: 20, vertical: 16) : const EdgeInsets.only(left: 24, top: 8, right: 24, bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 28,
                      child: Text(
                        (index + 1).toString(),
                        style: design.textStyles.body2.copyWith(color: design.colors.label1),
                      )),
                  Expanded(
                    child: Text(
                      title,
                      style: design.textStyles.body2.copyWith(color: design.colors.label1),
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
              ),
            ),
          ),
        ],
      ),
    ).animate().slideX(begin: -1, curve: Curves.easeOutExpo, duration: 500.ms);
  }
}
