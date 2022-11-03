import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/option_list.dart';
import '../../helpers/btv_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/settings_service.dart';

class AppAudioLanguage extends ConsumerStatefulWidget {
  const AppAudioLanguage({super.key});

  @override
  ConsumerState<AppAudioLanguage> createState() => _AppAudioLanguageState();
}

class _AppAudioLanguageState extends ConsumerState<AppAudioLanguage> {
  var languageList = [
    Option(
      id: 'de',
      title: 'Deutsch',
    ),
    Option(
      id: 'en',
      title: 'English',
    ),
    Option(
      id: 'es',
      title: 'Español',
    ),
    Option(
      id: 'fi',
      title: 'Suomi',
    ),
    Option(
      id: 'fr',
      title: 'Français',
    ),
    Option(
      id: 'hu',
      title: 'Magyar',
    ),
    Option(
      id: 'it',
      title: 'Italiano',
    ),
    Option(
      id: 'nl',
      title: 'Nederlands',
    ),
    Option(
      id: 'no',
      title: 'Norsk',
    ),
    Option(
      id: 'pl',
      title: 'Polski',
    ),
    Option(
      id: 'pt',
      title: 'Português',
    ),
    Option(
      id: 'ro',
      title: 'Română',
    ),
    Option(
      id: 'ru',
      title: 'Pусский',
    ),
    Option(
      id: 'sl',
      title: 'Slovenščina',
    ),
    Option(
      id: 'tr',
      title: 'Türkçe',
    ),
  ];

  String selected = 'nok';

  void _onSelectionChanged(String id) {
    setState(() {
      selected = id;
    });
    ref.read(settingsProvider.notifier).setAudioLanguage(id);
  }

  @override
  void initState() {
    super.initState();
    selected = ref.read(settingsProvider).audioLanguage ?? 'no';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BtvColors.background1,
        title: Text(S.of(context).audioLanguage),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: Divider(
            color: BtvColors.seperatorOnLight.withOpacity(0.3),
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: OptionList(
            optionData: languageList,
            currentSelection: selected,
            onSelectionChange: _onSelectionChanged,
          ),
        ),
      ),
    );
  }
}
