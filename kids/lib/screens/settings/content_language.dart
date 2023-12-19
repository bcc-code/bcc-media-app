import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/router/custom_transitions.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/button_base.dart';
import 'package:kids/components/buttons/stack_close_button.dart';
import 'package:kids/components/settings/language_list_dialog.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
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
                                  S.of(context).contentLanguage,
                                  style: bp.smallerThan(TABLET) ? design.textStyles.title1 : design.textStyles.headline2,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: bp.smallerThan(TABLET) ? 12 : 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).preferredLanguages,
                                    style: (bp.smallerThan(TABLET) ? design.textStyles.title2 : design.textStyles.title1),
                                  ),
                                  Text(
                                    S.of(context).contentLanguageExplanation,
                                    style: (bp.smallerThan(TABLET) ? design.textStyles.body2 : design.textStyles.body1).copyWith(
                                      color: design.colors.label2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const ContentLanguageList(),
                            Padding(
                              padding: EdgeInsets.only(top: bp.smallerThan(TABLET) ? 12 : 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: design.buttons.small(
                                        variant: ButtonVariant.secondary,
                                        onPressed: () {
                                          showGeneralDialog(
                                            transitionBuilder: CustomTransitionsBuilders.slideUp(),
                                            transitionDuration: 500.ms,
                                            context: context,
                                            barrierColor: Colors.transparent,
                                            routeSettings: const RouteSettings(name: 'content-language-add'),
                                            pageBuilder: (context, a, b) => const LanguageListDialog(),
                                          );
                                        },
                                        labelText: S.of(context).addLanguage,
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
          const StackCloseButton(),
        ],
      ),
    );
  }
}

class ContentLanguageList extends HookConsumerWidget {
  const ContentLanguageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final selected = List<String>.from(ref.watch(settingsProvider).audioLanguages);
    final dontAnimate = useState(selected);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        color: design.colors.background2,
        child: Stack(
          children: [
            SlidableAutoCloseBehavior(
              child: ReorderableListView(
                shrinkWrap: true,
                buildDefaultDragHandles: false,
                physics: const NeverScrollableScrollPhysics(),
                proxyDecorator: (child, index, animation) {
                  final curvedAnimation = CurvedAnimation(parent: animation, curve: flippedCurveIfReverse(animation, Curves.easeOutExpo));
                  return LayoutBuilder(
                    builder: (context, constraints) => AnimatedBuilder(
                      animation: curvedAnimation,
                      builder: (context, _) => OverflowBox(
                        minHeight: 53 + 2 * curvedAnimation.value,
                        maxHeight: 53 + 2 * curvedAnimation.value,
                        minWidth: constraints.maxWidth,
                        maxWidth: constraints.maxWidth,
                        alignment: Alignment.bottomCenter,
                        child: ButtonBase(
                          height: 53,
                          transition: curvedAnimation.value,
                          elevationHeight: 4,
                          onPressed: () {},
                          color: ColorTween(begin: design.colors.background2, end: design.colors.background1).animate(curvedAnimation).value!,
                          activeColor: design.colors.background1,
                          shadowColor: design.colors.label1.withOpacity(0.1),
                          sideColor: const Color(0xFFE9ECF4),
                          borderRadius: BorderRadius.circular(24),
                          builder: (context, pressed) => ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: child,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                children: <Widget>[
                  for (int index = 0; index < selected.length; index++)
                    _CustomReorderableItem(
                      key: Key(selected[index]),
                      index: index,
                      animate: !dontAnimate.value.contains(selected[index]),
                      title: languages[selected[index]]!.nativeName,
                      enableDrag: selected.length > 1,
                      onDelete: () {
                        selected.removeAt(index);
                        ref.read(settingsProvider.notifier).setAudioLanguages(selected);
                        dontAnimate.value = [];
                      },
                    ),
                ],
                onReorderStart: (index) {
                  CustomHapticFeedback.heavyImpact();
                },
                onReorderEnd: (index) {
                  CustomHapticFeedback.heavyImpact();
                },
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final String item = selected.removeAt(oldIndex);
                  selected.insert(newIndex, item);
                  ref.read(settingsProvider.notifier).setAudioLanguages(selected);
                },
              ),
            ),
            for (int index = 1; index < selected.length; index++)
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
  final bool animate;
  final bool enableDrag;

  const _CustomReorderableItem({
    required Key key,
    required this.index,
    required this.title,
    required this.onDelete,
    required this.animate,
    this.enableDrag = true,
  }) : super(key: key);

  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final small = bp.smallerThan(TABLET);

    return Animate(
      autoPlay: animate,
      effects: [
        SlideEffect(
          duration: 500.ms,
          curve: Curves.easeOutExpo,
          begin: SlideEffect.neutralValue.copyWith(dx: -1),
          end: SlideEffect.neutralValue.copyWith(dx: 0),
        )
      ],
      onInit: (c) {
        if (!animate) {
          c.value = 1.0;
        }
      },
      child: ConstrainedBox(
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
                    },
                    backgroundColor: design.colors.tint1,
                    foregroundColor: design.colors.label1,
                    child: Text(
                      S.of(context).remove,
                      style: design.textStyles.title2,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              child: ReorderableDelayedDragStartListener(
                enabled: enableDrag,
                index: index,
                child: Container(
                  height: 52,
                  padding: small
                      ? const EdgeInsets.symmetric(horizontal: 20, vertical: 16)
                      : const EdgeInsets.only(left: 24, top: 8, right: 24, bottom: 8),
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
                        enabled: enableDrag,
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
            ),
          ],
        ),
      ),
    );
  }
}
