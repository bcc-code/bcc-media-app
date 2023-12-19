import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = StateProvider<SharedPreferences>(
  (ref) => throw UnimplementedError('sharedPreferencesProvider should be overriden in main()'),
);
