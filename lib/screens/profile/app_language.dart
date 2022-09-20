import 'package:flutter/material.dart';
import '../../components/option_list.dart';
import './contact_support.dart';
import './faq.dart';

class Option {
  final String id;
  final String title;
  String? subTitle;

  Option({
    required this.id,
    required this.title,
    this.subTitle,
  });
}

class AppLanguageScreen extends StatefulWidget {
  const AppLanguageScreen({super.key});

  @override
  State<AppLanguageScreen> createState() => _AppLanguageScreenState();
}

class _AppLanguageScreenState extends State<AppLanguageScreen> {
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
      id: 'dut',
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

  void onSelectionChanged(String id) {
    print('onSelectionChanged');
    setState(() {
      selected = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return LoadingPage();
    // return const ContactSupport();
    // return FAQ();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(13, 22, 35, 1),
        title: const Text('App language'),
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
          onSelectionChange: onSelectionChanged,
        ),
      ),
    );
  }
}
