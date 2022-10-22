import 'package:brunstadtv_app/env/dev/firebase_options.dart';
import 'package:brunstadtv_app/setup.dart';

void main() async {
  return setup(firebaseOptions: DefaultFirebaseOptions.currentPlatform);
}
