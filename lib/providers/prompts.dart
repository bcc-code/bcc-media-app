import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/brunstadtv.dart';
import '../graphql/queries/prompts.graphql.dart';

final promptsProvider = StreamProvider<List<Fragment$Prompt>>((ref) async* {
  yield await ref.read(apiProvider).getPrompts();
});
