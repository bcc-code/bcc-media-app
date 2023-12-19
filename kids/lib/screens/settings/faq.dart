import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/providers/graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/appbar_close_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:brunstadtv_app/components/tabs/custom_tab_bar.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:brunstadtv_app/components/web/dialog_on_web.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';

@RoutePage<void>()
class FAQScreen extends HookConsumerWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesFuture = useState(useMemoized(() => ref.read(bccmGraphQLProvider).query$FAQ()));
    final categoriesSnapshot = useFuture(categoriesFuture.value);

    void refresh() => categoriesFuture.value = ref.read(bccmGraphQLProvider).query$FAQ();

    Widget? child;
    if (categoriesSnapshot.connectionState == ConnectionState.waiting) {
      child = const LoadingGeneric();
    } else if (!categoriesSnapshot.hasData || categoriesSnapshot.data?.parsedData == null) {
      child = ErrorGeneric(onRetry: refresh);
    } else {
      final categoryItems = categoriesSnapshot.data?.parsedData?.faq.categories?.items;
      if (categoryItems != null) {
        child = CustomTabBar(
          padding: const EdgeInsets.all(16),
          tabs: categoryItems.map((categoryItem) => categoryItem.title).toList(),
          children: categoryItems
              .map(
                (categoryItem) => categoryItem.questions != null
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: categoryItem.questions!.items
                                .map(
                                  (question) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: _ExpansionTileDropDown(question),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              )
              .toList(),
        );
      }
    }

    return DialogOnWeb(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 84,
          leading: const AppBarCloseButton(),
          title: Text(S.of(context).faq),
        ),
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _ExpansionTileDropDown extends StatefulWidget {
  final Fragment$Question questionItem;

  const _ExpansionTileDropDown(this.questionItem);

  @override
  State<_ExpansionTileDropDown> createState() => _ExpansionTileDropDownState();
}

class _ExpansionTileDropDownState extends State<_ExpansionTileDropDown> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: ListTileTheme(
        minVerticalPadding: 0.0,
        dense: true,
        contentPadding: const EdgeInsets.all(0),
        child: ExpansionTile(
          clipBehavior: Clip.antiAlias,
          tilePadding: const EdgeInsets.only(left: 16, top: 18, right: 12, bottom: 18),
          childrenPadding: const EdgeInsets.all(16).copyWith(top: 12),
          title: Text(
            widget.questionItem.question,
            style: design.textStyles.body2.copyWith(color: design.colors.label1),
          ),
          trailing: !expanded
              ? Icon(
                  Icons.keyboard_arrow_down,
                  color: design.colors.tint1,
                )
              : Icon(
                  Icons.keyboard_arrow_up,
                  color: design.colors.tint2,
                ),
          expandedAlignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: design.colors.background2,
          collapsedBackgroundColor: design.colors.background2,
          children: [
            MarkdownBody(
              data: widget.questionItem.answer,
              onTapLink: (text, href, title) {
                if (href != null) {
                  launchUrlString(href, mode: LaunchMode.externalApplication);
                }
              },
            ),
          ],
          onExpansionChanged: (state) {
            setState(() => expanded = state);
          },
        ),
      ),
    );
  }
}
