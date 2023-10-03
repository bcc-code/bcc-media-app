import 'package:brunstadtv_app/main.dart' as parent_main;
import 'package:riverpod/riverpod.dart';

Future<void> $main({
  List<Override>? providerOverrides,
}) async {
  return parent_main.$main();
}
