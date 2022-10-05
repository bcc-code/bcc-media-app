// a class that holds a preset of
// common route transition builder
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomTransitionsBuilders {
  const CustomTransitionsBuilders._();
  static const RouteTransitionsBuilder slideLeft = _slideLeft;

  static Widget _slideLeft2(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Widget _slideLeft(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(1.0, 0.0),
        ).animate(secondaryAnimation),
        child: child,
      ),
    );
  }

  static Route<T> slideUpAndDown<T>(
    BuildContext context,
    Widget child,
    CustomPage<T> page,
  ) {
    return PageRouteBuilder(
      settings: page,
      pageBuilder: (context, animation, animation2) {
        CurveTween curveTween;
        CurveTween curveTweenLeaving;
        if (animation.status == AnimationStatus.reverse) {
          curveTween = CurveTween(curve: Curves.easeOutQuart);
          curveTweenLeaving = CurveTween(curve: Curves.easeOutQuart);
        } else {
          curveTween = CurveTween(curve: Curves.easeOutQuart);
          curveTweenLeaving = CurveTween(curve: Curves.easeOutQuart);
        }
        return SlideTransition(
          position:
              Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
            CurvedAnimation(parent: animation, curve: curveTween.curve),
          ),
          child: SlideTransition(
            position:
                Tween(begin: Offset.zero, end: const Offset(-0.5, 0.0)).animate(
              CurvedAnimation(
                parent: animation2,
                curve: curveTweenLeaving.curve,
              ),
            ),
            child: page.buildPage(context),
          ),
        );
      },
    );
  }
}
