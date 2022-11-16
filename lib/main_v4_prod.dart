import 'package:brunstadtv_app/env/v4_prod/firebase_options.dart';
import 'package:brunstadtv_app/main.dart';

void main() async {
  return $main(firebaseOptions: DefaultFirebaseOptions.currentPlatform);
}
