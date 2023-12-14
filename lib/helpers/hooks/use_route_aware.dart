import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class _RouteCallbacks implements AutoRouteAware {
  const _RouteCallbacks({
    this.handleDidPopNext,
    this.handleDidPush,
    this.handleDidPop,
    this.handleDidPushNext,
    this.handleDidChangeTabRoute,
    this.handleDidInitTabRoute,
  });

  final VoidCallback? handleDidPopNext;
  final VoidCallback? handleDidPush;
  final VoidCallback? handleDidPop;
  final VoidCallback? handleDidPushNext;
  final void Function(TabPageRoute previousRoute)? handleDidChangeTabRoute;
  final void Function(TabPageRoute previousRoute)? handleDidInitTabRoute;

  @override
  void didPopNext() {
    debugPrint('SHRT: didPopNext');
    handleDidPopNext?.call();
  }

  @override
  void didPush() {
    debugPrint('SHRT: didPush');
    handleDidPush?.call();
  }

  @override
  void didPop() {
    debugPrint('SHRT: didPop');
    handleDidPop?.call();
  }

  @override
  void didPushNext() {
    debugPrint('SHRT: didPushNext');

    handleDidPushNext?.call();
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    handleDidChangeTabRoute?.call(previousRoute);
  }

  @override
  void didInitTabRoute(TabPageRoute? previousRoute) {
    handleDidInitTabRoute?.call(previousRoute!);
  }
}

bool isRouteInCurrentTab(
  TabsRouter tabsRouter,
  RouteData route,
) {
  return [tabsRouter.current.route, ...?tabsRouter.current.route.children].contains(route.route);
}

bool Function() useIsTabActive({
  void Function(bool active)? onChange,
}) {
  final context = useContext();
  final route = context.routeData;
  final tabsController = TabsRouterScope.of(context)?.controller;
  final isActive = useState(true);

  useEffect(() {
    debugPrint('SHRT: route: $route');
    if (tabsController == null) return () {};

    isActive.value = isRouteInCurrentTab(tabsController, route);

    void listener() {
      if (!context.mounted) return;
      final newIsActive = isRouteInCurrentTab(tabsController, route);
      if (newIsActive == isActive.value) return;
      onChange?.call(newIsActive);
      isActive.value = newIsActive;
    }

    debugPrint('tab active isActive: $isActive');

    Future.delayed(const Duration(seconds: 1), listener);
    tabsController.addListener(listener);

    return () => tabsController.removeListener(listener);
  }, [route]);

  return () => isActive.value;
}

AutoRouteObserver? useAutoRouteObserver({
  VoidCallback? didPopNext,
  VoidCallback? didPush,
  VoidCallback? didPop,
  VoidCallback? didPushNext,
  List<Object?> keys = const [],
}) {
  final context = useContext();
  final route = context.routeData;
  final observer = RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();

  useEffect(() {
    if (observer == null) return () {};

    final callbacks = _RouteCallbacks(
      handleDidPop: didPop,
      handleDidPopNext: didPopNext,
      handleDidPush: didPush,
      handleDidPushNext: didPushNext,
    );
    debugPrint('SHRT: observer.subscribe');
    observer.subscribe(callbacks, route);
    return () => observer.unsubscribe(callbacks);
  }, [route, observer, ...keys]);

  return observer;
}
