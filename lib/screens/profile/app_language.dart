import 'package:brunstadtv_app/providers/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/option_list.dart';
import '../../helpers/btv_colors.dart';
import '../../helpers/languages.dart';

class AppLanguageScreen extends ConsumerStatefulWidget {
  const AppLanguageScreen({super.key});

  @override
  ConsumerState<AppLanguageScreen> createState() => _AppLanguageScreenState();
}

class _AppLanguageScreenState extends ConsumerState<AppLanguageScreen> {
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
    selected = ref.read(settingsProvider).appLanguage.languageCode;
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
                    optionData: languages
                        .map((l) => Option(id: l.code, title: l.nativeName))
                        .toList(),
                    currentSelection: selected,
                    onSelectionChange: _onSelectionChanged,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
