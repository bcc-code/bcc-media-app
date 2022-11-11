import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/option_list.dart';
import '../../helpers/btv_colors.dart';
import '../../helpers/languages.dart';
import '../../providers/settings_service.dart';

class AppSubtitleLanguage extends ConsumerStatefulWidget {
  const AppSubtitleLanguage({super.key});

  @override
  ConsumerState<AppSubtitleLanguage> createState() =>
      _AppSubtitleLanguageState();
}

class _AppSubtitleLanguageState extends ConsumerState<AppSubtitleLanguage> {
  late String selected;
  @override
  void initState() {
    super.initState();
    selected = ref.read(settingsProvider).subtitleLanguage ?? 'no';
  }

  void _onSelectionChanged(String id) {
    setState(() {
      selected = id;
    });
    ref.read(settingsProvider.notifier).setSubtitleLanguage(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BtvColors.background1,
        title: const Text('Språk for undertekster'),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
