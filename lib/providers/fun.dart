import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final tempTitleProvider = StateProvider<String?>((ref) {
  return null;
});

class EaseOutRectTween extends Tween<Rect?> {
  EaseOutRectTween({Rect? begin, Rect? end})
      : super(
            begin: begin != null
                ? Rect.fromLTRB(
                    begin.left, begin.top, begin.right + 10, begin.bottom)
                : null,
            end: end);

  @override
  Rect? lerp(double t) {
    if (end == null || begin == null) {
      return null;
    }
    if (t < 0.1) {
      t = Curves.easeIn.transform(t);
    }
    final lerped = Rect.lerp(begin, end, t);
    if (lerped == null) {
      return null;
    }
    var right = lerped.right;
    if (t > 0.10) {
      right = end!.right + 200;
    }
    return Rect.fromLTRB(lerped.left, lerped.top, right, lerped.bottom);
  }
}

Widget slideBottom(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.easeOutCubic)).animate(animation),
    child: child,
  );
}
