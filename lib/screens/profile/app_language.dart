import 'package:brunstadtv_app/providers/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/option_list.dart';
import '../../helpers/btv_colors.dart';

class AppLanguageScreen extends ConsumerStatefulWidget {
  const AppLanguageScreen({super.key});

  @override
  ConsumerState<AppLanguageScreen> createState() => _AppLanguageScreenState();
}

class _AppLanguageScreenState extends ConsumerState<AppLanguageScreen> {
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

  late String selected;

  Future<void> _onSelectionChanged(String id) async {
    setState(() {
      selected = id;
      // obtain shared preferences
    });
    ref.read(settingsProvider.notifier).setAppLanguage(id);
  }

  @override
  void initState() {
    super.initState();
    selected = ref.read(settingsProvider).appLanguage?.languageCode ?? 'no';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BtvColors.background1,
        title: const Text('App language'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: Divider(
            color: BtvColors.seperatorOnLight.withOpacity(0.3),
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
