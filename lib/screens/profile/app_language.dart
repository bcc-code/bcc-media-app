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

  Future<void> _onSelectionChanged(String? id) async {
    if (id == null) return;
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
                    optionData: appLanuageCodes.map((l) => Option(id: l, title: languages[l]!.nativeName)).toList(),
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
