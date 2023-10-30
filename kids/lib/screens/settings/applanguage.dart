import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/stack_close_button.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:kids/components/settings/applanguage_list.dart';
import 'package:brunstadtv_app/helpers/languages.dart';

@RoutePage<void>()
class AppLanguageScreen extends HookConsumerWidget {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 24.0 : 48.0;
    final selectedLanguageIndex = useState(0);

    List<AppLanguageListItem> buildItems() {
      return appLanuageCodes
          .map((code) {
            int index = appLanuageCodes.indexOf(code);
            return AppLanguageListItem(
              title: languages[code]!.nativeName,
              onPressed: () {
                selectedLanguageIndex.value = index;
                ref.read(settingsProvider.notifier).setAppLanguage(code);
              },
              selected: (index == selectedLanguageIndex.value),
            );
          })
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
                                  S.of(context).appLanguage,
                                  style: design.textStyles.title1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text('Select', style: design.textStyles.body2),
                            ),
                            AppLanguageList(
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
