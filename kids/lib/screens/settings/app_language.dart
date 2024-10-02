import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:bccm_core/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids/components/buttons/stack_close_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:kids/components/settings/option_list.dart';

@RoutePage()
class AppLanguageScreen extends ConsumerWidget {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 24.0 : 48.0;
    final selected = ref.watch(settingsProvider).appLanguage.languageCode;

    List<KidsOptionListItem> buildItems() {
      return appLanuageCodes
          .map((code) {
            return KidsOptionListItem(
              title: languages[code]!.nativeName,
              onPressed: () {
                ref.read(settingsProvider.notifier).setAppLanguage(code);
              },
              selected: (code == selected),
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
                              child: Text(S.of(context).select, style: design.textStyles.body2),
                            ),
                            KidsOptionList(
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
