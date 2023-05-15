import 'package:riverpod/riverpod.dart';

import '../../../../bccm_player.dart';

final playerEventRawStreamProvider = Provider<Stream<Object?>>((ref) {
  return BccmPlayerInterface.instance.playerEventStream;
});

final playerEventStreamProvider = Provider.family<Stream<dynamic>, String>((ref, playerId) {
  return BccmPlayerInterface.instance.playerEventStream.where((event) {
    try {
      return event.playerId == playerId;
    } catch (e) {
      return false; // hacky try-catch because pigeon doesn't support inheritance: https://github.com/flutter/flutter/issues/117819
    }
  });
});
