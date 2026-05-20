import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/nav/custom_back_button.dart';
import '../../components/menus/option_list.dart';
import '../../components/web/dialog_on_web.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/settings.dart';

@RoutePage()
class AudioLanguageScreen extends ConsumerWidget {
  const AudioLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DialogOnWeb(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 44,
          leadingWidth: 92,
          leading: const CustomBackButton(),
          title: Text(S.of(context).audioLanguage),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: OptionList<String>(
                optionData: appLanuageCodes.map((l) => Option(id: l, title: languages[l]!.nativeName, subTitle: languages[l]!.englishName)).toList(),
                currentSelection: ref.watch(settingsProvider).audioLanguages.firstOrNull,
                backgroundColor: Colors.transparent,
                onSelectionChange: (code) {
                  if (code == null) return;
                  ref.read(settingsProvider.notifier).setAudioLanguages([code]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
