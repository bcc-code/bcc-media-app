import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../router/router.gr.dart';

import './avatar.dart';
import './action_buttons.dart';
import './option_list.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late List<Map<String, Object?>> _settingsOptions;
  late List<Map<String, Object?>> _supportOptions;
  late List<Map<String, Object?>> _termsaAndPrivacyOptions;

  _ProfileState() {
    _settingsOptions = [
      {
        'optionName': 'Appspråk',
        'currentSelection': 'English',
        'onPressed': () {
          context.router.push(const AppLanguageScreenRoute());
        },
      },
      {
        'optionName': 'Lydspråk',
        'currentSelection': 'English',
        'onPressed': () {},
      },
      {
        'optionName': 'Språk for undertekster',
        'currentSelection': 'English',
        'onPressed': () {},
      },
      {
        'optionName': 'Video kvalitet',
        'currentSelection': 'Auto',
        'onPressed': () {},
      },
      {
        'optionName': 'Notifikationer',
        'currentSelection': 'Yes',
        'onPressed': () {},
      },
    ];

    _supportOptions = [
      {
        'optionName': 'Nyheder fra BrunstadTV',
        'currentSelection': null,
        'onPressed': () {},
      },
      {
        'optionName': 'Ofte stillede spørsmål',
        'currentSelection': null,
        'onPressed': () {},
      },
      {
        'optionName': 'Kontakt Support',
        'currentSelection': null,
        'onPressed': () {},
      },
    ];

    _termsaAndPrivacyOptions = [
      {
        'optionName': 'Samtykke',
        'currentSelection': null,
        'onPressed': () {},
      },
      {
        'optionName': 'Terms & Conditions',
        'currentSelection': null,
        'onPressed': () {},
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Avatar(),
              ActionButtons(),
              Column(
                children: [
                  OptionList(_settingsOptions),
                  const SizedBox(height: 24),
                  OptionList(_supportOptions),
                  const SizedBox(height: 24),
                  OptionList(_termsaAndPrivacyOptions),
                  const SizedBox(height: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
