import 'package:brunstadtv_app/screens/music/bmm_api.dart';

String? coverFromTrack(BmmTrack track) {
  return track.meta?.attachedPicture ?? track.meta?.parent?.cover ?? track.meta?.rootParent?.cover;
}
