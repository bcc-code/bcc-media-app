import 'package:brunstadtv_app/graphql/client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/custom_back_button.dart';
import '../../components/custom_tab_bar/custom_tab_bar.dart';
import '../../components/status_indicators/error_generic.dart';
import '../../components/status_indicators/loading_generic.dart';
import '../../components/web/dialog_on_web.dart';
import '../../theme/design_system/design_system.dart';
import '../../graphql/queries/faq.graphql.dart';
import '../../l10n/app_localizations.dart';

class FAQScreen extends HookConsumerWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesFuture = useState(useMemoized(() => ref.read(gqlClientProvider).query$FAQ()));
    final categoriesSnapshot = useFuture(categoriesFuture.value);

    void refresh() => categoriesFuture.value = ref.read(gqlClientProvider).query$FAQ();

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
                            children: categoryItem.questions!.items.map((question) => _ExpansionTileDropDown(question)).toList(),
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
          elevation: 0,
          leading: const CustomBackButton(),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: design.colors.background2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ListTileTheme(
          minVerticalPadding: 0.0,
          dense: true,
          contentPadding: const EdgeInsets.all(0),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.only(left: 16, top: 18, right: 12, bottom: 18),
            childrenPadding: const EdgeInsets.all(16).copyWith(top: 12),
            title: Text(
              widget.questionItem.question,
              style: design.textStyles.title3,
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
            children: <Widget>[
              Text(
                widget.questionItem.answer,
                style: design.textStyles.body2.copyWith(color: design.colors.label3),
              )
            ],
            onExpansionChanged: (state) {
              setState(() => expanded = state);
            },
          ),
        ),
      ),
    );
  }
}
