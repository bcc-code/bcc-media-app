import 'package:bccm_core/bccm_core.dart';
import 'package:riverpod/riverpod.dart';

final watchProgressUpdatedProvider = StreamProvider<WatchProgressUpdatedEvent>((ref) => globalEventBus.on<WatchProgressUpdatedEvent>());

class WatchProgressUpdatedEvent {
  String episodeId;
  int? progress;

  WatchProgressUpdatedEvent({
    required this.episodeId,
    required this.progress,
  });
}

final myListChangedProvider = StreamProvider<MyListChangedEvent>((ref) => globalEventBus.on<MyListChangedEvent>());

class MyListChangedEvent {
  MyListChangedEvent();
}
