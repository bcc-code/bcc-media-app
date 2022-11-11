// a class that holds a preset of
// common route transition builder
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomTransitionsBuilders {
  const CustomTransitionsBuilders._();
  static Widget slideUp(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    var curvedAnimation =
        CurvedAnimation(parent: animation, curve: Curves.easeOutExpo);
    if (animation.status == AnimationStatus.reverse) {
      curvedAnimation =
          CurvedAnimation(parent: animation, curve: Curves.easeInExpo);
    }
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(curvedAnimation),
      child: child,
    );
  }

  static Widget slideLeft(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    var curvedAnimation =
        CurvedAnimation(parent: animation, curve: Curves.easeOutExpo);
    if (animation.status == AnimationStatus.reverse) {
      curvedAnimation =
          CurvedAnimation(parent: animation, curve: Curves.easeInExpo);
    }
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(curvedAnimation),
      child: child,
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
            child: child,
          ),
        );
      },
    );
  }

  static Route<T> modalRoute<T>(
    BuildContext context,
    Widget child,
    CustomPage<T> page,
  ) {
    return MaterialWithModalsPageRoute(
      fullscreenDialog: false,
      settings: page,
      builder: (_) => child,
    );
  }

  static Route<T> sheet<T>(
    BuildContext context,
    Widget child,
    CustomPage<T> page,
  ) {
    return CupertinoModalBottomSheetRoute(
      topRadius: Radius.circular(100),
      enableDrag: false,
      expanded: false,
      containerBuilder: (context, animation, child) => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: child,
      ),
      settings: page,
      builder: (_) => child,
    );
  }
}

class BottomNavigationScaffold extends StatefulWidget {
  const BottomNavigationScaffold({super.key});

  @override
  State<BottomNavigationScaffold> createState() =>
      _BottomNavigationScaffoldState();
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
