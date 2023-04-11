import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/sections.graphql.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../graphql/queries/page.graphql.dart';

final sectionUpdatesProvider = StreamProvider.family<Fragment$Section, String>((ref, String sectionId) {
  final gqlClient = ref.watch(gqlClientProvider);
  return FirebaseFirestore.instance.collection('updates:sections').doc(sectionId).snapshots().asyncMap((event) async {
    final response = await gqlClient.query$GetSection(
      Options$Query$GetSection(
        variables: Variables$Query$GetSection(
          id: sectionId,
          timestamp: DateTime.now().toIso8601String(),
        ),
      ),
    );
    return response.parsedData!.section;
  });
});
