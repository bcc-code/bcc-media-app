import 'package:brunstadtv_app/providers/graphql.dart';
import 'package:bccm_core/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final meProvider = FutureProvider<Query$me?>((ref) {
  return ref.read(gqlClientProvider).query$me().then((value) {
    if (value.exception != null) {
      throw value.exception!;
    }
    return value.parsedData;
  });
});
