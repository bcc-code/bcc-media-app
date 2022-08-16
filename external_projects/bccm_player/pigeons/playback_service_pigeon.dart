import 'package:pigeon/pigeon.dart';

class Book {
  String? title;
  String? author;
}

@HostApi()
abstract class PlaybackServicePigeon {
  @async
  String newPlayer(String? url);
}