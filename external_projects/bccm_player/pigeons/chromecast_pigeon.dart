import 'package:pigeon/pigeon.dart';

// convert from kotlin:
// regex: override fun (.+?)\(.+?\) \{
// replace: @ObjCSelector("$1")\nvoid $1();

@FlutterApi()
abstract class ChromecastPigeon {
  @ObjCSelector("onSessionEnded")
  void onSessionEnded();

  @ObjCSelector("onSessionEnding")
  void onSessionEnding();

  @ObjCSelector("onSessionResumeFailed")
  void onSessionResumeFailed();

  @ObjCSelector("onSessionResumed")
  void onSessionResumed();

  @ObjCSelector("onSessionResuming")
  void onSessionResuming();

  @ObjCSelector("onSessionStartFailed")
  void onSessionStartFailed();

  @ObjCSelector("onSessionStarted")
  void onSessionStarted();

  @ObjCSelector("onSessionStarting")
  void onSessionStarting();

  @ObjCSelector("onSessionSuspended")
  void onSessionSuspended();

  @ObjCSelector("onCastSessionAvailable")
  void onCastSessionAvailable();

  @ObjCSelector("onCastSessionUnavailable:")
  void onCastSessionUnavailable(CastSessionUnavailableEvent event);
}

class CastSessionUnavailableEvent {
  int? playbackPositionMs;
}
