import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/graphql/queries/application.graphql.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appConfigFutureProvider = StateProvider<Future<Query$Application?>>((ref) async {
  return ref.read(apiProvider).queryAppConfig();
});

Future reloadAppConfig(WidgetRef ref) {
  return ref.read(appConfigFutureProvider.notifier).state = ref.read(apiProvider).queryAppConfig();
}
