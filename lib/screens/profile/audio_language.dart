import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/option_list.dart';
import '../../helpers/languages.dart';
import '../../l10n/app_localizations.dart';
import '../../models/analytics/language_changed.dart';
import '../../providers/analytics.dart';
import '../../providers/settings.dart';

class AppAudioLanguage extends ConsumerStatefulWidget {
  const AppAudioLanguage({super.key});

  @override
  ConsumerState<AppAudioLanguage> createState() => _AppAudioLanguageState();
}

class _AppAudioLanguageState extends ConsumerState<AppAudioLanguage> {
  late String? selected;

  void _onSelectionChanged(String id) {
    ref.read(analyticsProvider).languageChanged(LanguageChangedEvent(
          languageFrom: selected,
          languageTo: id,
          languageChangeType: 'audio',
        ));
    setState(() {
      selected = id;
    });
    ref.read(settingsProvider.notifier).setAudioLanguage(id);
  }

  @override
  void initState() {
    super.initState();
    selected = ref.read(settingsProvider).audioLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(S.of(context).audioLanguage),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: OptionList(
            optionData: languages.map((l) => Option(id: l.code, title: l.nativeName, subTitle: l.englishName)).toList(),
            currentSelection: selected,
            backgroundColor: Colors.transparent,
            onSelectionChange: _onSelectionChanged,
          ),
        ),
      ),
    );
  }
}
