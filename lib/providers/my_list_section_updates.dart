import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/sections.graphql.dart';
import 'package:riverpod/riverpod.dart';

import '../graphql/queries/page.graphql.dart';

class _MyListUpdateNotifier extends StateNotifier<List> {
  _MyListUpdateNotifier() : super([]);
  void notify() => state = [];
}

final myListUpdateNotifierProvider = StateNotifierProvider<_MyListUpdateNotifier, List>((ref) {
  return _MyListUpdateNotifier();
});

final myListSectionUpdatesProvider = FutureProvider.family<Fragment$Section?, String>((ref, sectionId) async {
  ref.watch(myListUpdateNotifierProvider);
  final result = await ref.watch(gqlClientProvider).query$GetSection(
        Options$Query$GetSection(
          variables: Variables$Query$GetSection(
            id: sectionId,
            timestamp: DateTime.now().toIso8601String(),
          ),
        ),
      );
  return result.parsedData?.section;
});
