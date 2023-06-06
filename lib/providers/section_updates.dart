import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final sectionUpdatesProvider = StreamProvider.family<DocumentSnapshot, String>((ref, String sectionId) {
  return FirebaseFirestore.instance.collection('updates:sections').doc(sectionId).snapshots();
});
