// a class that holds a preset of
// common route transition builder
import 'package:flutter/material.dart';

class CustomTransitionsBuilders {
  static double? dragDistance;

  const CustomTransitionsBuilders._();
  static RouteTransitionsBuilder slideUp({Curve curveIn = Curves.easeOutExpo, Curve curveOut = Curves.easeInExpo}) =>
      (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        var curvedAnimation = CurvedAnimation(parent: animation, curve: curveIn);
        if (animation.status == AnimationStatus.reverse) {
          curvedAnimation = CurvedAnimation(parent: animation, curve: curveOut);
        }
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );
      };
  static RouteTransitionsBuilder scaleUp({Curve curveIn = Curves.easeOutExpo, Curve curveOut = Curves.easeInExpo}) =>
      (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        if (animation.status != AnimationStatus.reverse) {
          final curvedAnimation = CurvedAnimation(parent: animation, curve: curveIn);
          return ScaleTransition(
            scale: Tween<double>(
              begin: 0.7,
              end: 1.0,
            ).animate(curvedAnimation),
            child: child,
          );
        }
        final curvedAnimation = CurvedAnimation(parent: animation, curve: curveOut);
        return FadeTransition(
          opacity: curvedAnimation,
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.7,
              end: 1.0,
            ).animate(curvedAnimation),
            child: child,
          ),
        );
      };

  static Widget slideLeft(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    var curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOutExpo);
    if (animation.status == AnimationStatus.reverse) {
      curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInExpo);
    }
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(curvedAnimation),
      child: Listener(
        onPointerDown: (event) {
          if (event.position.dx <= 35) {
            dragDistance = 0;
          }
        },
        onPointerMove: (event) {
          if (dragDistance != null && event.delta.dx > -1) {
            dragDistance = dragDistance! + event.delta.dx;
          } else {
            dragDistance = null;
          }
        },
        onPointerUp: (event) {
          if (dragDistance != null && dragDistance! >= 100) {
            Navigator.maybePop(context);
          }
          dragDistance = null;
        },
        onPointerCancel: (event) {
          dragDistance = null;
        },
        child: child,
      ),
    );
  }
}

Curve flippedCurveIfReverse(Animation animation, Curve curve) => animation.status == AnimationStatus.forward ? curve : curve.flipped;
