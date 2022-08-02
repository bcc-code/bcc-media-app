import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/router/router.gr.dart';


class RootScreen extends StatelessWidget {
  static const route = '/';

  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(          
    // list of your tab routes          
    // routes used here must be declaraed as children          
    // routes of /dashboard           
      routes: const [     
        HomeScreenRoute(),   
        SearchScreenRoute(),   
        HomeScreenRoute(),         
        HomeScreenRoute(),         
      ],        

      builder: (context, child, animation) {          
        // obtain the scoped TabsRouter controller using context          
        final tabsRouter = AutoTabsRouter.of(context);          
        // Here we're building our Scaffold inside of AutoTabsRouter          
        // to access the tabsRouter controller provided in this context          
        //           
        //alterntivly you could use a global key          
        return Scaffold(          
            body: child,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Theme.of(context).dividerColor))
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: tabsRouter.activeIndex,          
                onTap: (index) {          
                  // here we switch between tabs          
                  tabsRouter.setActiveIndex(index);          
                },          
                items: const [          
                  BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),    
                  BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),  
                  BottomNavigationBarItem(label: 'Live', icon: Icon(Icons.play_circle_outlined)),  
                  BottomNavigationBarItem(label: 'Calendar', icon: Icon(Icons.calendar_today_outlined)),  
                ],          
              ),
            ));
      }
    );
  }
}
