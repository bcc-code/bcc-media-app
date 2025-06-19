import 'package:flutter_riverpod/flutter_riverpod.dart';

final sessionProvider = StateProvider<Session>((ref) {
  return Session(
    searchSessionId: null,
    sessionId: null,
  );
});

class Session {
  Session({
    required this.sessionId,
    required this.searchSessionId,
  });

  final String? sessionId;
  final String? searchSessionId;
}
