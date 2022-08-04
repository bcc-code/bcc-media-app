import 'package:flutter/material.dart';
import 'package:my_app/components/player.dart';
import 'package:my_app/screens/episode.dart';
import 'package:my_app/screens/home.dart';
import 'package:provider/provider.dart';

import '../models/screen.dart';
import '../screens/root.dart';

const FIRST_SCREEN = 0;
const SECOND_SCREEN = 1;
const THIRD_SCREEN = 2;

class NavigationProvider extends ChangeNotifier {
  /// Shortcut method for getting [NavigationProvider].
  static NavigationProvider of(BuildContext context) =>
      Provider.of<NavigationProvider>(context, listen: false);

  int _currentScreenIndex = FIRST_SCREEN;

  int get currentTabIndex => _currentScreenIndex;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print('Generating route: ${settings.name}');
    switch (settings.name) {
      /* case PushedScreen.route:
        return MaterialPageRoute(builder: (_) => PushedScreen()); */
      default:
        return MaterialPageRoute(builder: (_) => RootScreen());
    }
  }

  final Map<int, Screen> _screens = {
    FIRST_SCREEN: Screen(
      title: 'Home',
      child: const HomeScreen(),
      initialRoute: '/home',
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Generating route: ${settings.name}');
        switch (settings.name) {
/*           case PushedScreen.route:
            return MaterialPageRoute(builder: (_) => PushedScreen()); */
          default:
            return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
      },
      scrollController: ScrollController(),
    ),
    SECOND_SCREEN: Screen(
      title: 'Second',
      //child: EpisodeScreen(),
      initialRoute: '/episode',
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Generating route: ${settings.name}');
        switch (settings.name) {
          default:
            return MaterialPageRoute(builder: (_) => const EpisodeScreen());
        }
      },
      scrollController: ScrollController(),
    ),
  };

  List<Screen> get screens => _screens.values.toList();

  Screen get currentScreen => _screens[_currentScreenIndex]!;

  /// Set currently visible tab.
  void setTab(int tab) {
    if (tab == currentTabIndex) {
      _scrollToStart();
    } else {
      _currentScreenIndex = tab;
      notifyListeners();
    }
  }

  /// If currently displayed screen has given [ScrollController] animate it
  /// to the start of scroll view.
  void _scrollToStart() {
    if (currentScreen.scrollController != null &&
        currentScreen.scrollController!.hasClients) {
      currentScreen.scrollController!.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Provide this to [WillPopScope] callback.
  Future<bool> onWillPop(BuildContext context) async {
    final currentNavigatorState = currentScreen.navigatorState.currentState;

    if (currentNavigatorState != null && currentNavigatorState.canPop()) {
      currentNavigatorState.pop();
      return false;
    } else {
      if (currentTabIndex != FIRST_SCREEN) {
        setTab(FIRST_SCREEN);
        notifyListeners();
        return false;
      } else {
        return await showDialog(
          context: context,
          builder: (context) => const Text('Exit?'),
        );
      }
    }
  }
}