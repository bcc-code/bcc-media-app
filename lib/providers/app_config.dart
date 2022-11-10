import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/application.graphql.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appConfigProvider = Provider<Future<Query$Application?>>((ref) async {
  return ref.read(gqlClientProvider).query$Application().then((val) {
    return val.parsedData;
  });
});
