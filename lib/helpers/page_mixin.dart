import 'dart:async';

import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/helpers/ui/watch_progress.dart';
import 'package:flutter/material.dart';

import '../models/events/watch_progress.dart';
import 'event_bus.dart';

mixin PageMixin<T extends StatefulWidget> on State<T> {
  StreamSubscription? _watchProgressChanged;
  late Completer<Query$Page$page> pageResult;

  @override
  void initState() {
    super.initState();
    _watchProgressChanged = globalEventBus.on<WatchProgressUpdatedEvent>().listen((event) async {
      if (pageResult.isCompleted) {
        var page = await pageResult.future.timeout(const Duration(milliseconds: 100));
        page = replaceProgressForEpisodeId(page, event.episodeId, event.progress);
        setState(() {
          final completer = Completer<Query$Page$page>.sync()..complete(page);
          pageResult = completer;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _watchProgressChanged?.cancel();
  }
}
