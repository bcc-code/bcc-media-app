import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/menus/option_list.dart';
import '../../components/web/dialog_on_web.dart';
import '../../l10n/app_localizations.dart';

@RoutePage()
class AppLanguageScreen extends ConsumerWidget {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DialogOnWeb(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(S.of(context).appLanguage),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: OptionList<String>(
                optionData: appLanuageCodes.map((l) => Option(id: l, title: languages[l]!.nativeName, subTitle: languages[l]!.englishName)).toList(),
                currentSelection: ref.watch(settingsProvider).appLanguage.languageCode,
                onSelectionChange: (code) {
                  if (code == null) return;
                  ref.read(settingsProvider.notifier).setAppLanguage(code);
                },
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
