import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/me.graphql.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final meProvider = FutureProvider<Query$me?>((ref) {
  return ref.read(gqlClientProvider).query$me().then((value) {
    if (value.exception != null) {
      throw value.exception!;
    }
    return value.parsedData;
  });
});
