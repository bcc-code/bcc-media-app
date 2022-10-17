import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/option_list.dart';
import '../../providers/settings_service.dart';

class AppSubtitleLanguage extends ConsumerStatefulWidget {
  const AppSubtitleLanguage({super.key});

  @override
  ConsumerState<AppSubtitleLanguage> createState() =>
      _AppSubtitleLanguageState();
}

class _AppSubtitleLanguageState extends ConsumerState<AppSubtitleLanguage> {
  var languageList = [
    Option(
      id: 'de',
      title: 'Deutsch (German)',
    ),
    Option(
      id: 'en',
      title: 'English (English)',
    ),
    Option(
      id: 'nl',
      title: 'Nederlands (Dutch)',
    ),
    Option(
      id: 'es',
      title: 'Español (Spanish)',
    ),
    Option(
      id: 'fr',
      title: 'French',
    ),
    Option(
      id: 'it',
      title: 'Italiano (Italian)',
    ),
    Option(
      id: 'hu',
      title: 'Magyar (Hungarian)',
    ),
    Option(
      id: 'no',
      title: 'Norsk bokmål (Norwegian Bokmål)',
    ),
  ];

  String selected = 'Medium';

  void _onSelectionChanged(String id) {
    setState(() {
      selected = id;
    });
    ref.read(settingsServiceProvider.notifier).setSubtitleLanguage(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(13, 22, 35, 1),
        title: const Text('Språk for undertekster'),
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
