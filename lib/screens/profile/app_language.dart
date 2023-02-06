import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/option_list.dart';
import '../../helpers/languages.dart';
import '../../l10n/app_localizations.dart';
import '../../models/analytics/language_changed.dart';
import '../../providers/analytics.dart';

class AppLanguageScreen extends ConsumerStatefulWidget {
  const AppLanguageScreen({super.key});

  @override
  ConsumerState<AppLanguageScreen> createState() => _AppLanguageScreenState();
}

class _AppLanguageScreenState extends ConsumerState<AppLanguageScreen> {
  late String selected;

  Future<void> _onSelectionChanged(String id) async {
    ref.read(analyticsProvider).languageChanged(LanguageChangedEvent(
          languageFrom: selected,
          languageTo: id,
          languageChangeType: 'app',
        ));
    setState(() {
      selected = id;
      // obtain shared preferences
    });
    ref.read(settingsProvider.notifier).setAppLanguage(id);
  }

  @override
  void initState() {
    super.initState();
    selected = ref.read(settingsProvider).appLanguage.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(S.of(context).appLanguage),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: OptionList(
            optionData: languages.map((l) => Option(id: l.code, title: l.nativeName, subTitle: l.englishName)).toList(),
            currentSelection: selected,
            onSelectionChange: _onSelectionChanged,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
