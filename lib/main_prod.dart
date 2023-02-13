import 'package:brunstadtv_app/env/prod/firebase_options.dart';
import 'package:brunstadtv_app/main.dart';

Future<void> main() async {
  return $main(firebaseOptions: DefaultFirebaseOptions.currentPlatform);
}
