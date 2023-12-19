import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/menus/option_list.dart';
import '../../components/web/dialog_on_web.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/settings.dart';

@RoutePage<void>()
class SubtitleLanguageScreen extends ConsumerStatefulWidget {
  const SubtitleLanguageScreen({super.key});

  @override
  ConsumerState<SubtitleLanguageScreen> createState() => _AppSubtitleLanguageState();
}

class _AppSubtitleLanguageState extends ConsumerState<SubtitleLanguageScreen> {
  late String? selected;
  @override
  void initState() {
    super.initState();
    selected = ref.read(settingsProvider).subtitleLanguages.firstOrNull;
  }

  void _onSelectionChanged(String? id) {
    setState(() {
      selected = id;
    });
    ref.read(settingsProvider.notifier).setSubtitleLanguages([
      if (id != null) id,
    ]);
    ref.read(analyticsProvider).languageChanged(LanguageChangedEvent(
          languageFrom: selected,
          languageTo: id ?? '',
          languageChangeType: 'subtitle',
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DialogOnWeb(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(S.of(context).subtitleLanguage),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: OptionList<String>(
                optionData: languages.entries.map((e) => Option(id: e.key, title: e.value.nativeName, subTitle: e.value.englishName)).toList(),
                currentSelection: selected,
                onSelectionChange: _onSelectionChanged,
                backgroundColor: Colors.transparent,
                showNoneOption: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
