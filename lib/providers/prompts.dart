import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/brunstadtv.dart';
import 'package:bccm_core/api.dart';

final promptsProvider = StreamProvider<List<Fragment$Prompt>>((ref) async* {
  yield await ref.read(apiProvider).getPrompts();
});
