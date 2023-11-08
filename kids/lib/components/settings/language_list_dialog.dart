import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/languages.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/settings/option_list.dart';
import 'package:kids/components/settings/option_list_dialog.dart';

class LanguageListDialog extends HookConsumerWidget {
  const LanguageListDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> selected = List.from(ref.watch(settingsProvider).audioLanguages);
    final items = appLanuageCodes
        .where((code) => !selected.contains(code)) // 过滤掉已选中的语言代码
        .map((code) => KidsOptionListItem(
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
    return OptionListDialog(title: S.of(context).language, items: items);
  }
}
