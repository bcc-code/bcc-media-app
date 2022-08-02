import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';

class RootScreen extends StatelessWidget {
  static const route = '/';

  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        final bottomNavigationBarItems = provider.screens
            .map((screen) => BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: screen.title))
            .toList();

        final screens = provider.screens
            .map(
              (screen) => Offstage(
                offstage: screen != provider.currentScreen,
                child: Navigator(
                  key: screen.navigatorState,
                  onGenerateRoute: screen.onGenerateRoute,
                ),
              ),
            )
            .toList();

        return WillPopScope(
          onWillPop: () => provider.onWillPop(context),
          child: Scaffold(
            body: IndexedStack(
              index: provider.currentTabIndex,
              children: screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavigationBarItems,
              currentIndex: provider.currentTabIndex,
              onTap: provider.setTab,
            ),
          ),
        );
      },
    );
  }
}
