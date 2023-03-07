import 'package:brunstadtv_app/graphql/queries/survey.graphql.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/brunstadtv.dart';

final surveysProvider = StreamProvider<List<Fragment$Survey>>((ref) async* {
  yield await ref.read(apiProvider).getSurveys();
});
