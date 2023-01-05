// a class that holds a preset of
// common route transition builder
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomTransitionsBuilders {
  static double? dragDistance;

  const CustomTransitionsBuilders._();
  static Widget slideUp(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    var curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOutExpo);
    if (animation.status == AnimationStatus.reverse) {
      curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInExpo);
    }
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(curvedAnimation),
      child: child,
    );
  }

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

  static Route<T> slideLeftRouteBuilder<T>(
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
          curveTween = CurveTween(curve: Curves.easeInQuart);
          curveTweenLeaving = CurveTween(curve: Curves.easeOutQuart);
        } else {
          curveTween = CurveTween(curve: Curves.easeOutQuart);
          curveTweenLeaving = CurveTween(curve: Curves.easeInQuart);
        }
        return SlideTransition(
          position: Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
            CurvedAnimation(parent: animation, curve: curveTween.curve),
          ),
          child: SlideTransition(
            position: Tween(begin: Offset.zero, end: const Offset(-0.5, 0.0)).animate(
              CurvedAnimation(
                parent: animation2,
                curve: curveTweenLeaving.curve,
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }
}

class BottomNavigationScaffold extends StatefulWidget {
  const BottomNavigationScaffold({super.key});

  @override
  State<BottomNavigationScaffold> createState() => _BottomNavigationScaffoldState();
}

class _BottomNavigationScaffoldState extends State<BottomNavigationScaffold> {
  int _currentNavitagionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: IndexedStack(
            index: _currentNavitagionIndex,
            children: const <Widget>[SizedBox(), SizedBox()],
          ),
        ),
        BottomNavigationBar(
            currentIndex: _currentNavitagionIndex,
            onTap: (int value) {
              setState(() {
                _currentNavitagionIndex = value;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.pages), label: 'Sheet'),
              BottomNavigationBarItem(icon: Icon(Icons.route), label: 'Route'),
            ])
      ],
    );
  }
}
