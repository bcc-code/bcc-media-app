import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids/components/buttons/stack_close_button.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:kids/components/settings/addlanguage_list.dart';
import 'package:brunstadtv_app/helpers/languages.dart';

@RoutePage<void>()
class AddLanguageScreen extends ConsumerWidget {
  const AddLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 24.0 : 48.0;
    final List<String> selected = List.from(ref.watch(settingsProvider).audioLanguages);

    List<AddLanguageListItem> buildItems() {
      return appLanuageCodes
          .where((code) => !selected.contains(code)) // 过滤掉已选中的语言代码
          .map((code) => AddLanguageListItem(
                title: languages[code]!.nativeName,
                onPressed: () {
                  selected.add(code);
                  ref.read(settingsProvider.notifier).setAudioLanguages(selected);
                  context.router.pop();
                  // ref.read(settingsProvider.notifier).setAppLanguage(code);
                },
              ))
          .sortedBy((item) => item.title)
          .toList();
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
                                  S.of(context).appLanguage,
                                  style: design.textStyles.title1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text('Select', style: design.textStyles.body2),
                            ),
                            AddLanguageList(
                              items: buildItems(),
                            ),
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
