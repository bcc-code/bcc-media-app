import 'package:flutter_animate/flutter_animate.dart';

extension AnimationLoop on Animate {
  Animate loop(int count, Animate Function(Animate a) builder) {
    var temp = this;
    for (var i = 0; i < count; i++) {
      temp = builder(temp);
    }
    return temp;
  }
}
