import 'package:pigeon/pigeon.dart';

class Book {
  String? title;
  String? author;
}

@HostApi()
abstract class PlaybackPlatformPigeon {
  @async
  @ObjCSelector("newPlayer:")
  String newPlayer(String? url); 

  @async
  @ObjCSelector("setUrl:")
  void setUrl(SetUrlArgs setUrlArgs);

  @async
  @ObjCSelector("setPrimary:")
  void setPrimary(String id);
}

class SetUrlArgs {
  String playerId;
  
  String url;
  
  bool? isLive;

  SetUrlArgs({required this.playerId, required this.url, this.isLive});
}