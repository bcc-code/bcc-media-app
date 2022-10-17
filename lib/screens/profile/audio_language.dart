import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/option_list.dart';
import '../../providers/settings_service.dart';

class AppAudioLanguage extends ConsumerStatefulWidget {
  const AppAudioLanguage({super.key});

  @override
  ConsumerState<AppAudioLanguage> createState() => _AppAudioLanguageState();
}

class _AppAudioLanguageState extends ConsumerState<AppAudioLanguage> {
  var languageList = [
    Option(
      id: 'afr',
      title: 'Afrikaans (Afrikaans)',
    ),
    Option(
      id: 'deu',
      title: 'Deutsch (German)',
    ),
    Option(
      id: 'eng',
      title: 'English (English)',
    ),
    Option(
      id: 'nl',
      title: 'Nederlands (Dutch)',
    ),
    Option(
      id: 'tur',
      title: 'Türkçe (Turkish)',
    ),
    Option(
      id: 'est',
      title: 'Eesti (Estonian)',
    ),
    Option(
      id: 'spa',
      title: 'Español (Spanish)',
    ),
    Option(
      id: 'fra',
      title: 'Español (Spanish)',
    ),
    Option(
      id: 'ita',
      title: 'Italiano (Italian)',
    ),
    Option(
      id: 'hun',
      title: 'Magyar (Hungarian)',
    ),
    Option(
      id: 'nok',
      title: 'Norsk bokmål (Norwegian Bokmål)',
    ),
  ];

  String selected = 'nok';

  void _onSelectionChanged(String id) {
    setState(() {
      selected = id;
    });
    ref.read(settingsServiceProvider.notifier).setAudioLanguage(id);
  }

  @override
  void initState() {
    super.initState();
    selected = ref.read(settingsServiceProvider).audioLanguage ?? 'no';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(13, 22, 35, 1),
        title: const Text('Lydspråk'),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(6),
          child: Divider(
            color: Color.fromRGBO(204, 221, 255, 0.3),
            height: 1,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: OptionList(
          optionData: languageList,
          currentSelection: selected,
          onSelectionChange: _onSelectionChanged,
        ),
      ),
    );
  }
}
