import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrientationStateWatcher extends StatefulWidget {
  final Widget child;

  const OrientationStateWatcher({super.key, required this.child});

  @override
  State<OrientationStateWatcher> createState() => _OrientationStateWatcherState();
}

class _OrientationStateWatcherState extends State<OrientationStateWatcher> {
  Orientation intendedOrientation = Orientation.landscape;

  @override
  Widget build(BuildContext context) {
    final actual = MediaQuery.orientationOf(context);
    return OrientationController(
      actualOrientation: actual,
      intendedOrientation: intendedOrientation,
      onOrientationRequested: (orientation) async {
        debugPrint("ori ori ${actual}, ${intendedOrientation}");
        setState(() {
          intendedOrientation = orientation;
        });
        if (orientation == Orientation.landscape) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        } else {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        }
      },
      child: widget.child,
    );
  }
}

class OrientationController extends InheritedWidget {
  const OrientationController({
    super.key,
    required super.child,
    required this.intendedOrientation,
    required this.actualOrientation,
    required this.onOrientationRequested,
  });

  final Orientation intendedOrientation;
  final Orientation actualOrientation;
  final void Function(Orientation) onOrientationRequested;
  bool get transitioning => intendedOrientation != actualOrientation;

  void requestOrientation(Orientation orientation) {
    onOrientationRequested(orientation);
  }

  @override
  bool updateShouldNotify(covariant OrientationController oldWidget) {
    return oldWidget.actualOrientation != actualOrientation || oldWidget.intendedOrientation != intendedOrientation;
  }

  static OrientationController? of(BuildContext context) {
    final OrientationController? result = context.dependOnInheritedWidgetOfExactType<OrientationController>();
    return result;
  }

  static OrientationController? read(BuildContext context) {
    final OrientationController? result = context.getInheritedWidgetOfExactType<OrientationController>();
    return result;
  }
}
