import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioOnlyNotifier extends Notifier<bool> {
  late final SharedPreferences _sharedPrefs;

  @override
  bool build() {
    _sharedPrefs = ref.read(sharedPreferencesProvider);
    return _sharedPrefs.getBool(PrefKeys.audioOnly) ?? false;
  }

  void setValue(bool value) {
    _sharedPrefs.setBool(PrefKeys.audioOnly, value);
    state = value;
  }

  void toggle() {
    setValue(!state);
  }
}

final audioOnlyProvider = NotifierProvider<AudioOnlyNotifier, bool>(AudioOnlyNotifier.new);
