import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/option_list.dart';
import '../../helpers/btv_colors.dart';
import '../../helpers/languages.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/settings_service.dart';

class AppAudioLanguage extends ConsumerStatefulWidget {
  const AppAudioLanguage({super.key});

  @override
  ConsumerState<AppAudioLanguage> createState() => _AppAudioLanguageState();
}

class _AppAudioLanguageState extends ConsumerState<AppAudioLanguage> {
  late String selected;

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
        elevation: 0,
        title: Text(S.of(context).audioLanguage),
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
                        onSelectionChange: _onSelectionChanged))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
