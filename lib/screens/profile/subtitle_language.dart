import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/option_list.dart';
import '../../components/web/dialog_on_web.dart';
import '../../helpers/languages.dart';
import '../../l10n/app_localizations.dart';
import '../../models/analytics/language_changed.dart';
import '../../providers/analytics.dart';
import '../../providers/settings.dart';

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
    selected = ref.read(settingsProvider).subtitleLanguage;
  }

  void _onSelectionChanged(String? id) {
    setState(() {
      selected = id;
    });
    ref.read(settingsProvider.notifier).setSubtitleLanguage(id);
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
              child: OptionList(
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
