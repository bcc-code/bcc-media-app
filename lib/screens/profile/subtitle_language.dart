import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/option_list.dart';
import '../../helpers/languages_subtitle.dart';
import '../../l10n/app_localizations.dart';
import '../../models/analytics/language_changed.dart';
import '../../providers/analytics.dart';
import '../../providers/settings.dart';

class AppSubtitleLanguage extends ConsumerStatefulWidget {
  const AppSubtitleLanguage({super.key});

  @override
  ConsumerState<AppSubtitleLanguage> createState() => _AppSubtitleLanguageState();
}

class _AppSubtitleLanguageState extends ConsumerState<AppSubtitleLanguage> {
  late String? selected;
  @override
  void initState() {
    super.initState();
    selected = ref.read(settingsProvider).subtitleLanguage ?? noneLanguageCode;
  }

  void _onSelectionChanged(String id) {
    setState(() {
      selected = id;
    });
    final storableId = id == noneLanguageCode ? null : id;
    ref.read(analyticsProvider).languageChanged(LanguageChangedEvent(
          languageFrom: selected,
          languageTo: storableId ?? '',
          languageChangeType: 'subtitle',
        ));
    ref.read(settingsProvider.notifier).setSubtitleLanguage(storableId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(S.of(context).subtitleLanguage),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16).copyWith(bottom: 100),
                  child: OptionList(
                    optionData: subtitleLanguages.map((l) => Option(id: l.code, title: l.nativeName)).toList(),
                    currentSelection: selected,
                    onSelectionChange: _onSelectionChanged,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
