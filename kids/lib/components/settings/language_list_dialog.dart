import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
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
    final List<String> selected = ref.watch(settingsProvider).audioLanguages;
    return OptionListDialog(
      title: S.of(context).language,
      items: appLanuageCodes
          .where((code) => !selected.contains(code))
          .map((code) => KidsOptionListItem(
                title: languages[code]!.nativeName,
                onPressed: () {
                  ref.read(settingsProvider.notifier).setAudioLanguages([...selected, code]);
                  context.router.pop();
                },
              ))
          .sortedBy((item) => item.title)
          .toList(),
    );
  }
}
